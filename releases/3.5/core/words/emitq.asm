; ( -- f ) Character IO
; R( -- )
; fetch emit? vector and execute it. should check and return the ready-to-send condition
VE_EMITQ:
    .dw $ff05
    .db "emit?",0
    .dw VE_HEAD
    .set VE_HEAD = VE_EMITQ
XT_EMITQ:
    .dw PFA_DODEFER
PFA_EMITQ:
    .dw 16
    .dw XT_UDEFERFETCH
    .dw XT_UDEFERSTORE
