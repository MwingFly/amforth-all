; SPI read/write of dataflash
; Send byte to data flash, get byte returnd by previos command.
; ( txbyte -- rxbyte)
VE_SPIRW:
    .db $05, "spirw"
    .dw VE_HEAD
    .set VE_HEAD  = VE_SPIRW
XT_SPIRW:
    .dw PFA_SPIRW
PFA_SPIRW: 
    out_ SPDR, tosl
PFA_SPIRW1:   
    in_ temp0, SPSR
    sbrs temp0, 7
    rjmp PFA_SPIRW1   ; wait until complete
    in_ tosl, SPDR
    clr tosh
    jmp_ DO_NEXT
