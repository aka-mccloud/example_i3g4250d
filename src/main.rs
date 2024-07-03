#![no_std]
#![no_main]

mod logger;

extern crate rusty_rt;

use log::info;
use logger::UARTLogger;
use rusty_macros::main;
use rusty_peripheral::{
    gpio::{ self, pin::Pin, port::Port, OutputType, PinConfig, Pull, Speed },
    spi::{ self, SPI },
    usart::{ self, StopBits, USARTMode, WordLength },
    PeripheralClock,
};

#[main]
fn main() -> ! {
    init_system_clocks();
    init_pins();

    let uart5 = usart::uart5();

    uart5.enable_clock();
    uart5
        .init(USARTMode::TX, 9600, WordLength::EightBits, StopBits::One, false, None, None)
        .unwrap();

    UARTLogger::init(uart5).expect("Failed to initialize logger!");

    let spi = spi::spi5();

    spi.enable_clock();

    spi.init(
        spi::Mode::Master,
        spi::BusConfiguration::FullDuplex,
        spi::BaudRate::FpclkDiv4,
        spi::DataFrameFormat::Format8Bit,
        spi::ClockPolarity::IdleLow,
        spi::ClockPhase::FirstClockTransition,
        true
    ).unwrap();

    let mut gyro = I3G4250D::new(spi);
    gyro.init().expect("Not a I3G4250D sensor!");

    loop {
        let d = gyro.read();
        info!("x: {}, y: {}, z: {}", d.0, d.1, d.2);
        for _ in 0..20000 {}
    }
}

fn init_system_clocks() {
    // leave default clocks, internal clock 16 MHz
}

fn init_pins() {
    let gpioc = gpio::port(Port::C);
    let gpiod = gpio::port(Port::D);
    let gpiof = gpio::port(Port::F);

    gpioc.enable_clock();
    gpiod.enable_clock();
    gpiof.enable_clock();

    gpioc.init_pins(Pin::PIN1, PinConfig::Output(OutputType::PushPull, Speed::Low, Pull::Up));
    gpioc.init_pins(
        Pin::PIN12,
        PinConfig::Alternate(8, OutputType::PushPull, Speed::High, Pull::None)
    );
    gpiod.init_pins(
        Pin::PIN2,
        PinConfig::Alternate(8, OutputType::PushPull, Speed::High, Pull::None)
    );
    gpiof.init_pins(
        Pin::PIN7 | Pin::PIN8 | Pin::PIN9,
        PinConfig::Alternate(5, OutputType::PushPull, Speed::VeryHigh, Pull::None)
    );

    gpioc.set_pins(Pin::PIN1);
}

struct I3G4250D {
    spi: &'static mut SPI,
}

#[allow(unused)]
impl I3G4250D {
    const SENSOR_ID: u8 = 0xd4;
    const WHO_AM_I: u8 = 0x0f;
    const CTRL_REG1: u8 = 0x20;
    const CTRL_REG2: u8 = 0x21;
    const CTRL_REG3: u8 = 0x22;
    const CTRL_REG4: u8 = 0x23;
    const CTRL_REG5: u8 = 0x24;

    const OUT_TEMP: u8 = 0x26;
    const OUT_X_L: u8 = 0x28;
    const OUT_X_H: u8 = 0x29;
    const OUT_Y_L: u8 = 0x2a;
    const OUT_Y_H: u8 = 0x2b;
    const OUT_Z_L: u8 = 0x2c;
    const OUT_Z_H: u8 = 0x2d;

    pub fn new(spi: &'static mut SPI) -> Self {
        Self { spi }
    }

    pub fn init(&mut self) -> Result<(), ()> {
        let val = self.read_reg(Self::WHO_AM_I);
        if val != Self::SENSOR_ID {
            return Err(());
        }

        self.write_reg(Self::CTRL_REG1, 0xff); // ODR: 760 Hz; Power: normal mode; X, Y, Z: enabled
        self.write_reg(Self::CTRL_REG4, 0x10); // Scale 500 dps
        self.write_reg(Self::CTRL_REG2, 0x00); // High-pass filter 51.4
        self.write_reg(Self::CTRL_REG5, 0x10); // Enable high-pass filter

        Ok(())
    }

    pub fn read(&mut self) -> (i32, i32, i32) {
        let mut x = 0i16;
        let mut y = 0i16;
        let mut z = 0i16;

        let reg4 = self.read_reg(Self::CTRL_REG4);
        if (reg4 & 0x40) == 0 {
            x |= self.read_reg(Self::OUT_X_L) as i16;
            x |= (self.read_reg(Self::OUT_X_H) as i16) << 8;

            y |= self.read_reg(Self::OUT_Y_L) as i16;
            y |= (self.read_reg(Self::OUT_Y_H) as i16) << 8;

            z |= self.read_reg(Self::OUT_Z_L) as i16;
            z |= (self.read_reg(Self::OUT_Z_H) as i16) << 8;
        } else {
            x |= (self.read_reg(Self::OUT_X_L) as i16) << 8;
            x |= self.read_reg(Self::OUT_X_H) as i16;

            y |= (self.read_reg(Self::OUT_Y_L) as i16) << 8;
            y |= self.read_reg(Self::OUT_Y_H) as i16;

            z |= (self.read_reg(Self::OUT_Z_L) as i16) << 8;
            z |= self.read_reg(Self::OUT_Z_H) as i16;
        }

        /* Switch the sensitivity value set in the CRTL4 */
        let s = match reg4 & 0x30 {
            0x00 => 875,
            0x10 => 1750,
            0x20 => 7000,
            _ => 0,
        };

        let x = ((x as i32) * s) / 100;
        let y = ((y as i32) * s) / 100;
        let z = ((z as i32) * s) / 100;

        (x, y, z)
    }

    fn write_reg(&mut self, reg: u8, data: u8) {
        let gpioc = gpio::port(Port::C);

        gpioc.reset_pins(Pin::PIN1);
        self.spi.transmit(reg as _);
        self.spi.transmit(data as _);
        gpioc.set_pins(Pin::PIN1);
    }

    fn read_reg(&mut self, reg: u8) -> u8 {
        let gpioc = gpio::port(Port::C);

        gpioc.reset_pins(Pin::PIN1);
        self.spi.transmit((reg | 0x80) as _);
        let val = self.spi.transmit(0x00);
        gpioc.set_pins(Pin::PIN1);

        val as u8
    }
}
