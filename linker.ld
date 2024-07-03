/* memory layout of STM32F429XX */
MEMORY
{
  FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 2048K
  RAM(rwx)  : ORIGIN = 0x20000000, LENGTH = 192K
}

/* the entry point */
ENTRY(__reset_handler);

EXTERN(__default_handler);
PROVIDE(__default_irq_handler     = __default_handler);

/*
 * the keyword `PROVIDE` means:
 * set LHS = RHS only when the left symbol does not exists,
 * i.e. the RHS is the default value.
 */

PROVIDE(__non_maskable_interrupt  = __default_handler);
PROVIDE(__hard_fault              = __default_handler);
PROVIDE(__memory_management_fault = __default_handler);
PROVIDE(__bus_fault               = __default_handler);
PROVIDE(__usage_fault             = __default_handler);
PROVIDE(__sv_call                 = __default_handler);
PROVIDE(__debug_monitor           = __default_handler);
PROVIDE(__pend_sv                 = __default_handler);
PROVIDE(__sys_tick                = __default_handler);

PROVIDE(__irq0_handler            = __default_irq_handler);
PROVIDE(__irq1_handler            = __default_irq_handler);
PROVIDE(__irq2_handler            = __default_irq_handler);
PROVIDE(__irq3_handler            = __default_irq_handler);
PROVIDE(__irq4_handler            = __default_irq_handler);
PROVIDE(__irq5_handler            = __default_irq_handler);
PROVIDE(__irq6_handler            = __default_irq_handler);
PROVIDE(__irq7_handler            = __default_irq_handler);
PROVIDE(__irq8_handler            = __default_irq_handler);
PROVIDE(__irq9_handler            = __default_irq_handler);
PROVIDE(__irq10_handler           = __default_irq_handler);
PROVIDE(__irq11_handler           = __default_irq_handler);
PROVIDE(__irq12_handler           = __default_irq_handler);
PROVIDE(__irq13_handler           = __default_irq_handler);
PROVIDE(__irq14_handler           = __default_irq_handler);
PROVIDE(__irq15_handler           = __default_irq_handler);
PROVIDE(__irq16_handler           = __default_irq_handler);
PROVIDE(__irq17_handler           = __default_irq_handler);
PROVIDE(__irq18_handler           = __default_irq_handler);
PROVIDE(__irq19_handler           = __default_irq_handler);
PROVIDE(__irq20_handler           = __default_irq_handler);
PROVIDE(__irq21_handler           = __default_irq_handler);
PROVIDE(__irq22_handler           = __default_irq_handler);
PROVIDE(__irq23_handler           = __default_irq_handler);
PROVIDE(__irq24_handler           = __default_irq_handler);
PROVIDE(__irq25_handler           = __default_irq_handler);
PROVIDE(__irq26_handler           = __default_irq_handler);
PROVIDE(__irq27_handler           = __default_irq_handler);
PROVIDE(__irq28_handler           = __default_irq_handler);
PROVIDE(__irq29_handler           = __default_irq_handler);
PROVIDE(__irq30_handler           = __default_irq_handler);
PROVIDE(__irq31_handler           = __default_irq_handler);
PROVIDE(__irq32_handler           = __default_irq_handler);
PROVIDE(__irq33_handler           = __default_irq_handler);
PROVIDE(__irq34_handler           = __default_irq_handler);
PROVIDE(__irq35_handler           = __default_irq_handler);
PROVIDE(__irq36_handler           = __default_irq_handler);
PROVIDE(__irq37_handler           = __default_irq_handler);
PROVIDE(__irq38_handler           = __default_irq_handler);
PROVIDE(__irq39_handler           = __default_irq_handler);
PROVIDE(__irq40_handler           = __default_irq_handler);
PROVIDE(__irq41_handler           = __default_irq_handler);
PROVIDE(__irq42_handler           = __default_irq_handler);
PROVIDE(__irq43_handler           = __default_irq_handler);
PROVIDE(__irq44_handler           = __default_irq_handler);
PROVIDE(__irq45_handler           = __default_irq_handler);
PROVIDE(__irq46_handler           = __default_irq_handler);
PROVIDE(__irq47_handler           = __default_irq_handler);
PROVIDE(__irq48_handler           = __default_irq_handler);
PROVIDE(__irq49_handler           = __default_irq_handler);
PROVIDE(__irq50_handler           = __default_irq_handler);
PROVIDE(__irq51_handler           = __default_irq_handler);
PROVIDE(__irq52_handler           = __default_irq_handler);
PROVIDE(__irq53_handler           = __default_irq_handler);
PROVIDE(__irq54_handler           = __default_irq_handler);
PROVIDE(__irq55_handler           = __default_irq_handler);
PROVIDE(__irq56_handler           = __default_irq_handler);
PROVIDE(__irq57_handler           = __default_irq_handler);
PROVIDE(__irq58_handler           = __default_irq_handler);
PROVIDE(__irq59_handler           = __default_irq_handler);
PROVIDE(__irq60_handler           = __default_irq_handler);
PROVIDE(__irq61_handler           = __default_irq_handler);
PROVIDE(__irq62_handler           = __default_irq_handler);
PROVIDE(__irq63_handler           = __default_irq_handler);
PROVIDE(__irq64_handler           = __default_irq_handler);
PROVIDE(__irq65_handler           = __default_irq_handler);
PROVIDE(__irq66_handler           = __default_irq_handler);
PROVIDE(__irq67_handler           = __default_irq_handler);
PROVIDE(__irq68_handler           = __default_irq_handler);
PROVIDE(__irq69_handler           = __default_irq_handler);
PROVIDE(__irq70_handler           = __default_irq_handler);
PROVIDE(__irq71_handler           = __default_irq_handler);
PROVIDE(__irq72_handler           = __default_irq_handler);
PROVIDE(__irq73_handler           = __default_irq_handler);
PROVIDE(__irq74_handler           = __default_irq_handler);
PROVIDE(__irq75_handler           = __default_irq_handler);
PROVIDE(__irq76_handler           = __default_irq_handler);
PROVIDE(__irq77_handler           = __default_irq_handler);
PROVIDE(__irq78_handler           = __default_irq_handler);
PROVIDE(__irq79_handler           = __default_irq_handler);
PROVIDE(__irq80_handler           = __default_irq_handler);
PROVIDE(__irq81_handler           = __default_irq_handler);
PROVIDE(__irq82_handler           = __default_irq_handler);
PROVIDE(__irq83_handler           = __default_irq_handler);
PROVIDE(__irq84_handler           = __default_irq_handler);
PROVIDE(__irq85_handler           = __default_irq_handler);
PROVIDE(__irq86_handler           = __default_irq_handler);
PROVIDE(__irq87_handler           = __default_irq_handler);
PROVIDE(__irq88_handler           = __default_irq_handler);
PROVIDE(__irq89_handler           = __default_irq_handler);
PROVIDE(__irq90_handler           = __default_irq_handler);
PROVIDE(__irq91_handler           = __default_irq_handler);
PROVIDE(__irq92_handler           = __default_irq_handler);
PROVIDE(__irq93_handler           = __default_irq_handler);
PROVIDE(__irq94_handler           = __default_irq_handler);
PROVIDE(__irq95_handler           = __default_irq_handler);
PROVIDE(__irq96_handler           = __default_irq_handler);
PROVIDE(__irq97_handler           = __default_irq_handler);
PROVIDE(__irq98_handler           = __default_irq_handler);
PROVIDE(__irq99_handler           = __default_irq_handler);
PROVIDE(__irq100_handler          = __default_irq_handler);
PROVIDE(__irq101_handler          = __default_irq_handler);
PROVIDE(__irq102_handler          = __default_irq_handler);
PROVIDE(__irq103_handler          = __default_irq_handler);
PROVIDE(__irq104_handler          = __default_irq_handler);
PROVIDE(__irq105_handler          = __default_irq_handler);
PROVIDE(__irq106_handler          = __default_irq_handler);
PROVIDE(__irq107_handler          = __default_irq_handler);
PROVIDE(__irq108_handler          = __default_irq_handler);
PROVIDE(__irq109_handler          = __default_irq_handler);
PROVIDE(__irq110_handler          = __default_irq_handler);
PROVIDE(__irq111_handler          = __default_irq_handler);
PROVIDE(__irq112_handler          = __default_irq_handler);
PROVIDE(__irq113_handler          = __default_irq_handler);
PROVIDE(__irq114_handler          = __default_irq_handler);
PROVIDE(__irq115_handler          = __default_irq_handler);
PROVIDE(__irq116_handler          = __default_irq_handler);
PROVIDE(__irq117_handler          = __default_irq_handler);
PROVIDE(__irq118_handler          = __default_irq_handler);
PROVIDE(__irq119_handler          = __default_irq_handler);
PROVIDE(__irq120_handler          = __default_irq_handler);
PROVIDE(__irq121_handler          = __default_irq_handler);
PROVIDE(__irq122_handler          = __default_irq_handler);
PROVIDE(__irq123_handler          = __default_irq_handler);
PROVIDE(__irq124_handler          = __default_irq_handler);
PROVIDE(__irq125_handler          = __default_irq_handler);
PROVIDE(__irq126_handler          = __default_irq_handler);
PROVIDE(__irq127_handler          = __default_irq_handler);
PROVIDE(__irq128_handler          = __default_irq_handler);
PROVIDE(__irq129_handler          = __default_irq_handler);
PROVIDE(__irq130_handler          = __default_irq_handler);
PROVIDE(__irq131_handler          = __default_irq_handler);
PROVIDE(__irq132_handler          = __default_irq_handler);
PROVIDE(__irq133_handler          = __default_irq_handler);
PROVIDE(__irq134_handler          = __default_irq_handler);
PROVIDE(__irq135_handler          = __default_irq_handler);
PROVIDE(__irq136_handler          = __default_irq_handler);
PROVIDE(__irq137_handler          = __default_irq_handler);
PROVIDE(__irq138_handler          = __default_irq_handler);
PROVIDE(__irq139_handler          = __default_irq_handler);
PROVIDE(__irq140_handler          = __default_irq_handler);
PROVIDE(__irq141_handler          = __default_irq_handler);
PROVIDE(__irq142_handler          = __default_irq_handler);
PROVIDE(__irq143_handler          = __default_irq_handler);
PROVIDE(__irq144_handler          = __default_irq_handler);
PROVIDE(__irq145_handler          = __default_irq_handler);
PROVIDE(__irq146_handler          = __default_irq_handler);
PROVIDE(__irq147_handler          = __default_irq_handler);
PROVIDE(__irq148_handler          = __default_irq_handler);
PROVIDE(__irq149_handler          = __default_irq_handler);
PROVIDE(__irq150_handler          = __default_irq_handler);
PROVIDE(__irq151_handler          = __default_irq_handler);
PROVIDE(__irq152_handler          = __default_irq_handler);
PROVIDE(__irq153_handler          = __default_irq_handler);
PROVIDE(__irq154_handler          = __default_irq_handler);
PROVIDE(__irq155_handler          = __default_irq_handler);
PROVIDE(__irq156_handler          = __default_irq_handler);
PROVIDE(__irq157_handler          = __default_irq_handler);
PROVIDE(__irq158_handler          = __default_irq_handler);
PROVIDE(__irq159_handler          = __default_irq_handler);
PROVIDE(__irq160_handler          = __default_irq_handler);
PROVIDE(__irq161_handler          = __default_irq_handler);
PROVIDE(__irq162_handler          = __default_irq_handler);
PROVIDE(__irq163_handler          = __default_irq_handler);
PROVIDE(__irq164_handler          = __default_irq_handler);
PROVIDE(__irq165_handler          = __default_irq_handler);
PROVIDE(__irq166_handler          = __default_irq_handler);
PROVIDE(__irq167_handler          = __default_irq_handler);
PROVIDE(__irq168_handler          = __default_irq_handler);
PROVIDE(__irq169_handler          = __default_irq_handler);
PROVIDE(__irq170_handler          = __default_irq_handler);
PROVIDE(__irq171_handler          = __default_irq_handler);
PROVIDE(__irq172_handler          = __default_irq_handler);
PROVIDE(__irq173_handler          = __default_irq_handler);
PROVIDE(__irq174_handler          = __default_irq_handler);
PROVIDE(__irq175_handler          = __default_irq_handler);
PROVIDE(__irq176_handler          = __default_irq_handler);
PROVIDE(__irq177_handler          = __default_irq_handler);
PROVIDE(__irq178_handler          = __default_irq_handler);
PROVIDE(__irq179_handler          = __default_irq_handler);
PROVIDE(__irq180_handler          = __default_irq_handler);
PROVIDE(__irq181_handler          = __default_irq_handler);
PROVIDE(__irq182_handler          = __default_irq_handler);
PROVIDE(__irq183_handler          = __default_irq_handler);
PROVIDE(__irq184_handler          = __default_irq_handler);
PROVIDE(__irq185_handler          = __default_irq_handler);
PROVIDE(__irq186_handler          = __default_irq_handler);
PROVIDE(__irq187_handler          = __default_irq_handler);
PROVIDE(__irq188_handler          = __default_irq_handler);
PROVIDE(__irq189_handler          = __default_irq_handler);
PROVIDE(__irq190_handler          = __default_irq_handler);
PROVIDE(__irq191_handler          = __default_irq_handler);
PROVIDE(__irq192_handler          = __default_irq_handler);
PROVIDE(__irq193_handler          = __default_irq_handler);
PROVIDE(__irq194_handler          = __default_irq_handler);
PROVIDE(__irq195_handler          = __default_irq_handler);
PROVIDE(__irq196_handler          = __default_irq_handler);
PROVIDE(__irq197_handler          = __default_irq_handler);
PROVIDE(__irq198_handler          = __default_irq_handler);
PROVIDE(__irq199_handler          = __default_irq_handler);
PROVIDE(__irq200_handler          = __default_irq_handler);
PROVIDE(__irq201_handler          = __default_irq_handler);
PROVIDE(__irq202_handler          = __default_irq_handler);
PROVIDE(__irq203_handler          = __default_irq_handler);
PROVIDE(__irq204_handler          = __default_irq_handler);
PROVIDE(__irq205_handler          = __default_irq_handler);
PROVIDE(__irq206_handler          = __default_irq_handler);
PROVIDE(__irq207_handler          = __default_irq_handler);
PROVIDE(__irq208_handler          = __default_irq_handler);
PROVIDE(__irq209_handler          = __default_irq_handler);
PROVIDE(__irq210_handler          = __default_irq_handler);
PROVIDE(__irq211_handler          = __default_irq_handler);
PROVIDE(__irq212_handler          = __default_irq_handler);
PROVIDE(__irq213_handler          = __default_irq_handler);
PROVIDE(__irq214_handler          = __default_irq_handler);
PROVIDE(__irq215_handler          = __default_irq_handler);
PROVIDE(__irq216_handler          = __default_irq_handler);
PROVIDE(__irq217_handler          = __default_irq_handler);
PROVIDE(__irq218_handler          = __default_irq_handler);
PROVIDE(__irq219_handler          = __default_irq_handler);
PROVIDE(__irq220_handler          = __default_irq_handler);
PROVIDE(__irq221_handler          = __default_irq_handler);
PROVIDE(__irq222_handler          = __default_irq_handler);
PROVIDE(__irq223_handler          = __default_irq_handler);
PROVIDE(__irq224_handler          = __default_irq_handler);
PROVIDE(__irq225_handler          = __default_irq_handler);
PROVIDE(__irq226_handler          = __default_irq_handler);
PROVIDE(__irq227_handler          = __default_irq_handler);
PROVIDE(__irq228_handler          = __default_irq_handler);
PROVIDE(__irq229_handler          = __default_irq_handler);
PROVIDE(__irq230_handler          = __default_irq_handler);
PROVIDE(__irq231_handler          = __default_irq_handler);
PROVIDE(__irq232_handler          = __default_irq_handler);
PROVIDE(__irq233_handler          = __default_irq_handler);
PROVIDE(__irq234_handler          = __default_irq_handler);
PROVIDE(__irq235_handler          = __default_irq_handler);
PROVIDE(__irq236_handler          = __default_irq_handler);
PROVIDE(__irq237_handler          = __default_irq_handler);
PROVIDE(__irq238_handler          = __default_irq_handler);
PROVIDE(__irq239_handler          = __default_irq_handler);

