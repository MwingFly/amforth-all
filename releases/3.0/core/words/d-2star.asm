; ( d1 -- d2 ) Arithmetics
; R( -- )
; shift a double cell left
VE_D2STAR:
    .db $03, "d2*"
    .dw VE_HEAD
    .set VE_HEAD = VE_D2STAR
XT_D2STAR:
    .dw PFA_D2STAR
PFA_D2STAR:
    ld temp0, Y+
    ld temp1, Y+
    lsl temp0
    rol temp1
    rol tosl
    rol tosh
    st -Y, temp1
    st -Y, temp0
    jmp_ DO_NEXT
