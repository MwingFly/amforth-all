; this dictionary contains optional words
; they may be moved to the core dictionary if needed

.include "drivers/usart-isr-rx.asm"
.include "words/usart-rx-isr.asm"

; use either interrupt transmit
;.include "drivers/usart-isr-tx.asm"
;.include "words/usart-tx-isr.asm"
; or use the poll transmit
.include "words/usart-tx-poll.asm"
; 
.include "words/usart.asm"
.include "words/applturnkey.asm"

.include "words/udot.asm"
.include "words/dot-s.asm"

.include "words/dotstring.asm"
.include "words/squote.asm"

.include "words/words.asm"

.include "words/edefer.asm"
.include "words/rdefer.asm"
.include "words/is.asm"

.include "words/int-store.asm"
.include "words/int-fetch.asm"

.include "dict_compiler.inc"
.include "words/d-invert.asm"
.include "words/d-plus.asm"
.include "words/d-minus.asm"
.include "words/spirw.asm"
