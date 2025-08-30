/* Define memory regions */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 12K
}

SECTIONS
{
    .text :
    {
        *(.text)
        *(.text.*)
    } > FLASH

    .rodata :
    {
        *(.rodata)
        *(.rodata.*)
    } > FLASH

    .data :
    {
        *(.data)
        *(.data.*)
    } > RAM AT> FLASH

    .bss :
    {
        *(.bss)
        *(.bss.*)
    } > RAM

}
