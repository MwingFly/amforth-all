; ( addr n --  ) 
; Tools
; reads string from flash and prints it
VE_ITYPE:
    .dw $ff05
    .db "itype",0
    .dw VE_HEAD
    .set VE_HEAD = VE_ITYPE
XT_ITYPE:
    .dw DO_COLON
PFA_ITYPE:
    .dw XT_DUP    ; ( --addr len len)
    .dw XT_2SLASH ; ( -- addr len len/2
    .dw XT_SWAP   ; ( -- addr len/2 len
    .dw XT_OVER   ; ( -- addr len/2 len len/2
    .dw XT_2STAR  ; ( -- addr len/2 len len'
    .dw XT_MINUS  ; ( -- addr len/2 rem
    .dw XT_TO_R
    .dw XT_ZERO
    .dw XT_DOQDO
    .dw PFA_ITYPE2
PFA_ITYPE1:
    .dw XT_DUP         ; ( -- addr addr )
    .dw XT_FETCHI      ; ( -- addr c1c2 )
    .dw XT_DUP
    .dw XT_EMIT
    .dw XT_HIEMIT
    .dw XT_1PLUS    ; ( -- addr+cell )
    .dw XT_DOLOOP
    .dw PFA_ITYPE1
PFA_ITYPE2:
    .dw XT_R_FROM
    .dw XT_GREATERZERO
    .dw XT_DOCONDBRANCH
    .dw PFA_ITYPE3
      .dw XT_DUP     ; well, tricky
      .dw XT_FETCHI
      .dw XT_EMIT
PFA_ITYPE3:
    .dw XT_DROP        ; ( -- )
    .dw XT_EXIT

; ( w -- )
; R( -- )
; content of cell fetched on stack.
;VE_HIEMIT:
;    .dw $ff06
;    .db "hiemit"
;    .dw VE_HEAD
;    .set VE_HEAD = VE_HIEMIT
XT_HIEMIT:
    .dw DO_COLON
PFA_HIEMIT:
    .dw XT_BYTESWAP
    .dw XT_EMIT
    .dw XT_EXIT
