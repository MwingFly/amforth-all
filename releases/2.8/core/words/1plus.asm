; ( n1 -- n2 ) Arithmetics
; R( -- )
; optimized increment
VE_1PLUS:
    .db $02, "1+",0
    .dw VE_HEAD
    .set VE_HEAD = VE_1PLUS
XT_1PLUS:
    .dw PFA_1PLUS
PFA_1PLUS:
    subi tosl, low(-1)
    sbci tosh, high(-1)
    rjmp DO_NEXT
