; ( xt1 -- xt2 ) System
; R( -- )
; does the real defer@ for user based defers
;VE_UDEFERFETCH:
;    .db $07, "Udefer@"
;    .dw VE_HEAD
;    .set VE_HEAD = VE_UDEFERFETCH
XT_UDEFERFETCH:
    .dw DO_COLON
PFA_UDEFERFETCH:
    .dw XT_1PLUS ; >body
    .dw XT_IFETCH
    .dw XT_UP_FETCH
    .dw XT_PLUS
    .dw XT_FETCH
    .dw XT_EXIT
