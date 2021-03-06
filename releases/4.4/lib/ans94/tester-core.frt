\ From: John Hayes S1I
\ Subject: core.fr
\ Date: Mon, 27 Nov 95 13:10

\ (C) 1995 JOHNS HOPKINS UNIVERSITY / APPLIED PHYSICS LABORATORY
\ MAY BE DISTRIBUTED FREELY AS LONG AS THIS COPYRIGHT NOTICE REMAINS.
\ VERSION 1.2
\ THIS PROGRAM TESTS THE CORE WORDS OF AN ANS FORTH SYSTEM.
\ THE PROGRAM ASSUMES A TWO'S COMPLEMENT IMPLEMENTATION Where
\ THE RANGE OF SIGNED NUMBERS IS -2^(N-1) ... 2^(N-1)-1 AND
\ THE RANGE OF UNSIGNED NUMBERS IS 0 ... 2^(N)-1.
\ i HAVEN'T FIGURED OUT HOW TO TEST KEY, QUIT, ABORT, OR ABORT"...
\ i ALSO HAVEN'T THOUGHT OF A WAY TO TEST ENVIRONMENT?...

marker ans

TESTING CORE WORDS
hex

\ ------------------------------------------------------------------------
TESTING BASIC ASSUMPTIONS

{ -> }					\ START WITH CLEAN SLATE
( TEST if ANY BITS ARE SET; ANSWER IN base 1 )
{ : bitsset? if 0 0 else  0 then  ; -> }
{  0 bitsset? -> 0 }		( ZERO IS ALL BITS CLEAR )
{  1 bitsset? -> 0 0 }		( OTHER NUMBER HAVE AT LEAST ONE BIT )
{ -1 bitsset? -> 0 0 }

\ ------------------------------------------------------------------------
TESTING BOOLEANS: INVERT AND OR XOR

{ 0 0 and -> 0 }
{ 0 1 and -> 0 }
{ 1 0 and -> 0 }
{ 1 1 and -> 1 }

{ 0 invert 1 and -> 1 }
{ 1 invert 1 and -> 0 }

0	 constant 0S
0 invert constant 1S

{ 0S invert -> 1S }
{ 1S invert -> 0S }

{ 0S 0S and -> 0S }
{ 0S 1S and -> 0S }
{ 1S 0S and -> 0S }
{ 1S 1S and -> 1S }

{ 0S 0S or -> 0S }
{ 0S 1S or -> 1S }
{ 1S 0S or -> 1S }
{ 1S 1S or -> 1S }

{ 0S 0S xor -> 0S }
{ 0S 1S xor -> 1S }
{ 1S 0S xor -> 1S }
{ 1S 1S xor -> 0S }

\ ------------------------------------------------------------------------
TESTING 2* 2/ lshift rshift

( WE TRUST 1S, invert, and bitsset?; WE WILL CONFIRM RSHIFT LATER )
1S 1 rshift invert constant MSB
{ MSB bitsset? -> 0 0 }

{ 0S 2* -> 0S }
{ 1 2* -> 2 }
{ 4000 2* -> 8000 }
{ 1S 2* 1 xor -> 1S }
{ MSB 2* -> 0S }

{ 0S 2/ -> 0S }
{ 1 2/ -> 0 }
{ 4000 2/ -> 2000 }
{ 1S 2/ -> 1S }				\ MSB PROPOGATED
{ 1S 1 xor 2/ -> 1S }
{ MSB 2/ MSB and -> MSB }

{ 1 0 lshift -> 1 }
{ 1 1 lshift -> 2 }
{ 1 2 lshift -> 4 }
{ 1 F lshift -> 8000 }			\ BIGGEST GUARANTEED SHIFT
{ 1S 1 lshift 1 xor -> 1S }
{ MSB 1 lshift -> 0 }

{ 1 0 rshift -> 1 }
{ 1 1 rshift -> 0 }
{ 2 1 rshift -> 1 }
{ 4 2 rshift -> 1 }
{ 8000 F rshift -> 1 }			\ BIGGEST
{ MSB 1 rshift MSB and -> 0 }		\ rshift ZERO FILLS MSBS
{ MSB 1 rshift 2* -> MSB }

\ ------------------------------------------------------------------------
TESTING COMPARISONS: 0= = 0< < > U< MIN MAX
0 invert			constant MAX-UINT
0 invert 1 rshift		constant MAX-INT
0 invert 1 rshift invert	constant MIN-INT
0 invert 1 rshift		constant MID-UINT
0 invert 1 rshift invert	constant MID-UINT+1

0S constant <FALSE>
1S constant <TRUE>

{ 0 0= -> <TRUE> }
{ 1 0= -> <FALSE> }
{ 2 0= -> <FALSE> }
{ -1 0= -> <FALSE> }
{ MAX-UINT 0= -> <FALSE> }
{ MIN-INT 0= -> <FALSE> }
{ MAX-INT 0= -> <FALSE> }

{ 0 0 = -> <TRUE> }
{ 1 1 = -> <TRUE> }
{ -1 -1 = -> <TRUE> }
{ 1 0 = -> <FALSE> }
{ -1 0 = -> <FALSE> }
{ 0 1 = -> <FALSE> }
{ 0 -1 = -> <FALSE> }

{ 0 0< -> <FALSE> }
{ -1 0< -> <TRUE> }
{ MIN-INT 0< -> <TRUE> }
{ 1 0< -> <FALSE> }
{ MAX-INT 0< -> <FALSE> }

{ 0 1 < -> <TRUE> }
{ 1 2 < -> <TRUE> }
{ -1 0 < -> <TRUE> }
{ -1 1 < -> <TRUE> }
{ MIN-INT 0 < -> <TRUE> }
{ MIN-INT MAX-INT < -> <TRUE> }
{ 0 MAX-INT < -> <TRUE> }
{ 0 0 < -> <FALSE> }
{ 1 1 < -> <FALSE> }
{ 1 0 < -> <FALSE> }
{ 2 1 < -> <FALSE> }
{ 0 -1 < -> <FALSE> }
{ 1 -1 < -> <FALSE> }
{ 0 MIN-INT < -> <FALSE> }
{ MAX-INT MIN-INT < -> <FALSE> }
{ MAX-INT 0 < -> <FALSE> }

