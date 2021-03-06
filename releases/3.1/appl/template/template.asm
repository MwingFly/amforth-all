; This is a template for an amforth project.
;
; The order of the entries (esp the include order) must not be 
; changed since it is very important that the settings are in the 
; right order
;
; first is to include the macros from the amforth
; directory 
.include "macros.asm"

; include the amforth device definition file. These
; files include the *def.inc from atmel internally.
.include "devices/atmega168.asm"

; amforth needs two essential parameters
; cpu clock in hertz, 1MHz is factory default
.equ cpu_frequency = 8000000

; initial baud rate of terminal
.equ baud_rate = 9600

.equ HLDSIZE  = $10 ; 16 bit cellsize with binary representation
.equ TIBSIZE  = $64 ; ANS94 needs at least 80 characters per line
.equ USERSIZE = 24  ; size of user area in bytes, at least 24

; addresses of various data segments 
.set heap = ramstart           ; start address of HEAP, grows upward
.set rstackstart = RAMEND      ; start address of return stack, grows downward
.set stackstart  = RAMEND - 80 ; start address of data stack, grows downward

; the application specific dictionary can
;   - not be included, set to 0 (zero)
;   - be included in the rww section: set to 1 (one)
;   - be included in the nrww (bootsector) area: set to 2 (two)
; this  dictionary can be quite large so putting
; it into the bootsector area (NRWW) does make sense for the bigger
; atmegas only (ATmega32 and up) only

.set dict_appl=1

; change only if you know what to you do
.equ CELLSIZE = 2   ; currently the only allowed value is 2 (bytes per cell)

; include the whole source tree.
.include "amforth.asm"
