\ *************************************************
\ some double cell words, mostly taken from gforth
\ more 2x and dx words are in the otional dictionary
\ *************************************************

\ requires cell.frt

\ 2drop	( w1 w2 -- )		core	two_drop
: 2drop
 drop drop ;

\ 2dup	( w1 w2 -- w1 w2 w1 w2 )	core	two_dupe
: 2dup
 over over ;

\ 2over	( w1 w2 w3 w4 -- w1 w2 w3 w4 w1 w2 )	core	two_over
: 2over
  >r >r
  over over
  r>
  rot rot
  r>
  rot rot ;
  
\ 2swap	( w1 w2 w3 w4 -- w3 w4 w1 w2 )	core	two_swap
: 2swap
 rot >r rot r> ;

\ 2rot	( w1 w2 w3 w4 w5 w6 -- w3 w4 w5 w6 w1 w2 )	double-ext	two_rote
: 2rot
 >r >r 2swap r> r> 2swap ;

\ 2nip	( w1 w2 w3 w4 -- w3 w4 )	gforth	two_nip
: 2nip
 2swap 2drop ;

\ 2tuck	( w1 w2 w3 w4 -- w3 w4 w1 w2 w3 w4 )	gforth	two_tuck
: 2tuck
 2swap 2over ;

\ 2@ ( addr -- n1 n2 )
: 2@
  dup ( -- addr addr )
  cell+ ( -- addr addr+2 )
  @     ( -- addr n2 )
  swap  ( -- n2 addr )
  @ ;   ( -- n2 n1 )

\ 2! ( n1 n2 addr -- )
: 2!
  swap ( -- n1 addr n2 )
  over ( -- n1 addr n2 addr )
  !    ( -- n1 addr )
  cell+ ( -- n1 addr+2 )
  ! ;

: 2constant 
    create , ,
    does>
    dup i@ swap 1+ i@ swap
;

: 2variable
    here 2 cells allot constant
;