{ 0 1 > -> <FALSE> }
{ 1 2 > -> <FALSE> }
{ -1 0 > -> <FALSE> }
{ -1 1 > -> <FALSE> }
{ MIN-INT 0 > -> <FALSE> }
{ MIN-INT MAX-INT > -> <FALSE> }
{ 0 MAX-INT > -> <FALSE> }
{ 0 0 > -> <FALSE> }
{ 1 1 > -> <FALSE> }
{ 1 0 > -> <TRUE> }
{ 2 1 > -> <TRUE> }
{ 0 -1 > -> <TRUE> }
{ 1 -1 > -> <TRUE> }
{ 0 MIN-INT > -> <TRUE> }
{ MAX-INT MIN-INT > -> <TRUE> }
{ MAX-INT 0 > -> <TRUE> }

{ 0 1 u< -> <TRUE> }
{ 1 2 u< -> <TRUE> }
{ 0 MID-UINT u< -> <TRUE> }
{ 0 MAX-UINT u< -> <TRUE> }
{ MID-UINT MAX-UINT u< -> <TRUE> }
{ 0 0 u< -> <FALSE> }
{ 1 1 u< -> <FALSE> }
{ 1 0 u< -> <FALSE> }
{ 2 1 u< -> <FALSE> }
{ MID-UINT 0 u< -> <FALSE> }
{ MAX-UINT 0 u< -> <FALSE> }
{ MAX-UINT MID-UINT u< -> <FALSE> }

{ 0 1 min -> 0 }
{ 1 2 min -> 1 }
{ -1 0 min -> -1 }
{ -1 1 min -> -1 }
{ MIN-INT 0 min -> MIN-INT }
{ MIN-INT MAX-INT min -> MIN-INT }
{ 0 MAX-INT min -> 0 }
{ 0 0 min -> 0 }
{ 1 1 min -> 1 }
{ 1 0 min -> 0 }
{ 2 1 min -> 1 }
{ 0 -1 min -> -1 }
{ 1 -1 min -> -1 }
{ 0 MIN-INT min -> MIN-INT }
{ MAX-INT MIN-INT min -> MIN-INT }
{ MAX-INT 0 min -> 0 }

{ 0 1 max -> 1 }
{ 1 2 max -> 2 }
{ -1 0 max -> 0 }
{ -1 1 max -> 1 }
{ MIN-INT 0 max -> 0 }
{ MIN-INT MAX-INT max -> MAX-INT }
{ 0 MAX-INT max -> MAX-INT }
{ 0 0 max -> 0 }
{ 1 1 max -> 1 }
{ 1 0 max -> 1 }
{ 2 1 max -> 2 }
{ 0 -1 max -> 0 }
{ 1 -1 max -> 1 }
{ 0 MIN-INT max -> 0 }
{ MAX-INT MIN-INT max -> MAX-INT }
{ MAX-INT 0 max -> MAX-INT }

\ ------------------------------------------------------------------------
TESTING STACK OPS: 2drop 2dup 2over 2swap ?dup depth drop dup over rot swap

{ 1 2 2drop -> }
{ 1 2 2dup -> 1 2 1 2 }
{ 1 2 3 4 2over -> 1 2 3 4 1 2 }
{ 1 2 3 4 2swap -> 3 4 1 2 }
{ 0 ?dup -> 0 }
{ 1 ?dup -> 1 1 }
{ -1 ?dup -> -1 -1 }
{ depth -> 0 }
{ 0 depth -> 0 1 }
{ 0 1 depth -> 0 1 2 }
{ 0 drop -> }
{ 1 2 drop -> 1 }
{ 1 dup -> 1 1 }
{ 1 2 over -> 1 2 1 }
{ 1 2 3 rot -> 2 3 1 }
{ 1 2 swap -> 2 1 }

\ ------------------------------------------------------------------------
TESTING >r r> r@

{ : GR1 >r r> ; -> }
{ : GR2 >r r@ r> drop ; -> }
{ 123 GR1 -> 123 }
{ 123 GR2 -> 123 }
{ 1S GR1 -> 1S }   ( RETURN STACK HOLDS cells )

\ ------------------------------------------------------------------------
TESTING ADD/SUBTRACT: + - 1+ 1- ABS NEGATE

{ 0 5 + -> 5 }
{ 5 0 + -> 5 }
{ 0 -5 + -> -5 }
{ -5 0 + -> -5 }
{ 1 2 + -> 3 }
{ 1 -2 + -> -1 }
{ -1 2 + -> 1 }
{ -1 -2 + -> -3 }
{ -1 1 + -> 0 }
{ MID-UINT 1 + -> MID-UINT+1 }

{ 0 5 - -> -5 }
{ 5 0 - -> 5 }
{ 0 -5 - -> 5 }
{ -5 0 - -> -5 }
{ 1 2 - -> -1 }
{ 1 -2 - -> 3 }
{ -1 2 - -> -3 }
{ -1 -2 - -> 1 }
{ 0 1 - -> -1 }
{ MID-UINT+1 1 - -> MID-UINT }

{ 0 1+ -> 1 }
{ -1 1+ -> 0 }
{ 1 1+ -> 2 }
{ MID-UINT 1+ -> MID-UINT+1 }

{ 2 1- -> 1 }
{ 1 1- -> 0 }
{ 0 1- -> -1 }
{ MID-UINT+1 1- -> MID-UINT }

{ 0 negate -> 0 }
{ 1 negate -> -1 }
{ -1 negate -> 1 }
{ 2 negate -> -2 }
{ -2 negate -> 2 }

