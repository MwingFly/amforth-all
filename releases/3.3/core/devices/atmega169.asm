.nolist
.include "m169def.inc"
.list

  ; first address of RAM
  .equ ramstart = $100

  .equ INTVECTORS = 23
  .equ intvecsize = 2

  .equ amforth_interpreter = $1c00

.macro jmp_
    jmp @0
.endmacro

.macro call_
    call @0
.endmacro

.macro readflashcell
    lsl zl
    rol zh
    lpm @0, Z+
    lpm @1, Z+
.endmacro

.macro writeflashcell
    lsl zl
    rol zh
.endmacro


; the baud rate registers are memory addresses!
  .equ BAUDRATE_LOW = UBRR0L
  .equ BAUDRATE_HIGH = UBRR0H
  .equ USART_C = UCSR0C
  .equ USART_B = UCSR0B
  .equ USART_A = UCSR0A

  .equ USART_B_VALUE = (1<<TXEN0) | (1<<RXEN0) | (1<<RXCIE0)
  .equ USART_C_VALUE = (1<<UCSZ00)|(1<<UCSZ01)

  .equ PE  = UPE0

  .equ EEPE   = EEWE
  .equ EEMPE  = EEMWE

; interrupt table
.org	INT0addr
    rcall isr   ; External Interrupt Request 0
.org    PCI0addr
    rcall isr   ;Pin Change 0 Interrupt Vector
.org    PCI1addr
    rcall isr   ;Pin Change 1 Interrupt Vector
.org    OC2addr
    rcall isr   ;Timer/Counter2 Compare Match Interrupt Vector
.org    OVF2addr
    rcall isr   ;Timer/Counter2 Overflow Interrupt Vector
.org    ICP1addr
    rcall isr   ;Timer/Counter1 Capture Event Interrupt Vector
.org    OC1Aaddr
    rcall isr   ;Timer/Counter1 Compare Match A Interrupt Vector
.org    OC1Baddr
    rcall isr   ;Timer/Counter1 Compare Match B Interrupt Vector
.org    OVF1addr
    rcall isr   ;Timer/Counter1 Overflow Interrupt Vector
.org    OC0addr
    rcall isr   ;Timer/Counter0 Compare Match Interrupt Vector
.org    OVF0addr
    rcall isr   ;Timer/Counter0 Overflow Interrupt Vector
.org    SPIaddr
    rcall isr   ;SPI Serial Transfer Complete Interrupt Vector
;.org    URXC0addr
;    rcall isr   ;USART, Rx Complete Interrupt Vector
;.org    UDRE0addr
;    rcall isr   ;USART, Data Register Empty Interrupt Vector
.org    UTXC0addr
    rcall isr   ;USART, Tx Complete Interrupt Vector
.org    USI_STARTaddr
    rcall isr   ;USI Start Condition Interrupt Vector
.org    USI_OVFaddr
    rcall isr   ;USI Overflow Interrupt Vector
.org    ACIaddr
    rcall isr   ;Analog Comparator Interrupt Vector
.org    ADCCaddr
    rcall isr   ;ADC Conversion Complete Interrupt Vector
.org    ERDYaddr
    rcall isr   ;EEPROM Ready Interrupt Vector
.org    SPMRaddr
    rcall isr   ;Store Program Memory Ready Interrupt Vector
.org    LCDSFaddr
    rcall isr   ;LCD Start of Frame Interrupt Vector

mcustring:
  .dw 9
  .db "ATmega169",0
.set codestart = pc
