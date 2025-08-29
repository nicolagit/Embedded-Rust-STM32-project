/* Define memory regions */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K // 256K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 12K // 64K
    // EEPROM (rwx) : ORIGIN = 0x08080000, LENGTH = 4K
    // CCMRAM (rwx) : ORIGIN = 0x10000000, LENGTH = 64K  
    // BATTRAM (rw) : ORIGIN = 0x40024000, LENGTH = 4K /* Battery backed RAM */
}
