// 1. Define the vector table for the mcu
pub static VECTOR_TABLE: [Option<unsafe fn()>; 48] = [
    Some(reset_handler),
    Some(nmi_handler),
    Some(hardfault_handler),
    Some(mem_manage_handler),
    Some(busfault_handler),
    Some(usagefault_handler),
    None,
    None,
    None,
    None, // Reserved
    None, // SVCall
    None, // DebugMonitor
    None, // Reserved
    None, // PendSV
    None, // SysTick
    // External Interrupts (IRQ0 - IRQ32 for STM32F303K8)
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None, // 15-24
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None, // 25-34
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None, // 35-44
    None,
    None,
    None,
    None, // 45-48
];

#[unsafe(no_mangle)]
fn nmi_handler() {
    loop {}
}

#[unsafe(no_mangle)]
fn hardfault_handler() {
    loop {}
}

#[unsafe(no_mangle)]
fn default_handler() {
    loop {}
}

// 2. Define the reset handler
#[unsafe(no_mangle)]
fn reset_handler() -> ! {
    // 1. Copy the .data section from FLASH to RAM

    // 2. Zero out the .bss section in the RAM

    // 3. Call main()
    crate::main();
}

// 3. Define the exception handlers
