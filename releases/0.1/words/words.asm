; ( -- )

VE_WORDS:
    .db $05, "words"
    .dw VE_LATEST
    .set VE_LATEST = VE_WORDS
XT_WORDS:
    .dw DO_COLON
PFA_WORDS:
    .dw XT_DP
    .dw XT_EFETCH

PFA_WORDS1:
    ; ( addr )
    .dw XT_DUP
    .dw XT_DOLITERAL
    .dw 0
    .dw XT_NOTEQUAL
    .dw XT_DOCONDBRANCH
    .dw PFA_WORDS2
    ; (addr -- addr' )
    .dw XT_ITYPE
    .dw XT_SPACE
    .dw XT_IFETCH
    .dw XT_DOBRANCH
    .dw PFA_WORDS1

PFA_WORDS2:
    .dw XT_DROP
    .dw XT_EXIT
