; ( n  -- ) Stackpointer
; R( -- xy) 
; set return stack pointer
VE_RP_STORE:
    .db $03, "rp!"
    .dw VE_HEAD
    .set VE_HEAD = VE_RP_STORE
XT_RP_STORE:
    .dw PFA_RP_STORE
PFA_RP_STORE:
    in temp2, SREG
    cli
    out SPL, tosl
    out SPH, tosh
    out SREG, temp2
    loadtos
    rjmp DO_NEXT
