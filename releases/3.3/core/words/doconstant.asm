; ( -- addr )
; R( -- )
; place PFA on TOS
;VE_DOCONSTANT:
;    .dw $ff0a
;    .db "(constant)"
;    .dw VE_HEAD
;    .set VE_HEAD = VE_DOCONSTANT
XT_DOCONSTANT:
    .dw PFA_DOCONSTANT
PFA_DOCONSTANT:
    adiw wl, 1
    savetos
    movw tosl, wl
    rjmp DO_NEXT