{ 0 abs -> 0 }
{ 1 abs -> 1 }
{ -1 abs -> 1 }
{ MIN-INT abs -> MID-UINT+1 }

\ ------------------------------------------------------------------------
TESTING MULTIPLY: s>d * M* UM*

{ 0 s>d -> 0 0 }
{ 1 s>d -> 1 0 }
{ 2 s>d -> 2 0 }
{ -1 s>d -> -1 -1 }
{ -2 s>d -> -2 -1 }
{ MIN-INT s>d -> MIN-INT -1 }
{ MAX-INT s>d -> MAX-INT 0 }

{ 0 0 m* -> 0 s>d }
{ 0 1 m* -> 0 s>d }
{ 1 0 m* -> 0 s>d }
{ 1 2 m* -> 2 s>d }
{ 2 1 m* -> 2 s>d }
{ 3 3 m* -> 9 s>d }
{ -3 3 m* -> -9 s>d }
{ 3 -3 m* -> -9 s>d }
{ -3 -3 m* -> 9 s>d }
{ 0 MIN-INT m* -> 0 s>d }
{ 1 MIN-INT m* -> MIN-INT s>d }
{ 2 MIN-INT m* -> 0 1S }
{ 0 MAX-INT m* -> 0 s>d }
{ 1 MAX-INT m* -> MAX-INT s>d }
{ 2 MAX-INT m* -> MAX-INT 1 lshift 0 }
{ MIN-INT MIN-INT m* -> 0 MSB 1 rshift }
{ MAX-INT MIN-INT m* -> MSB MSB 2/ }
{ MAX-INT MAX-INT m* -> 1 MSB 2/ invert }

{ 0 0 * -> 0 }				\ TEST IDENTITIES
{ 0 1 * -> 0 }
{ 1 0 * -> 0 }
{ 1 2 * -> 2 }
{ 2 1 * -> 2 }
{ 3 3 * -> 9 }
{ -3 3 * -> -9 }
{ 3 -3 * -> -9 }
{ -3 -3 * -> 9 }

{ MID-UINT+1 1 rshift 2 * -> MID-UINT+1 }
{ MID-UINT+1 2 rshift 4 * -> MID-UINT+1 }
{ MID-UINT+1 1 rshift MID-UINT+1 or 2 * -> MID-UINT+1 }

{ 0 0 um* -> 0 0 }
{ 0 1 um* -> 0 0 }
{ 1 0 um* -> 0 0 }
{ 1 2 um* -> 2 0 }
{ 2 1 um* -> 2 0 }
{ 3 3 um* -> 9 0 }

{ MID-UINT+1 1 rshift 2 um* -> MID-UINT+1 0 }
{ MID-UINT+1 2 um* -> 0 1 }
{ MID-UINT+1 4 um* -> 0 2 }
{ 1S 2 um* -> 1S 1 lshift 1 }
{ MAX-UINT MAX-UINT um* -> 1 1 invert }

\ ------------------------------------------------------------------------
TESTING DIVIDE: fm/mod sm/rem um/mod */ */mod / /mod mod

{ 0 s>d 1 fm/mod -> 0 0 }
{ 1 s>d 1 fm/mod -> 0 1 }
{ 2 s>d 1 fm/mod -> 0 2 }
{ -1 s>d 1 fm/mod -> 0 -1 }
{ -2 s>d 1 fm/mod -> 0 -2 }
{ 0 s>d -1 fm/mod -> 0 0 }
{ 1 s>d -1 fm/mod -> 0 -1 }
{ 2 s>d -1 fm/mod -> 0 -2 }
{ -1 s>d -1 fm/mod -> 0 1 }
{ -2 s>d -1 fm/mod -> 0 2 }
{ 2 s>d 2 fm/mod -> 0 1 }
{ -1 s>d -1 fm/mod -> 0 1 }
{ -2 s>d -2 fm/mod -> 0 1 }
{  7 s>d  3 fm/mod -> 1 2 }
{  7 s>d -3 fm/mod -> -2 -3 }
{ -7 s>d  3 fm/mod -> 2 -3 }
{ -7 s>d -3 fm/mod -> -1 2 }
{ MAX-INT s>d 1 fm/mod -> 0 MAX-INT }
{ MIN-INT s>d 1 fm/mod -> 0 MIN-INT }
{ MAX-INT s>d MAX-INT fm/mod -> 0 1 }
{ MIN-INT s>d MIN-INT fm/mod -> 0 1 }
{ 1S 1 4 fm/mod -> 3 MAX-INT }
{ 1 MIN-INT m* 1 fm/mod -> 0 MIN-INT }
{ 1 MIN-INT m* MIN-INT fm/mod -> 0 1 }
{ 2 MIN-INT m* 2 fm/mod -> 0 MIN-INT }
{ 2 MIN-INT m* MIN-INT fm/mod -> 0 2 }
{ 1 MAX-INT m* 1 fm/mod -> 0 MAX-INT }
{ 1 MAX-INT m* MAX-INT fm/mod -> 0 1 }
{ 2 MAX-INT m* 2 fm/mod -> 0 MAX-INT }
{ 2 MAX-INT m* MAX-INT fm/mod -> 0 2 }
{ MIN-INT MIN-INT m* MIN-INT fm/mod -> 0 MIN-INT }
{ MIN-INT MAX-INT m* MIN-INT fm/mod -> 0 MAX-INT }
{ MIN-INT MAX-INT m* MAX-INT fm/mod -> 0 MIN-INT }
{ MAX-INT MAX-INT m* MAX-INT fm/mod -> 0 MAX-INT }