/*
 * use the `EXTERN` statement to preserve symbols that NOT directly or
 * indirectly referenced by the entry point.
 */
EXTERN(__RESET_VECTOR);
EXTERN(__EXCEPTIONS);
EXTERN(__INTERRUPTS);

SECTIONS
{
  /* the stack point is the end address of RAM, i.e. `0x20000000 + 0x5000` */
  __stack_pointer = ORIGIN(RAM) + LENGTH(RAM);
  
  .vector_table ORIGIN(FLASH) :
  {
    /* first entry: the initial Stack Pointer (SP) value */
    LONG(__stack_pointer);

    /*
     * second entry: reset handler
     *
     * use the `KEEP` statement to force the linker to insert
     * all input sections named, otherwise the linker will
     * discard the unused sections
     */
    KEEP(*(.vector_table.reset_vector));

    /* the next 14 entries are exception vectors */
    KEEP(*(.vector_table.exceptions));

    /* Device specific interrupts */
    KEEP(*(.vector_table.interrupts));
  } > FLASH

  /* The 'text' section contains the main program code. */
  .text : ALIGN(4)
  {
    *(.text .text.*);
  } > FLASH

  /* The 'rodata' section contains read-only data,
   * constants, strings, information that won't change. */
  .rodata : ALIGN(4)
  {
    *(.rodata .rodata.*);
    . = ALIGN(4);
  } > FLASH

  /* The 'data' section is space set aside in RAM for
   * things like variables, which can change.
   */
  .data : ALIGN(4)
  {
    __sdata = .;
    *(.data .data.*);
    . = ALIGN(4);
    __edata = .;
  } > RAM AT > FLASH

  /* LMA of .data */
  __sidata = LOADADDR(.data);

  /* The 'bss' section is similar to the 'data' section,
   * but its space is initialized to all 0s at the
   * start of the program. */
  .bss (NOLOAD) : ALIGN(4)
  {
    __sbss = .;
    *(.bss .bss.*);
    __ebss = .;
  } > RAM

  . = ALIGN(4);
  __heap_start = .;

  /* Discarded sections */
  /DISCARD/ :
  {
    *(.ARM.exidx);
    *(.ARM.exidx.*);
    *(.ARM.extab.*);
  }
}
