\ test routines for the atmel evaluation
\ boards from www.pollin.de
\ needs the device register definitions loaded

decimal

\ wait some milliseconds
: blinkdelay 250 0 do 1ms loop ;

PORTD 5  portpin: led1
PORTD 6  portpin: led2

PORTD 2 portpin: key1
PORTD 3 portpin: key2
PORTD 4 portpin: key3

GICR  7 portpin: en_int1
GICR  6 portpin: en_int0
GICR  5 portpin: en_int2

: portinit
    led1 is_output
    led2 is_output
    key1 is_input
    key2 is_input
    key3 is_input

    05 MCUCR c! \ int0/1
    en_int1 on
    en_int0 on
    en_int2 off
;

\ test runs until a terminal-key is pressed

\ as long as a key on the board is pressed the
\ corresponding led/buzzer is turned on
: keys
    begin
        PIND c@
	[ hex ] fc and
	3 lshift
	PORTD c!
    key? until
    key drop \ we do not want to keep this key stroke
;


: blink ( -- )
  led1 on blinkdelay
  led2 on blinkdelay
  led2 off blinkdelay
  led1 off blinkdelay
;

: led1blink
  led1 on
  blinkdelay
  led1 off
;

\ simple lights on/off
: led
    begin
	blink
	key?
    until
    key drop \ we do not want to keep this key stroke
;

\ interrupt processing takes a long time, do not
\ press the key while it runs...
' led1blink 1 int!
' noop 2 int!

\ autoconfig the i/o ports
\ ' portinit 'turnkey e!