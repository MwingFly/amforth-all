; ( c -- addr ) 
; Tools
; skip leading delimiter character and parse SOURCE until the next delimiter. copy the word to HERE
VE_WORD:
    .dw $ff04
    .db "word"
    .dw VE_HEAD
    .set VE_HEAD = VE_WORD
XT_WORD:
    .dw DO_COLON
PFA_WORD:
    .dw XT_TO_R     ; ( -- )
    .dw XT_SOURCE   ; ( -- addr len)
    .dw XT_G_IN     ; ( -- addr len >in)
    .dw XT_FETCH
    .dw XT_SLASHSTRING ; ( -- addr' len' )
    ; skip leading char
    .dw XT_SWAP        ; ( -- len' addr' )
    .dw XT_OVER        ; ( -- len' addr' len')
    .dw XT_R_FETCH     ; ( -- len' addr' len' c)
    .dw XT_CSKIP       ; ( -- len' addr'' len'')
    .dw XT_ROT         ; ( -- addr'' len'' len')
    .dw XT_OVER        ; ( -- addr'' len'' len' len'')
    .dw XT_MINUS       ; ( -- addr'' len'' dlen)
    .dw XT_G_IN        ; ( -- addr'' len'' dlen >in)
    .dw XT_PLUSSTORE   ; ( -- addr'' len'')
    ; scan
    .dw XT_R_FROM      ; ( -- addr'' len'' c)
    .dw XT_CSCAN       ; ( -- addr''' len''')
    .dw XT_DUP         ; ( -- addr''' len''' len''')
    .dw XT_1PLUS       ;
    .dw XT_G_IN
    .dw XT_PLUSSTORE   ; ( -- addr''' len''')

    ; move to HERE
    .dw XT_HERE
    .dw XT_PLACE
    ; leave result
    .dw XT_HERE
    .dw XT_EXIT
