; ( addr n -- ) 
; Character IO
; print a RAM based string
VE_TYPE:
    .dw $ff04
    .db "type"
    .dw VE_HEAD
    .set VE_HEAD = VE_TYPE
XT_TYPE:
    .dw DO_COLON
PFA_TYPE:
    .dw XT_ZERO
    .dw XT_DOQDO
    .dw PFA_TYPE2
PFA_TYPE1:
    .dw XT_DUP
    .dw XT_I
    .dw XT_PLUS
    .dw XT_CFETCH
    .dw XT_EMIT
    .dw XT_DOLOOP
    .dw PFA_TYPE1
PFA_TYPE2:
    .dw XT_DROP
    .dw XT_EXIT