{ 0 s>d 1 sm/rem -> 0 0 }
{ 1 s>d 1 sm/rem -> 0 1 }
{ 2 s>d 1 sm/rem -> 0 2 }
{ -1 s>d 1 sm/rem -> 0 -1 }
{ -2 s>d 1 sm/rem -> 0 -2 }
{ 0 s>d -1 sm/rem -> 0 0 }
{ 1 s>d -1 sm/rem -> 0 -1 }
{ 2 s>d -1 sm/rem -> 0 -2 }
{ -1 s>d -1 sm/rem -> 0 1 }
{ -2 s>d -1 sm/rem -> 0 2 }
{ 2 s>d 2 sm/rem -> 0 1 }
{ -1 s>d -1 sm/rem -> 0 1 }
{ -2 s>d -2 sm/rem -> 0 1 }
{  7 s>d  3 sm/rem -> 1 2 }
{  7 s>d -3 sm/rem -> 1 -2 }
{ -7 s>d  3 sm/rem -> -1 -2 }
{ -7 s>d -3 sm/rem -> -1 2 }
{ MAX-INT s>d 1 sm/rem -> 0 MAX-INT }
{ MIN-INT s>d 1 sm/rem -> 0 MIN-INT }
{ MAX-INT s>d MAX-INT sm/rem -> 0 1 }
{ MIN-INT s>d MIN-INT sm/rem -> 0 1 }
{ 1S 1 4 sm/rem -> 3 MAX-INT }
{ 2 MIN-INT m* 2 sm/rem -> 0 MIN-INT }
{ 2 MIN-INT m* MIN-INT sm/rem -> 0 2 }
{ 2 MAX-INT m* 2 sm/rem -> 0 MAX-INT }
{ 2 MAX-INT m* MAX-INT sm/rem -> 0 2 }
{ MIN-INT MIN-INT m* MIN-INT sm/rem -> 0 MIN-INT }
{ MIN-INT MAX-INT m* MIN-INT sm/rem -> 0 MAX-INT }
{ MIN-INT MAX-INT m* MAX-INT sm/rem -> 0 MIN-INT }
{ MAX-INT MAX-INT m* MAX-INT sm/rem -> 0 MAX-INT }

{ 0 0 1 um/mod -> 0 0 }
{ 1 0 1 um/mod -> 0 1 }
{ 1 0 2 um/mod -> 1 0 }
{ 3 0 2 um/mod -> 1 1 }
{ MAX-UINT 2 um* 2 um/mod -> 0 MAX-UINT }
{ MAX-UINT 2 um* MAX-UINT um/mod -> 0 2 }
{ MAX-UINT MAX-UINT um* MAX-UINT um/mod -> 0 MAX-UINT }

: IFFLOORED
   [ -3 2 / -2 = invert ] literal if postpone \ then  ;
: IFSYM
   [ -3 2 / -1 = invert ] literal if postpone \ then  ;

\ THE SYSTEM MIGHT do EITHER FLOORED or SYMMETRIC DIVISION.
\ SINCE WE HAVE ALREADY TESTED M*, fm/mod, and sm/rem WE CAN USE THEM IN TEST.
IFFLOORED : t/mod  >r s>d r> fm/mod ;
IFFLOORED : t/     t/mod swap drop ;
IFFLOORED : tmod   t/mod drop ;
IFFLOORED : t*/mod >r m* r> fm/mod ;
IFFLOORED : t*/    t*/mod swap drop ;
IFSYM     : t/mod  >r s>d r> sm/rem ;
IFSYM     : t/     t/mod swap drop ;
IFSYM     : tmod   t/mod drop ;
IFSYM     : t*/mod >r m* r> sm/rem ;
IFSYM     : t*/    t*/mod swap drop ;

{ 0 1 /mod -> 0 1 t/mod }
{ 1 1 /mod -> 1 1 t/mod }
{ 2 1 /mod -> 2 1 t/mod }
{ -1 1 /mod -> -1 1 t/mod }
{ -2 1 /mod -> -2 1 t/mod }
{ 0 -1 /mod -> 0 -1 t/mod }
{ 1 -1 /mod -> 1 -1 t/mod }
{ 2 -1 /mod -> 2 -1 t/mod }
{ -1 -1 /mod -> -1 -1 t/mod }
{ -2 -1 /mod -> -2 -1 t/mod }
{ 2 2 /mod -> 2 2 t/mod }
{ -1 -1 /mod -> -1 -1 t/mod }
{ -2 -2 /mod -> -2 -2 t/mod }
{ 7 3 /mod -> 7 3 t/mod }
{ 7 -3 /mod -> 7 -3 t/mod }
{ -7 3 /mod -> -7 3 t/mod }
{ -7 -3 /mod -> -7 -3 t/mod }
{ MAX-INT 1 /mod -> MAX-INT 1 t/mod }
{ MIN-INT 1 /mod -> MIN-INT 1 t/mod }
{ MAX-INT MAX-INT /mod -> MAX-INT MAX-INT t/mod }
{ MIN-INT MIN-INT /mod -> MIN-INT MIN-INT t/mod }

{ 0 1 / -> 0 1 t/ }
{ 1 1 / -> 1 1 t/ }
{ 2 1 / -> 2 1 t/ }
{ -1 1 / -> -1 1 t/ }
{ -2 1 / -> -2 1 t/ }
{ 0 -1 / -> 0 -1 t/ }
{ 1 -1 / -> 1 -1 t/ }
{ 2 -1 / -> 2 -1 t/ }
{ -1 -1 / -> -1 -1 t/ }
{ -2 -1 / -> -2 -1 t/ }
{ 2 2 / -> 2 2 t/ }
{ -1 -1 / -> -1 -1 t/ }
{ -2 -2 / -> -2 -2 t/ }
{ 7 3 / -> 7 3 t/ }
{ 7 -3 / -> 7 -3 t/ }
{ -7 3 / -> -7 3 t/ }
{ -7 -3 / -> -7 -3 t/ }
{ MAX-INT 1 / -> MAX-INT 1 t/ }
{ MIN-INT 1 / -> MIN-INT 1 t/ }
{ MAX-INT MAX-INT / -> MAX-INT MAX-INT t/ }
{ MIN-INT MIN-INT / -> MIN-INT MIN-INT t/ }

