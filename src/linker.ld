MEMORY
{
    /* NXP LPC810 */
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 0x00001000 /* 4 Kbytes */
    RAM (rwx) :  ORIGIN = 0x10000000, LENGTH = 0x00000400 /* 1 Kbyte */
}

ENTRY(reset);
EXTERN(DUMMY);
EXTERN(RESET_VECTOR);

SECTIONS
{
    .vector_table ORIGIN(FLASH):
    {
        LONG(ORIGIN(RAM) + LENGTH(RAM)); /* stack */
        KEEP(*(.vector_table.reset_vector));
        KEEP(*(.dummy));
        KEEP(*(.valid_code));
    } > FLASH

    .text :
    {
        *(.text*)
    } > FLASH

    .rodata :
    {
        *(.rodata .rodata.*);
        *(.data.rel.ro);
    } > FLASH

    .ARM.exidx :
    {
        *(.ARM.exidx.*);
    } > RAM
}
