; ( -- ) Compiler
; R( -- )
; compiles string into dictionary to be typed at runtime
VE_DOTSTRING:
    .db $82, ".",$22,0
    .dw VE_HEAD
    .set VE_HEAD = VE_DOTSTRING
XT_DOTSTRING:
    .dw DO_COLON
PFA_DOTSTRING:
    .dw XT_SQUOTE
    .dw XT_COMPILE
    .dw XT_ITYPE
    .dw XT_EXIT

