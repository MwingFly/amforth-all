This folder contains some example codes not
related to any application.

adc-pwm-demo.frt: control a servo via PWM using a poti on the adc
    Code contributed by Bruce Wolk.

fib.frt: simple benchmark. calculate a fibonacci number using
    different algorithm.

sieve.frt: not-so simple benchmark modelled after the sieve code
    of Marcel Hendrix. Uses single bits to store the is-prim flag.

run-hayes.frt: demonstrate the use of the amforth-upload.py utility 
    and the special #include syntax. The test itself is a slightly
    modified HAYES test suite

timer-interrupt.frt: demonstrate the use of the timer interrupt with
   forth code. An example usage can be found in timer.frt.
   
queens.frt: solves the queens problem for various size, maybe useful
  as a benchmark.

twi-eeprom.frt: access a I2C (TWI) EEPROM module.

ascii.frt: prints an ascii table on screen

life.frt: Conveys game of life. Its very memory intensive, the example
   code works on an Atmega16, but a bigger one would allow larger
   worlds.