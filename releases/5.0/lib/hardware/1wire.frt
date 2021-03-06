\ Adapted from 4e4th:
\   all relevant words are lowercase.
\   romid is now a forth 2012 buffer.
\   assembly part rewritten from scratch
\   renamed to file extension frt
\ 
\ NAME
\   1wire.frt
\ SYNOPSIS
\   Example high-level Forth functions for Dallas 1-wire devices
\ DESCRIPTION
\
\ USES
\   Uses the following kernel functions (provided by 1wire.asm)
\   OWRESET [ -- f ]  Initialize 1-wire devices; return true if present
\   OWSLOT [ c -- c' ] Write and read one bit to/from 1-wire.
\
\ COPYRIGHT
\   [c] 2012 Bradford J. Rodriguez.
\ 
\   This program is free software; you can redistribute it and/or modify
\   it under the terms of the GNU General Public License as published by
\   the Free Software Foundation; either version 3 of the License, or
\   [at your option] any later version.
\
\   This program is distributed in the hope that it will be useful,
\   but WITHOUT ANY WARRANTY; without even the implied warranty of
\   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
\   GNU General Public License for more details.
\
\   You should have received a copy of the GNU General Public License
\   along with this program.  If not, see <http://www.gnu.org/licenses/>.
\
\   Commercial inquiries should be directed to the author at 
\   115 First St., #105, Collingwood, Ontario L9Y 4W3 Canada
\   or via email to bj@camelforth.com
\ ******


\ Basic 1-wire operations 
\ OWTOUCH ( c1 -- c2 )  Write and read one byte to/from 1-wire bus.
\     This implements the "touch byte" function described in Dallas
\     Application Note 74.  It expects a byte c1 which is sent over the
\     1-wire bus.  To perform a read operation, this must be FF hex. 
\     The returned byte c2 is the data read back from the bus.  For a
\     read operation, this is the read data; for a write operation, this
\     has no significance and can be discarded.
\ 
\ OWPUT ( c -- )  Write one byte to the 1-wire bus.
\     This uses OWTOUCH to write one byte of data.  The value returned
\     by OWTOUCH is discarded.
\     
\ OWGET ( -- c )  Read one byte from the 1-wire bus.
\     This uses OWTOUCH with an input parameter of FF hex to read one
\     byte from a 1-wire device.
\ 
: owtouch ( c1 -- c2 ) 
    owslot owslot owslot owslot owslot owslot owslot owslot ;

: owput ( c -- ) owtouch drop ;  
: owget ( -- c ) $ff owtouch ;

\ SHOWID should be used ONLY if there is a single 1-wire device attached.
: owshowid  owreset if
    $33 owput owget . owget . owget . owget .
    owget . owget . owget . owget . 
  then ;

\ Maxim 1-wire ROM Search algorithm 
\ per AN937 "Book of iButton Standards", figure 5-3 

variable lastdisc               ( used as byte variable )
lastdisc 1+ constant doneflag   ( used as byte variable )

variable rombit                 ( used as byte variable, 1..64 )
rombit 1+ constant discmark     ( used as byte variable )

8 buffer: romid         ( 8 byte array )

: !rombit ( f -- )
    rombit c@ 1- 8 /mod ( -- f bit# byte# )
    romid +             ( -- f bit# addr )
    1 rot lshift        ( -- f addr bitmask )
    rot if              ( f true, set bit )
        over c@ or swap c!
    else                ( f false, clear bit )
        invert over c@ and swap c!
    then
;

: @rombit ( -- f )
    rombit c@ 1- 8 /mod ( -- bit# byte# )
    romid + c@          ( -- bit# byte )
    1 rot lshift        ( -- byte bitmask )
    and
;    

: newsearch   0 lastdisc ! ;    ( clear LASTDISC and DONEFLAG )

: romsearch ( -- f )   ( Returns 0 or 1 )
    0                   ( default return value )
    doneflag c@ if
        0 doneflag c!  
        exit
    then
    owreset if          ( presence signal detected? )

        1 rombit c!         ( yes: set ROM bit index to 1 )
        0 discmark c!       ( set discrepancy marker to 0 )
        $f0 owput           ( send search command on bus )
        begin
            $03 owslot owslot    ( read two bits: ba000000 )
            dup $c0 = if        ( bitA = bitB = 1?)
                drop
                0 lastdisc c! 
                exit
            else dup 0= if      ( bitA = bitB = 0?)
                drop
                rombit c@ lastdisc c@ = if
                    1 !rombit
                else rombit c@ lastdisc c@ > if
                    0 !rombit
                    rombit c@ discmark c!
                else @rombit 0= if
                    rombit c@ discmark c!
                then then then
            else
                $40 and         ( bit A value )
                !rombit
            then then
            @rombit if 1 else 0 then owslot drop ( send ROM bit to bus )
            rombit c@ 1+ dup rombit c!
        $40 > until
        discmark c@ dup lastdisc c!
        0= if
            1 doneflag c!
        else
            drop 1      ( set return value to true )
        then
        
    else ( no presence signal )
        0 lastdisc c!
    then
;

\ Demonstrates how to use ROMSEARCH to find all attached devices )

: owshowids ( -- )
   newsearch
   begin
      romsearch
      cr romid 8 + romid do i c@ 3 u.r loop
   0= until
   cr
;

\ This version of SENDID expects the address of an 8-byte ID )
\ Start an addressed command.  This sends RESET, Match ROM [55h], )
\ and the 8 bytes of ROMID.  It should be followed by a DS18B20   )
\ function command. )

: sendid ( addr -- )
   owreset if
      $55 owput    ( send Match ROM command )
      8 over + swap do  i @i owput  loop  ( send 8 id bytes )
   else ." failed" drop then
;

\ Function commands that can follow SENDID )

: readscratch ( addr -- )  ( display 9 bytes of scratchpad )
   sendid
   $BE owput  owget . owget . owget . owget .
   owget . owget . owget . owget . owget . 
;
