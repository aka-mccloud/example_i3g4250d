use core::{fmt::Write, ptr};

use log::Log;
use rusty_peripheral::usart::USART;

static mut LOGGER: UARTLogger = UARTLogger { uart: ptr::null_mut() };

pub struct UARTLogger {
    uart: *mut USART,
}

unsafe impl Send for UARTLogger {}
unsafe impl Sync for UARTLogger {}

impl UARTLogger {
    #[allow(static_mut_refs)]
    pub fn init(uart: &'static mut USART) -> Result<(), ()> {
        unsafe {
            LOGGER.uart = uart as *mut USART;
            log::set_logger(&LOGGER).map_err(|_| ())?;
            log::set_max_level(log::LevelFilter::Trace);
        }

        Ok(())
    }
}

impl Log for UARTLogger {
    fn enabled(&self, _metadata: &log::Metadata) -> bool {
        !self.uart.is_null()
    }

    fn log(&self, record: &log::Record) {
        unsafe {
            self.uart
                .as_mut()
                .unwrap()
                .write_fmt(
                    format_args!(
                        "[{}] <{}> {}\n",
                        record.target(),
                        record.metadata().level(),
                        record.args()
                    )
                )
                .unwrap();
        }
    }

    fn flush(&self) {}
}
