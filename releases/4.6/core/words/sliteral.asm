; ( -- addr len ) (C: addr len -- )
; System
; runtime portion of s" 
;VE_SLITERAL:
;  .dw $ff0a
;  .db "(sliteral)"
;  .dw VE_HEAD
;  .set VE_HEAD = VE_SLITERAL
XT_SLITERAL:
  .dw DO_COLON
PFA_SLITERAL:
  .dw XT_R_FROM   ; ( -- addr )
  .dw XT_DUP      ; ( -- addr addr )
  .dw XT_DUP
  .dw XT_FETCHI   ; ( -- addr addr n )
  .dw XT_SWAP
  .dw XT_1PLUS
  .dw XT_SWAP
  .dw XT_ROT      ; ( -- addr' n addr )
  .dw XT_OVER     ; ( -- addr' n addr n)
  .dw XT_1PLUS
  .dw XT_2SLASH   ; ( -- addr' n addr k )
  .dw XT_PLUS     ; ( -- addr' n addr'' )
  .dw XT_1PLUS
  .dw XT_TO_R     ; ( -- )
  .dw XT_EXIT
