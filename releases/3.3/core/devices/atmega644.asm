.nolist
.include "m644def.inc"
.list

  .equ ramstart = $100 ; first address of RAM

  .equ INTVECTORS = 28
  .equ intvecsize = 2

  .equ amforth_interpreter = $7000

  .equ BAUDRATE_LOW = UBRR0L
  .equ BAUDRATE_HIGH = UBRR0H
  .equ USART_C = UCSR0C
  .equ USART_B = UCSR0B
  .equ USART_A = UCSR0A
  
  .equ USART_B_VALUE = (1<<TXEN0) | (1<<RXEN0) | (1<<RXCIE0)
  .equ USART_C_VALUE = (3<<UCSZ00)

  .equ URXCaddr = URXC0addr
  .equ UDREaddr = UDRE0addr
  .equ UDR = UDR0
  .equ FE = FE0
  .equ DOR = DOR0
  .equ PE = UPE0
  .equ UDRIE = UDRIE0

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


; default interrupt handlers
.org	INT0addr ; External Interrupt0 Vector Address
    rcall isr
.org	INT1addr ; External Interrupt1 Vector Address
    rcall isr
.org	INT2addr ; External Interrupt2 Vector Address
    rcall isr
.org	OVF2addr ; Overflow2 Interrupt Vector Address
    rcall isr
.org	ICP1addr ; Input Capture1 Interrupt Vector Address
    rcall isr
.org	OC1Aaddr ; Output Compare1A Interrupt Vector Address
    rcall isr
.org	OC1Baddr ; Output Compare1B Interrupt Vector Address
    rcall isr
.org	OVF1addr ; Overflow1 Interrupt Vector Address
    rcall isr
.org	OVF0addr ; Overflow0 Interrupt Vector Address
    rcall isr
.org	SPIaddr  ; SPI Interrupt Vector Address
    rcall isr
.org	ADCCaddr ; ADC Interrupt Vector Address
    rcall isr
.org	ERDYaddr ; EEPROM Interrupt Vector Address
    rcall isr
.org	ACIaddr  ; Analog Comparator Interrupt Vector Address
    rcall isr
.org    TWIaddr ; Irq. vector address for Two-Wire Interface
    rcall isr
.org	SPMRaddr ; Store Program Memory Ready Interrupt Vector Address
    rcall isr

mcustring:
  .dw 9
  .db "ATmega644 "
.set codestart = pc