{ 0 1 mod -> 0 1 tmod }
{ 1 1 mod -> 1 1 tmod }
{ 2 1 mod -> 2 1 tmod }
{ -1 1 mod -> -1 1 tmod }
{ -2 1 mod -> -2 1 tmod }
{ 0 -1 mod -> 0 -1 tmod }
{ 1 -1 mod -> 1 -1 tmod }
{ 2 -1 mod -> 2 -1 tmod }
{ -1 -1 mod -> -1 -1 tmod }
{ -2 -1 mod -> -2 -1 tmod }
{ 2 2 mod -> 2 2 tmod }
{ -1 -1 mod -> -1 -1 tmod }
{ -2 -2 mod -> -2 -2 tmod }
{ 7 3 mod -> 7 3 tmod }
{ 7 -3 mod -> 7 -3 tmod }
{ -7 3 mod -> -7 3 tmod }
{ -7 -3 mod -> -7 -3 tmod }
{ MAX-INT 1 mod -> MAX-INT 1 tmod }
{ MIN-INT 1 mod -> MIN-INT 1 tmod }
{ MAX-INT MAX-INT mod -> MAX-INT MAX-INT tmod }
{ MIN-INT MIN-INT mod -> MIN-INT MIN-INT tmod }

{ 0 2 1 */ -> 0 2 1 t*/ }
{ 1 2 1 */ -> 1 2 1 t*/ }
{ 2 2 1 */ -> 2 2 1 t*/ }
{ -1 2 1 */ -> -1 2 1 t*/ }
{ -2 2 1 */ -> -2 2 1 t*/ }
{ 0 2 -1 */ -> 0 2 -1 t*/ }
{ 1 2 -1 */ -> 1 2 -1 t*/ }
{ 2 2 -1 */ -> 2 2 -1 t*/ }
{ -1 2 -1 */ -> -1 2 -1 t*/ }
{ -2 2 -1 */ -> -2 2 -1 t*/ }
{ 2 2 2 */ -> 2 2 2 t*/ }
{ -1 2 -1 */ -> -1 2 -1 t*/ }
{ -2 2 -2 */ -> -2 2 -2 t*/ }
{ 7 2 3 */ -> 7 2 3 t*/ }
{ 7 2 -3 */ -> 7 2 -3 t*/ }
{ -7 2 3 */ -> -7 2 3 t*/ }
{ -7 2 -3 */ -> -7 2 -3 t*/ }
{ MAX-INT 2 MAX-INT */ -> MAX-INT 2 MAX-INT t*/ }
{ MIN-INT 2 MIN-INT */ -> MIN-INT 2 MIN-INT t*/ }

{ 0 2 1 */mod -> 0 2 1 t*/mod }
{ 1 2 1 */mod -> 1 2 1 t*/mod }
{ 2 2 1 */mod -> 2 2 1 t*/mod }
{ -1 2 1 */mod -> -1 2 1 t*/mod }
{ -2 2 1 */mod -> -2 2 1 t*/mod }
{ 0 2 -1 */mod -> 0 2 -1 t*/mod }
{ 1 2 -1 */mod -> 1 2 -1 t*/mod }
{ 2 2 -1 */mod -> 2 2 -1 t*/mod }
{ -1 2 -1 */mod -> -1 2 -1 t*/mod }
{ -2 2 -1 */mod -> -2 2 -1 t*/mod }
{ 2 2 2 */mod -> 2 2 2 t*/mod }
{ -1 2 -1 */mod -> -1 2 -1 t*/mod }
{ -2 2 -2 */mod -> -2 2 -2 t*/mod }
{ 7 2 3 */mod -> 7 2 3 t*/mod }
{ 7 2 -3 */mod -> 7 2 -3 t*/mod }
{ -7 2 3 */mod -> -7 2 3 t*/mod }
{ -7 2 -3 */mod -> -7 2 -3 t*/mod }
{ MAX-INT 2 MAX-INT */mod -> MAX-INT 2 MAX-INT t*/mod }
{ MIN-INT 2 MIN-INT */mod -> MIN-INT 2 MIN-INT t*/mod }

\ ------------------------------------------------------------------------
TESTING here , @ ! CELL+ cells c, c@ c! chars 2@ 2! align aligned +! allot

here 1 allot
here
constant 2NDA
constant 1STA
{ 1STA 2NDA u< -> <TRUE> }		\ here MUST GROW WITH allot
{ 1STA 1+ -> 2NDA }			\ ... BY ONE ADDRESS UNIT
( MISSING TEST: NEGATIVE allot )

here 1 ,
here 2 ,
constant 2ND
constant 1ST
{ 1ST 2ND u< -> <TRUE> }			\ here MUST GROW WITH allot
{ 1ST cell+ -> 2ND }			\ ... BY ONE cell
{ 1ST 1 cells + -> 2ND }
{ 1ST @ 2ND @ -> 1 2 }
{ 5 1ST ! -> }
{ 1ST @ 2ND @ -> 5 2 }
{ 6 2ND ! -> }
{ 1ST @ 2ND @ -> 5 6 }
{ 1ST 2@ -> 6 5 }
{ 2 1 1ST 2! -> }
{ 1ST 2@ -> 2 1 }
{ 1S 1ST !  1ST @ -> 1S }		\ CAN STORE cell-WIDE VALUE

here 1 c,
here 2 c,
constant 2NDC
constant 1STC
{ 1STC 2NDC u< -> <TRUE> }		\ here MUST GROW WITH allot
{ 1STC char+ -> 2NDC }			\ ... BY ONE char
{ 1STC 1 chars + -> 2NDC }
{ 1STC c@ 2NDC c@ -> 1 2 }
{ 3 1STC c! -> }
{ 1STC c@ 2NDC c@ -> 3 2 }
{ 4 2NDC c! -> }
{ 1STC c@ 2NDC c@ -> 3 4 }

