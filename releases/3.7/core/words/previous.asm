; ( -- ) Search Order
; R( -- )
; remove the first entry in the search order list
VE_PREVIOUS:
    .dw $ff08
    .db "previous"
    .dw VE_HEAD
    .set VE_HEAD = VE_PREVIOUS
XT_PREVIOUS:
    .dw DO_COLON	
PFA_PREVIOUS:
    .dw XT_GET_ORDER
    .dw XT_SWAP
    .dw XT_DROP
    .dw XT_1MINUS
    .dw XT_SET_ORDER
    .dw XT_EXIT
