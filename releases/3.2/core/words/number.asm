; (addr -- n ) Numeric IO
; R( -- )
; convert a counted string at addr to a number, throw exception -13 on error
VE_NUMBER:
    .dw $ff06
    .db "number"
    .dw VE_HEAD
    .set VE_HEAD = VE_NUMBER
XT_NUMBER:
    .dw DO_COLON
PFA_NUMBER:
    ; sign flag
    .dw XT_DOLITERAL
    .dw 1             ; ( -- addr 1)
    .dw XT_ZERO       ; ( -- addr 1 0)
    .dw XT_ROT        ; ( -- 1 0 addr)
    .dw XT_COUNT      ; ( -- 1 0 addr' len)
    .dw XT_ZERO       ; ( -- 1 0 addr' len 0)
    .dw XT_DODO
    .dw PFA_NUMBER6
PFA_NUMBER1: ; ( -- sign n addr )
    .dw XT_DUP
    .dw XT_I
    .dw XT_PLUS
    .dw XT_CFETCH  ; ( -- sign n addr char )
    ; now check for +/- signs
    .dw XT_DUP
    .dw XT_DOLITERAL
    .dw $2d ; '-'
    .dw XT_EQUAL
    .dw XT_DOCONDBRANCH
    .dw PFA_NUMBER2
    .dw XT_DROP    ; ( -- sign n addr )
    ; replace the sign flag
    .dw XT_ROT
    .dw XT_DROP
    .dw XT_DOLITERAL
    .dw -1
    .dw XT_ROT
    .dw XT_ROT
    .dw XT_DOBRANCH
    .dw PFA_NUMBER4
PFA_NUMBER2:
    .dw XT_DIGITQ
    .dw XT_EQUALZERO
    ; check for non number characters and stop converting if found
    .dw XT_DOCONDBRANCH
    .dw PFA_NUMBER3
    .dw XT_DOLITERAL
    .dw -13
    .dw XT_THROW
PFA_NUMBER3:
    .dw XT_ROT
    .dw XT_BASE
    .dw XT_FETCH
    .dw XT_STAR
    .dw XT_PLUS
    .dw XT_SWAP
PFA_NUMBER4:
    .dw XT_DOLOOP
    .dw PFA_NUMBER1
PFA_NUMBER6:
    .dw XT_DROP
    ; incorporate sign into number
    .dw XT_SWAP
    .dw XT_LESSZERO
    .dw XT_DOCONDBRANCH
    .dw PFA_NUMBER5
    .dw XT_NEGATE
PFA_NUMBER5:
    .dw XT_EXIT
