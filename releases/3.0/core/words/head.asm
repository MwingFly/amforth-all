; ( -- faddr) System Value
; R( -- )
; address of the first unallocated flash cell (below NRWW)
_VE_HEAD:
    .db $04, "head",0
    .dw VE_HEAD
    .set VE_HEAD = _VE_HEAD
XT_HEAD:
    .dw PFA_DOVALUE
PFA_HEAD:
    .dw 4
