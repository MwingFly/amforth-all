; ( -- ) Compiler
; R( -- )
; create named entry in the dictionary
VE_COLON:
    .dw $ff01
    .db ":",0
    .dw VE_HEAD
    .set VE_HEAD = VE_COLON
XT_COLON:
    .dw DO_COLON
PFA_COLON:
    .dw XT_DOCREATE
    .dw XT_DOLITERAL
    .dw here
    .set COLON_SMUDGE = here
    .set here = here + cellsize    
    .dw XT_STORE
    
    .dw XT_DP
    .dw XT_DOLITERAL
    .dw here
    .set COLON_XT = here
    .set here = here + cellsize    
    .dw XT_STORE
    
    .dw XT_COMPILE
    .dw DO_COLON

    .dw XT_RBRACKET
    .dw XT_EXIT
