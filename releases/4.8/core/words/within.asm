; ( n min max -- f) 
; Compare
; check if n is within min..max
VE_WITHIN:
    .dw $ff06
    .db "within"
    .dw VE_HEAD
    .set VE_HEAD = VE_WITHIN
XT_WITHIN:
    .dw DO_COLON
PFA_WITHIN:
    .dw XT_TO_R
    .dw XT_OVER
    .dw XT_GREATER
    .dw XT_SWAP
    .dw XT_R_FROM
    .dw XT_GREATER
    .dw XT_OR
    .dw XT_EQUALZERO
    .dw XT_EXIT
; alternativly
; : within over - >r - r> u< ;
