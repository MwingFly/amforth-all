;;;; avr forth
;;;;
;;;; GPL V2 (only)

.set pc_ = pc
.org $0000
  jmp_ PFA_COLD
.org pc_
.include "drivers/generic-isr.asm"

.set VE_HEAD = $0000
.set VE_ENVHEAD = $0000
; lower part of the dictionary
.include "dict_appl.inc"

.set DPSTART = pc

.org amforth_interpreter
.include "amforth-interpreter.asm"
.include "dict_appl_core.inc"

.set flashlast = pc
.if (pc>FLASHEND)
  .error "*** Flash size exceeded, please edit your dict_appl_core file to use less space! Aborting."
.endif

.dseg
; define a label for the 1st free ram address
HERESTART:
.cseg
.include "amforth-eeprom.inc"