align 1 allot here align here 3 cells allot
constant A-ADDR  constant UA-ADDR
{ UA-ADDR aligned -> A-ADDR }
{    1 A-ADDR c!  A-ADDR c@ ->    1 }
{ 1234 A-ADDR  !  A-ADDR  @ -> 1234 }
{ 123 456 A-ADDR 2!  A-ADDR 2@ -> 123 456 }
{ 2 A-ADDR char+ c!  A-ADDR char+ c@ -> 2 }
{ 3 A-ADDR cell+ c!  A-ADDR cell+ c@ -> 3 }
{ 1234 A-ADDR cell+ !  A-ADDR cell+ @ -> 1234 }
{ 123 456 A-ADDR cell+ 2!  A-ADDR cell+ 2@ -> 123 456 }

: BITS ( X -- U )
   0 swap begin dup while dup MSB and if >r 1+ r> then  2* repeat drop ;
( charACTERS >= 1 AU, <= SIZE OF cell, >= 8 BITS )
{ 1 chars 1 < -> <FALSE> }
{ 1 chars 1 cells > -> <FALSE> }
( TBD: HOW TO FIND NUMBER OF BITS? )

( cells >= 1 AU, INTEGRAL MULTIPLE OF char SIZE, >= 16 BITS )
{ 1 cells 1 < -> <FALSE> }
{ 1 cells 1 chars mod -> 0 }
{ 1S BITS 10 < -> <FALSE> }

{ 0 1ST ! -> }
{ 1 1ST +! -> }
{ 1ST @ -> 1 }
{ -1 1ST +! 1ST @ -> 0 }

\ ------------------------------------------------------------------------
TESTING char [char] [ ] bl s"

{ bl -> 20 }
{ char X -> 58 }
{ char HELLO -> 48 }
{ : GC1 [char] X ; -> }
{ : GC2 [char] HELLO ; -> }
{ GC1 -> 58 }
{ GC2 -> 48 }
{ : GC3 [ GC1 ] literal ; -> }
{ GC3 -> 58 }
{ : GC4 s" XY" ; -> }
{ GC4 swap drop -> 2 }
{ GC4 drop dup c@ swap char+ c@ -> 58 59 }

\ ------------------------------------------------------------------------
TESTING ' ['] find execute immediate count literal postpone state

