\ Partname: ATmega161
\ Built using part description XML file version 231
\ generated automatically

hex

\ ANALOG_COMPARATOR
28 constant ACSR	\ Analog Comparator Control And Status Register

\ CPU
56 constant EMCUCR	\ Extended MCU Control Register
55 constant MCUCR	\ MCU Control Register
54 constant MCUSR	\ MCU Status Register
5E constant SPH	\ Stack Pointer High
5D constant SPL	\ Stack Pointer Low
57 constant SPMCR	\ Store Program Memory Control Register
5F constant SREG	\ Status Register

\ EEPROM
3F constant EEARH	\ EEPROM Address Register High Byte
3E constant EEARL	\ EEPROM Address Register Low Byte
3C constant EECR	\ EEPROM Control Register
3D constant EEDR	\ EEPROM Data Register

\ EXTERNAL_INTERRUPT
5A constant GIFR	\ General Interrupt Flag Register
5B constant GIMSK	\ General Interrupt Mask Register

\ PORTA
3A constant DDRA	\ Port A Data Direction Register
39 constant PINA	\ Port A Input Pins
3B constant PORTA	\ Port A Data Register

\ PORTB
37 constant DDRB	\ Port B Data Direction Register
36 constant PINB	\ Port B Input Pins
38 constant PORTB	\ Port B Data Register

\ PORTC
34 constant DDRC	\ Port C Data Direction Register
33 constant PINC	\ Port C Input Pins
35 constant PORTC	\ Port C Data Register

\ PORTD
31 constant DDRD	\ Port D Data Direction Register
30 constant PIND	\ Port D Input Pins
32 constant PORTD	\ Port D Data Register

\ PORTE
26 constant DDRE	\ Port E Data Direction Register
25 constant PINE	\ Port E Input Pins
27 constant PORTE	\ Port E Data Register

\ SPI
2D constant SPCR	\ SPI Control Register
2F constant SPDR	\ SPI Data Register
2E constant SPSR	\ SPI Status Register

\ TIMER_COUNTER_0
51 constant OCR0	\ Output Compare Register
50 constant SFIOR	\ Special Function IO Register
53 constant TCCR0	\ Timer/Counter Control Register
52 constant TCNT0	\ Timer/Counter Register 
58 constant TIFR	\ Timer/Counter Interrupt Flag register
59 constant TIMSK	\ Timer/Counter Interrupt Mask Register

\ TIMER_COUNTER_1
45 constant ICR1H	\ Timer/Counter1 Input Capture Register High Byte
44 constant ICR1L	\ Timer/Counter1 Input Capture Register Low Byte
4B constant OCR1AH	\ Timer/Counter1 Output Compare Register High Byte
4A constant OCR1AL	\ Timer/Counter1 Output Compare Register Low Byte
49 constant OCR1BH	\ Timer/Counter1 Output Compare Register High Byte
48 constant OCR1BL	\ Timer/Counter1 Output Compare Register Low Byte
4F constant TCCR1A	\ Timer/Counter1 Control Register A
4E constant TCCR1B	\ Timer/Counter1 Control Register B
4D constant TCNT1H	\ Timer/Counter1 High Byte
4C constant TCNT1L	\ Timer/Counter1 Low Byte

\ TIMER_COUNTER_2
46 constant ASSR	\ Asynchronous Status Register
42 constant OCR2	\ Timer/Counter2 Output Compare Register
47 constant TCCR2	\ Timer/Counter2 Control Register
43 constant TCNT2	\ Timer/Counter2

\ USART0
29 constant UBRR0	\ USART Baud Rate Register Byte
40 constant UBRRHI	\ High Byte Baud Rate Register
2B constant UCSR0A	\ USART Control and Status Register A
2A constant UCSR0B	\ USART Control and Status Register B
2C constant UDR0	\ USART I/O Data Register

\ USART1
20 constant UBRR1	\ USART Baud Rate Register Byte
22 constant UCSR1A	\ USART Control and Status Register A
21 constant UCSR1B	\ USART Control and Status Register B
23 constant UDR1	\ USART I/O Data Register

\ WATCHDOG
41 constant WDTCR	\ Watchdog Timer Control Register

\ Interrupts
002  constant INT0Addr \ External Interrupt 0
004  constant INT1Addr \ External Interrupt 1
006  constant INT2Addr \ External Interrupt 2
008  constant TIMER2_COMPAddr \ Timer/Counter2 Compare Match
00A  constant TIMER2_OVFAddr \ Timer/Counter2 Overflow
00C  constant TIMER1_CAPTAddr \ Timer/Counter1 Capture Event
00E  constant TIMER1_COMPAAddr \ Timer/Counter1 Compare Match A
010  constant TIMER1_COMPBAddr \ Timer/Counter1 Compare Match B
012  constant TIMER1_OVFAddr \ Timer/Counter1 Overflow
014  constant TIMER0_COMPAddr \ Timer/Counter0 Compare Match
016  constant TIMER0_OVFAddr \ Timer/Counter0 Overflow
018  constant SPISTCAddr \ Serial Transfer Complete
01A  constant UART0RXAddr \ UART0, Rx Complete
01C  constant UART1RXAddr \ UART1, Rx Complete
01E  constant UART0UDREAddr \ UART0 Data Register Empty
020  constant UART1UDREAddr \ UART1 Data Register Empty
022  constant UART0TXAddr \ UART0, Tx Complete
024  constant UART1TXAddr \ UART1, Tx Complete
026  constant EE_RDYAddr \ EEPROM Ready
028  constant ANA_COMPAddr \ Analog Comparator
