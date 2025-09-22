// 1. Define the vector table for the mcu
static VECTOR_TABLE: [Option<unsafe fn()>; 96] = [Some(reset_handler), Some(nmi_handler)];

// 2. Define the reset handler
#[unsafe(no_mangle)]
fn reset_handler() -> ! {
    // 1. Copy the .data section from FLASH to RAM

    // 2. Zero out the .bss section in the RAM

    // 3. Call main()
    crate::main();
}

// 3. Define the exception handlers
