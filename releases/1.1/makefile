# user modifiable secion is up here
DEVICE=atmega32
PROGRAMMER=avr911
PORT=/dev/ttyUSB2

AVRDUDE=avrdude -c $(PROGRAMMER) -p $(DEVICE) -P $(PORT) 

amforth.hex:	amforth.asm usart.asm dict_low.asm dict_high.asm words/*.asm
	avra -I ~/lib/avra --listmac -l amforth.lst -m amforth.map amforth.asm

upload: amforth.hex amforth.eep.hex
	$(AVRDUDE) -e -U flash:w:amforth.hex:i -U eeprom:w:amforth.eep.hex:i

clean:
	rm -f amforth.hex amforth.eep.hex amforth.lst amforth.map amforth.cof amforth.obj

serial:
	screen /dev/ttyUSB0 9600 8N1
