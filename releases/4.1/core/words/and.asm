; ( n1 n2 -- n3 ) Logic
; R( -- )
; bitwise and
VE_AND:
    .dw $ff03
    .db "and",0
    .dw VE_HEAD
    .set VE_HEAD = VE_AND
XT_AND:
    .dw PFA_AND
PFA_AND:
    ld temp0, Y+
    ld temp1, Y+
    and tosl, temp0
    and tosh, temp1
    rjmp DO_NEXT