{ : GT1 123 ; -> }
{ ' GT1 execute -> 123 }
{ : GT2 ['] GT1 ; immediate -> }
{ GT2 execute -> 123 }
here 3 c, char G c, char T c, char 1 c, constant GT1STRING
here 3 c, char G c, char T c, char 2 c, constant GT2STRING
{ GT1STRING find -> ' GT1 -1 }
{ GT2STRING find -> ' GT2 1 }
( HOW TO SEARCH FOR NON-EXISTENT WORD? )
{ : GT3 GT2 literal ; -> }
{ GT3 -> ' GT1 }
{ GT1STRING count -> GT1STRING char+ 3 }

{ : GT4 postpone GT1 ; immediate -> }
{ : GT5 GT4 ; -> }
{ GT5 -> 123 }
{ : GT6 345 ; immediate -> }
{ : GT7 postpone GT6 ; -> }
{ GT7 -> 345 }

{ : GT8 state @ ; immediate -> }
{ GT8 -> 0 }
{ : GT9 GT8 literal ; -> }
{ GT9 0= -> <FALSE> }

\ ------------------------------------------------------------------------
TESTING if else  then  begin while repeat until recurse

{ : GI1 if 123 then  ; -> }
{ : GI2 if 123 else  234 then  ; -> }
{ 0 GI1 -> }
{ 1 GI1 -> 123 }
{ -1 GI1 -> 123 }
{ 0 GI2 -> 234 }
{ 1 GI2 -> 123 }
{ -1 GI1 -> 123 }

{ : GI3 begin dup 5 < while dup 1+ repeat ; -> }
{ 0 GI3 -> 0 1 2 3 4 5 }
{ 4 GI3 -> 4 5 }
{ 5 GI3 -> 5 }
{ 6 GI3 -> 6 }

{ : GI4 begin dup 1+ dup 5 > until ; -> }
{ 3 GI4 -> 3 4 5 6 }
{ 5 GI4 -> 5 6 }
{ 6 GI4 -> 6 7 }

{ : GI5 begin dup 2 > while dup 5 < while dup 1+ repeat 123 else  345 then  ; -> }
{ 1 GI5 -> 1 345 }
{ 2 GI5 -> 2 345 }
{ 3 GI5 -> 3 4 5 123 }
{ 4 GI5 -> 4 5 123 }
{ 5 GI5 -> 5 123 }

{ : GI6 ( N -- 0,1,..N ) dup if dup >r 1- recurse r> then  ; -> }
{ 0 GI6 -> 0 }
{ 1 GI6 -> 0 1 }
{ 2 GI6 -> 0 1 2 }
{ 3 GI6 -> 0 1 2 3 }
{ 4 GI6 -> 0 1 2 3 4 }

\ ------------------------------------------------------------------------
TESTING do loop +loop i j unloop leave exit

{ : GD1 do i loop ; -> }
{ 4 1 GD1 -> 1 2 3 }
{ 2 -1 GD1 -> -1 0 1 }
{ MID-UINT+1 MID-UINT GD1 -> MID-UINT }

{ : GD2 do i -1 +loop ; -> }
{ 1 4 GD2 -> 4 3 2 1 }
{ -1 2 GD2 -> 2 1 0 -1 }
{ MID-UINT MID-UINT+1 GD2 -> MID-UINT+1 MID-UINT }

{ : GD3 do 1 0 do j loop loop ; -> }
{ 4 1 GD3 -> 1 2 3 }
{ 2 -1 GD3 -> -1 0 1 }
{ MID-UINT+1 MID-UINT GD3 -> MID-UINT }

{ : GD4 do 1 0 do j loop -1 +loop ; -> }
{ 1 4 GD4 -> 4 3 2 1 }
{ -1 2 GD4 -> 2 1 0 -1 }
{ MID-UINT MID-UINT+1 GD4 -> MID-UINT+1 MID-UINT }

{ : GD5 123 swap 0 do i 4 > if drop 234 leave then  loop ; -> }
{ 1 GD5 -> 123 }
{ 5 GD5 -> 123 }
{ 6 GD5 -> 234 }

{ : GD6  ( PAT: {0 0},{0 0}{1 0}{1 1},{0 0}{1 0}{1 1}{2 0}{2 1}{2 2} )
   0 swap 0 do
      i 1+ 0 do i j + 3 = if i unloop i unloop exit then  1+ loop
    loop ; -> }
{ 1 GD6 -> 1 }
{ 2 GD6 -> 3 }
{ 3 GD6 -> 4 1 2 }

\ ------------------------------------------------------------------------
TESTING DEFINING WORDS: : ; constant variable create does> >body

{ 123 constant X123 -> }
{ X123 -> 123 }
{ : EQU constant ; -> }
{ X123 EQU Y123 -> }
{ Y123 -> 123 }

{ variable V1 -> }
{ 123 V1 ! -> }
{ V1 @ -> 123 }

{ : NOP : postpone ; ; -> }
{ NOP NOP1 NOP NOP2 -> }
{ NOP1 -> }
{ NOP2 -> }

{ : doES1 does> @ 1 + ; -> }
{ : doES2 does> @ 2 + ; -> }
{ create cr1 -> }
{ cr1 -> here }
{ ' cr1 >body -> here }
{ 1 , -> }
{ cr1 @ -> 1 }
{ doES1 -> }
{ cr1 -> 2 }
{ doES2 -> }
{ cr1 -> 3 }

{ : WEIRD: create does> 1 + does> 2 + ; -> }
{ WEIRD: W1 -> }
{ ' W1 >body -> here }
{ W1 -> here 1 + }
{ W1 -> here 2 + }

\ ------------------------------------------------------------------------
TESTING EVALUATE

: GE1 s" 123" ; immediate
: GE2 s" 123 1+" ; immediate
: GE3 s" : GE4 345 ;" ;
: GE5 evaluate ; immediate

{ GE1 evaluate -> 123 }			( TEST evaluate IN INTERP. STATE )
{ GE2 evaluate -> 124 }
{ GE3 evaluate -> }
{ GE4 -> 345 }

{ : GE6 GE1 GE5 ; -> }			( TEST evaluate IN COMPILE STATE )
{ GE6 -> 123 }
{ : GE7 GE2 GE5 ; -> }
{ GE7 -> 124 }

\ ------------------------------------------------------------------------
TESTING source >in word

: GS1 s" SOURCE" 2dup evaluate
       >r swap >r = r> r> = ;
{ GS1 -> <TRUE> <TRUE> }

variable SCANS
: RESCAN?  -1 SCANS +! SCANS @ if 0 >in ! then  ;

{ 2 SCANS !
345 RESCAN?
-> 345 345 }

: GS2  5 SCANS ! s" 123 RESCAN?" evaluate ;
{ GS2 -> 123 123 123 123 123 }

: GS3 word count swap c@ ;
{ bl GS3 HELLO -> 5 char H }
{ char " GS3 GOODBYE" -> 7 char G }
{ bl GS3
drop -> 0 }				\ BLANK LINE RETURN ZERO-LENGTH STRING

: GS4 source >in ! drop ;
{ GS4 123 456
-> }

\ ------------------------------------------------------------------------
TESTING <# # #s #> hold sign base >number hex decimal 

: S=  \ ( ADDR1 C1 ADDR2 C2 -- t/F ) COMPARE TWO STRINGS.
   >r swap r@ = if			\ MAKE SURE STRINGS HAVE SAME LENGTH
      r> ?dup if			\ if NON-EMPTY STRINGS
	 0 do
	    over c@ over c@ - if 2drop <FALSE> unloop exit then 
	    swap char+ swap char+
         loop
      then 
      2drop <TRUE>			\ if WE GET here, STRINGS MATCH
   else 
      r> drop 2drop <FALSE>		\ LENGTHS MISMATCH
   then  ;

: GP1  <# 41 hold 42 hold 0 0 #> s" BA" S= ;
{ GP1 -> <TRUE> }

: GP2  <# -1 sign 0 sign -1 sign 0 0 #> s" --" S= ;
{ GP2 -> <TRUE> }

: GP3  <# 1 0 # # #> s" 01" S= ;
{ GP3 -> <TRUE> }

: GP4  <# 1 0 #s #> s" 1" S= ;
{ GP4 -> <TRUE> }

24 constant MAX-BASE			\ base 2 .. 36
: count-BITS
   0 0 invert begin dup while >r 1+ r> 2* repeat drop ;
count-BITS 2* constant #BITS-UD		\ NUMBER OF BITS IN UD

: GP5
   base @ <TRUE>
   MAX-BASE 1+ 2 do			\ FOR EACH POSSIBLE BASE
      i base !				\ TBD: ASSUMES base WORKS
      i 0 <# #s #> s" 10" S= and
   loop
   swap base ! ;
{ GP5 -> <TRUE> }

: GP6
   base @ >r  2 base !
   MAX-UINT MAX-UINT <# #s #>		\ MAXIMUM UD TO BINARY
   r> base !				\ S: C-ADDR U
   dup #BITS-UD = swap
   0 do					\ S: C-ADDR FLAG
      over c@ [char] 1 = and		\ ALL ONES
      >r char+ r>
   loop swap drop ;
{ GP6 -> <TRUE> }

: GP7
   base @ >r    MAX-BASE base !
   <TRUE>
   A 0 do
      i 0 <# #s #>
      1 = swap c@ i 30 + = and and
   loop
   MAX-BASE A do
      i 0 <# #s #>
      1 = swap c@ 41 i A - + = and and
   loop
   r> base ! ;

{ GP7 -> <TRUE> }

\ >number TESTS
create GN-BUF 0 c,
: GN-STRING	GN-BUF 1 ;
: GN-CONSUMED	GN-BUF char+ 0 ;
: GN'		[char] ' word char+ c@ GN-BUF c!  GN-STRING ;

{ 0 0 GN' 0' >number -> 0 0 GN-CONSUMED }
{ 0 0 GN' 1' >number -> 1 0 GN-CONSUMED }
{ 1 0 GN' 1' >number -> base @ 1+ 0 GN-CONSUMED }
{ 0 0 GN' -' >number -> 0 0 GN-STRING }	\ SHOULD FAIL TO CONVERT THESE
{ 0 0 GN' +' >number -> 0 0 GN-STRING }
{ 0 0 GN' .' >number -> 0 0 GN-STRING }

: >number-BASED
   base @ >r base ! >number r> base ! ;

{ 0 0 GN' 2' 10 >number-BASED -> 2 0 GN-CONSUMED }
{ 0 0 GN' 2'  2 >number-BASED -> 0 0 GN-STRING }
{ 0 0 GN' F' 10 >number-BASED -> F 0 GN-CONSUMED }
{ 0 0 GN' G' 10 >number-BASED -> 0 0 GN-STRING }
{ 0 0 GN' G' MAX-BASE >number-BASED -> 10 0 GN-CONSUMED }
{ 0 0 GN' Z' MAX-BASE >number-BASED -> 23 0 GN-CONSUMED }

: GN1	\ ( UD base -- UD' LEN ) UD SHOULD EQUAL UD' and LEN SHOULD BE ZERO.
   base @ >r base !
   <# #s #>
   0 0 2swap >number swap drop		\ RETURN LENGTH ONLY
   r> base ! ;
{ 0 0 2 GN1 -> 0 0 0 }
{ MAX-UINT 0 2 GN1 -> MAX-UINT 0 0 }
{ MAX-UINT dup 2 GN1 -> MAX-UINT dup 0 }
{ 0 0 MAX-BASE GN1 -> 0 0 0 }
{ MAX-UINT 0 MAX-BASE GN1 -> MAX-UINT 0 0 }
{ MAX-UINT dup MAX-BASE GN1 -> MAX-UINT dup 0 }

: GN2	\ ( -- 16 10 )
   base @ >r  hex base @  decimal  base @  r> base ! ;
{ GN2 -> 10 A }

\ ------------------------------------------------------------------------
TESTING fill move

create FBUF 00 c, 00 c, 00 c,
create SBUF 12 c, 34 c, 56 c,
: SEEBUF FBUF c@  FBUF char+ c@  FBUF char+ char+ c@ ;

{ FBUF 0 20 fill -> }
{ SEEBUF -> 00 00 00 }

{ FBUF 1 20 fill -> }
{ SEEBUF -> 20 00 00 }

{ FBUF 3 20 fill -> }
{ SEEBUF -> 20 20 20 }

{ FBUF FBUF 3 chars move -> }		\ BIZARRE SPECIAL CASE
{ SEEBUF -> 20 20 20 }

{ SBUF FBUF 0 chars move -> }
{ SEEBUF -> 20 20 20 }

{ SBUF FBUF 1 chars move -> }
{ SEEBUF -> 12 20 20 }

{ SBUF FBUF 3 chars move -> }
{ SEEBUF -> 12 34 56 }

{ FBUF FBUF char+ 2 chars move -> }
{ SEEBUF -> 12 12 34 }

{ FBUF char+ FBUF 2 chars move -> }
{ SEEBUF -> 12 34 34 }

\ ------------------------------------------------------------------------
TESTING OUTPUT: . ." cr emit space spaces type u.

: OUTPUT-TEST
   ." YOU SHOULD SEE THE STANDARD GRAPHIC charACTERS:" cr
   41 bl do i emit loop cr
   61 41 do i emit loop cr
   7F 61 do i emit loop cr
   ." YOU SHOULD SEE 0-9 SEPARATED BY A space:" cr
   9 1+ 0 do i . loop cr
   ." YOU SHOULD SEE 0-9 (WITH NO spaces):" cr
   [char] 9 1+ [char] 0 do i 0 spaces emit loop cr
   ." YOU SHOULD SEE A-G SEPARATED BY A space:" cr
   [char] G 1+ [char] A do i emit space loop cr
   ." YOU SHOULD SEE 0-5 SEPARATED BY TWO spaces:" cr
   5 1+ 0 do i [char] 0 + emit 2 spaces loop cr
   ." YOU SHOULD SEE TWO SEPARATE LINES:" cr
   s" LINE 1" type cr s" LINE 2" type cr
   ." YOU SHOULD SEE THE NUMBER RANGES OF SIGNED and UNSIGNED NUMBERS:" cr
   ."   SIGNED: " MIN-INT . MAX-INT . cr
   ." UNSIGNED: " 0 u. MAX-UINT u. cr
;

{ OUTPUT-TEST -> }

\ ------------------------------------------------------------------------
TESTING INPUT: ACCEPT

create ABUF 80 chars allot

: ACCEPT-TEST
   cr ." PLEASE type UP TO 80 charACTERS:" cr
   ABUF 80 accept
   cr ." RECEIVED: " [char] " emit
   ABUF swap type [char] " emit cr
;

{ ACCEPT-TEST -> }

\ ------------------------------------------------------------------------
TESTING DICTIONARY SEARCH RULES

{ : GDX   123 ; : GDX   GDX 234 ; -> }

{ GDX -> 123 234 }


