; ( -- ) System
; R( -- )
; application specific turnkey action
VE_APPLTURNKEY:
    .db 11, "applturnkey"
    .dw VE_HEAD
    .set VE_HEAD = VE_APPLTURNKEY
XT_APPLTURNKEY:
    .dw DO_COLON
PFA_APPLTURNKEY:
    .dw XT_INTON
    .dw XT_VER
    .dw XT_EXIT
