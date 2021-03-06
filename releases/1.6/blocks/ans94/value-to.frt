\ *******************************************
\ values operate in EEPROM. Usage pattern
\ write seldom read often fits perfectly to it
\ *******************************************
\ Implementation by Ulrich Hoffmann.

: value ( n -- )
      create   edp e@   dup ,   dup 1+ 1+ edp e!   e!
   does> ( -- n )  i@ e@ ; 

: (to) ( n -- )   r> dup 1+ >r   i@  i@  e! ;

: to ( x <name> -- )
    '  1+  state @   if compile (to)  ,  exit then
    i@ e!  ; immediate 
