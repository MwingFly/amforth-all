; ( -- addr )
; R( -- )
VE_GMARK:
    .db 5, ">mark"
    .dw VE_HEAD
    .set VE_HEAD = VE_GMARK
XT_GMARK:
    .dw DO_COLON
PFA_GMARK:
    .dw XT_HERE
    .dw XT_DOLITERAL
    .dw -1           ; ffff does not erase flash
    .dw XT_COMMA
    .dw XT_EXIT
