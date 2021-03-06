;;;; avr forth
;;;;
;;;; GPL V2 (only)

.set pc_ = pc

.org $0000
  rjmp amforthstart

.org pc_
; main entry point
amforthstart:
    clr zerol
    clr zeroh
    ; init first user data area
    ldi zl, low(heap)
    ldi zh, high(heap)
    movw upl, zl
    ; init return stack pointer
    ldi temp0,low(ramend)
    out SPL,temp0
    std Z+2, temp0
    ldi temp1,high(ramend)
    out SPH,temp1
    std Z+3, temp1

    ; init parameter stack pointer
    ldi yl,low(stackstart)
    std Z+6, yl
    ldi yh,high(stackstart)
    std Z+7, yh

    ; allocate space for User Area
    .set heap = heap + USERSIZE

    ; load Forth IP with starting word
    ldi xl, low(PFA_COLD)
    ldi xh, high(PFA_COLD)
    ; the following should be turnkey-action, but adds a few more words to the the dictionary
    call_ device_init
    ; its a far jump...
    jmp_ DO_NEXT

; ISR routines
.include "words/intx.asm"
.include "words/usart.asm"

; lower part of the dictionary
.include "dict_minimum.inc"
.if dict_appl==1
 .include "dict_appl.inc"
.endif

.set lowflashlast = pc

; high part of the dictionary (primitives and words for self programming)
.org nrww
; some helper functions

; the inner interpreter.
DO_DODOES:
    adiw wl, 1
    savetos
    movw tosl, wl
    ; the following takes the address from a real uC-call
    pop wh
    pop wl

    push xh
    push xl
    movw xl, wl
    rjmp DO_NEXT

DO_COLON: ; 31 CPU cycles to ijmp
    push xh
    push xl          ; PUSH IP
    adiw wl, 1       ; set W to PFA
    movw xl, wl

DO_NEXT: ; 24 CPU cycles to ijmp
    brts DO_INTERRUPT
    movw zl,xl        ; READ IP
    readflashcell wl, wh
    adiw xl, 1        ; INC IP

DO_EXECUTE: ; 12 cpu cycles to ijmp
    movw zl, wl
    readflashcell temp0,temp1
    movw zl, temp0
    ijmp

DO_INTERRUPT: ; 12 cpu cycles to rjmp (+12=24 to ijmp)
    ; here we deal with interrupts the forth way
    lds temp0, intcur
    ldi zl, LOW(intvec)
    ldi zh, HIGH(intvec)
    add zl, temp0
    adc zh, zeroh
    ldd wl, Z+0
    ldd wh, Z+1

    clt ; clear the t flag to indicate that the interrupt is handled
    rjmp DO_EXECUTE

.include "dict_high.inc"

.if dict_appl==2
 .include "dict_appl.inc"
.endif
.set flashlast = pc

.eseg
    .dw lowflashlast ; DP
    .dw VE_HEAD      ; HEAD
    .dw heap         ; HEAP
    .dw edp          ; EDP
    .dw XT_APPLTURNKEY  ; TURNKEY
    .dw baud_rate    ; BAUDRATE
; 1st free address in EEPROM, see above
edp:
.cseg
