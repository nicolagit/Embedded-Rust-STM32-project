ENTRY(reset_handler)

/* Define memory regions */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 12K
}

_start_of_stack = ORIGIN(RAM) + LENGTH(RAM);
_min_stack_size = 0x400; /* 1KB stack size */
_min_heap_size = 0x400; /* 1KB heap size */

SECTIONS
{
    .text :
    {
        . = ORIGIN(FLASH); /*ALIGN(4);*/
        LONG(_start_of_stack)
        KEEP(*(.isr_vector));
        *(.text)
        *(.text.*)
        . = ALIGN(4);
    } > FLASH

    .rodata :
    {
        . = ALIGN(4);
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
    } > FLASH

    .data :
    {
        _sidata = LOADADDR(.data); /* This returns the FLASH (LMA) address of the data section */
        . = ALIGN(4);
        _sdata = .; /* start of data section in VMA (Virtual Memory Address, i.e. RAM) */
        *(.data)
        *(.data.*)
        . = ALIGN(4);
        _edata = .; /* end of data section */
    } > RAM AT> FLASH /* Flash is LMA, RAM is VMA */

    .bss :
    {
        _sbss = .;
        . = ALIGN(4);
        *(.bss)
        *(.bss.*)
        . = ALIGN(4);
        _ebss = .;
    } > RAM

    .ram_usage_check :
    {
        . = ALIGN(8);
        . = . + _min_stack_size;
        . = . + _min_heap_size;
        . = ALIGN(8);
    } > RAM

}

INCLUDE device_STM32F303.x /*
PROVIDE(BusFault_Handler = Default_Handler);
PROVIDE(MemManage_Handler = Default_Handler);
PROVIDE(PendSV_Handler = Default_Handler);
PROVIDE(SVCall_Handler = Default_Handler);
PROVIDE(SysTick_Handler = Default_Handler);
PROVIDE(UsageFault_Handler = Default_Handler);
PROVIDE(ADC1_2_Handler = Default_Handler);
PROVIDE(ADC3_Handler = Default_Handler);
PROVIDE(ADC4_Handler = Default_Handler);
PROVIDE(CAN_RX1_Handler = Default_Handler);
PROVIDE(CAN_SCE_Handler = Default_Handler);
PROVIDE(COMP123_Handler = Default_Handler);
PROVIDE(COMP456_Handler = Default_Handler);
PROVIDE(COMP7_Handler = Default_Handler);
PROVIDE(DMA1_CH1_Handler = Default_Handler);
PROVIDE(DMA1_CH2_Handler = Default_Handler);
PROVIDE(DMA1_CH3_Handler = Default_Handler);
PROVIDE(DMA1_CH4_Handler = Default_Handler);
PROVIDE(DMA1_CH5_Handler = Default_Handler);
PROVIDE(DMA1_CH6_Handler = Default_Handler);
PROVIDE(DMA1_CH7_Handler = Default_Handler);
PROVIDE(DMA2_CH1_Handler = Default_Handler);
PROVIDE(DMA2_CH2_Handler = Default_Handler);
PROVIDE(DMA2_CH3_Handler = Default_Handler);
PROVIDE(DMA2_CH4_Handler = Default_Handler);
PROVIDE(DMA2_CH5_Handler = Default_Handler);
PROVIDE(EXTI0_Handler = Default_Handler);
PROVIDE(EXTI15_10_Handler = Default_Handler);
PROVIDE(EXTI1_Handler = Default_Handler);
PROVIDE(EXTI2_TSC_Handler = Default_Handler);
PROVIDE(EXTI3_Handler = Default_Handler);
PROVIDE(EXTI4_Handler = Default_Handler);
PROVIDE(EXTI9_5_Handler = Default_Handler);
PROVIDE(FLASH_Handler = Default_Handler);
PROVIDE(FMC_Handler = Default_Handler);
PROVIDE(I2C1_ER_Handler = Default_Handler);
PROVIDE(I2C1_EV_EXTI23_Handler = Default_Handler);
PROVIDE(I2C2_ER_Handler = Default_Handler);
PROVIDE(I2C2_EV_EXTI24_Handler = Default_Handler);
PROVIDE(I2C3_ER_Handler = Default_Handler);
PROVIDE(I2C3_EV_Handler = Default_Handler);
PROVIDE(PVD_Handler = Default_Handler);
PROVIDE(RCC_Handler = Default_Handler);
PROVIDE(RTCAlarm_Handler = Default_Handler);
PROVIDE(RTC_WKUP_Handler = Default_Handler);
PROVIDE(SPI1_Handler = Default_Handler);
PROVIDE(SPI2_Handler = Default_Handler);
PROVIDE(SPI3_Handler = Default_Handler);
PROVIDE(SPI4_Handler = Default_Handler);
PROVIDE(TAMP_STAMP_Handler = Default_Handler);
PROVIDE(TIM1_BRK_TIM15_Handler = Default_Handler);
PROVIDE(TIM1_CC_Handler = Default_Handler);
PROVIDE(TIM1_TRG_COM_TIM17_Handler = Default_Handler);
PROVIDE(TIM1_UP_TIM16_Handler = Default_Handler);
PROVIDE(TIM20_BRK_Handler = Default_Handler);
PROVIDE(TIM20_CC_Handler = Default_Handler);
PROVIDE(TIM20_TRG_COM_Handler = Default_Handler);
PROVIDE(TIM20_UP_Handler = Default_Handler);
PROVIDE(TIM2_Handler = Default_Handler);
PROVIDE(TIM3_Handler = Default_Handler);
PROVIDE(TIM4_Handler = Default_Handler);
PROVIDE(TIM6_DACUNDER_Handler = Default_Handler);
PROVIDE(TIM7_Handler = Default_Handler);
PROVIDE(TIM8_BRK_Handler = Default_Handler);
PROVIDE(TIM8_CC_Handler = Default_Handler);
PROVIDE(TIM8_TRG_COM_Handler = Default_Handler);
PROVIDE(TIM8_UP_Handler = Default_Handler);
PROVIDE(UART4_EXTI34_Handler = Default_Handler);
PROVIDE(UART5_EXTI35_Handler = Default_Handler);
PROVIDE(USART1_EXTI25_Handler = Default_Handler);
PROVIDE(USART2_EXTI26_Handler = Default_Handler);
PROVIDE(USART3_EXTI28_Handler = Default_Handler);
PROVIDE(USB_HP_CAN_TX_Handler = Default_Handler);
PROVIDE(USB_HP_Handler = Default_Handler);
PROVIDE(USB_LP_CAN_RX0_Handler = Default_Handler);
PROVIDE(USB_LP_Handler = Default_Handler);
PROVIDE(USB_WKUP_EXTI_Handler = Default_Handler);
PROVIDE(USB_WKUP_Handler = Default_Handler);
PROVIDE(WWDG_Handler = Default_Handler);*/
PROVIDE(FPU_Handler = Default_Handler);
