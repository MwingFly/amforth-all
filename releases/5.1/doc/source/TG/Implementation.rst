
==============
Implementation
==============

ANS94 Words
-----------

amforth is close to the ANS94 Forth standard. The main difference comes from
the fact that the AVR ATmegas use a Harvard architecture (separate code and
data address space) that amforth does not hide. amforth gives full and unmodified
access to the whole address space.

amforth implements most or all words from the ANS word
sets CORE, CORE EXT, EXCEPTION and DOUBLE NUMBERS. A loadable
floating point library that contains the basic routines is
available. Words from the word sets LOCALS and FILE-ACCESS
are dropped completely. The others are partially implemented.

Core and Core EXT
.................

Al words from the CORE word set are available. CORE EXT drops
the words C", CONVERT, EXPECT, SPAN, and  ROLL.

Loop counters are checked on signed compares.

Block
.....

amforth has limited block support with I2C/TWI
serial eeprom chips with 2 byte addresses.

Double Number
.............

Double cell numbers work as expected. Not all words
are implemented. Entering them directly using the
dot- notation work for dots at the end of the number,
not if the dot is somewhere within it.

Exception
.........

Exceptions are fully supported. The words
:command:`ABORT` and :command:`ABORT"`
use them internally.

The :command:`THROW` codes -1, -2 and -13 work as 
specified.

The implementation is based upon a variable HANDLER
which holds the current return stack pointer
position. This variable is a USER variable.

Facility
........

The basic system uses the :command:`KEY?`
and :command:`EMIT?` words as deferred words 
in the USER area.

The word :command:`MS` is implemented with the word
:command:`1MS` which busy waits almost exactly 1 millisecond. 
The calculation is based upon the frequency specified at
compile time.

The words :command:`TIME&DATE`, :command:`EKEY`,
:command:`EKEY>CHAR` are not implemented.

To control a VT100 terminal the words
:command:`AT-XY` and :command:`PAGE`
are written in forth code. They emit the ANSI
control codes according to the VT100 terminal codes.

File Access
...........

amforth does not have filesystem support. It does
not contain any words from this word set.

Floating Point
..............

amforth has a loadable floating point library. It contains
the basic words to deal with single precision floats. The floats
are managed on the standard data stack. After loading the library
floats can be entered directly at the command prompt. Some speed
sensitive words are available as assembly code as well.

Locals
......

amforth does not currently support locals.

Memory Allocation
.................

amforth does not support the words from the memory
allocation word set.

Programming Tools
.................

Variants of the words
:command:`.S`, :command:`?`
and :command:`DUMP`
are implemented or can easily be done. The word
:command:`SEE` is available as well.

:command:`STATE` works as specified.

The word :command:`WORDS`
does not sort the word list and does not take care
of screen sizes.

The words :command:`;CODE`
and :command:`ASSEMBLER`
are not supported. amforth has a loadable assembler
which can be used with the words
:command:`CODE` and :command:`END-CODE`
.

The control stack commands
:command:`CS-ROLL` , and ,
:command:`CS-PICK` are not implemented. The 
compiler words operate with the more traditional
:command:`MARK` / :command:`RESOLVE` word pairs.

:command:`FORGET`
is not implemented since it would be nearly impossible to
reset the search order word list with reasonable efforts.
The better way is using :command:`MARKER`
from the library.

An EDITOR is not implemented.

:command:`[IF]`, :command:`[ELSE]`
and :command:`[THEN]` are not implemented.

Word Lists and Search Order
...........................

Amforth supports the ANS Search Order Wordlist. A word list consist of a linked list
of words in the dictionary. There are no limits on the number of word lists
defined. Only the length of the active search order is limited: There can be
up to 8 entries at any given moment. This limit can be changed at compile
time in the application definition file.

Internally the wordlist identifier is the address where the wordlist start
address is stored in the EEPROM. Creating a new word list means to allocate
a new EEPROM cell. Since the ANS standard does not give named wordlist
there is library code available that uses the old fashioned vocabulary.

Strings
.......

:command:`SLITERAL`, :command:`CMOVE>`,
:command:`CMOVE`, :command:`COMPARE>`, and
:command:`/STRING` are implemented.

:command:`-TRAILING`, :command:`BLANK`,
and :command:`SEARCH` are not implemented.

Forth 200x
----------

amforth provides the :command:`defer/is`,
:command:`buffer:` and the :command:`structure`
extensions from the forth 200x standards.

Defer and IS
............

:command:`defer` give the possibility of vectored execution. Amforth
has 3 different kind of such vectors, varying in how they are stored: EEPROM, RAM
or the USER area. The EEPROM makes it possible to save the settings permanently,
the RAM enables frequent changes. Finally the user area is for multitasking.

Buffer:
.......

The buffer allocates a named memory (RAM) region. It is superior to
the usual create foo xx allot since amforth has a non-unified
memory model and the code snippet does not the same as an unified memory
model forth (with the dictionary being at the same memory as the allot
command works).

Structures
..........

Amforth
-------

COLD
....

The startup code is in the file :file:`cold.asm`.
It gets called directly from the address 0 vector.

This assembly part of the startup code creates the basic runtime environment
to start the virtual forth machine. It sets up the stack pointers and
the user pointer and places the forth instruction pointer on the
word WARM. Then it boots the forth virtual machine
by jumping to the inner interpreter.

The start addresses of the stacks are placed to the user area
for later use as well.

WARM
....

The word WARM is the high level part of the
forth VM initialization. When called from
within forth it is the equivalent to a RESET.
WARM initializes the PAUSE
deferred word to do nothing, calls the application defined
TURNKEY action and finally hands over to QUIT.

TURNKEY
.......

The turnkey is a EEPROM deferred word that
points to an application specific startup word.

Its main task is to initialize the character IO to enable
the forth interpreter to interact with the command prompt. The
examples shipped with amforth do this by "opening" the serial
port, switching to decimal number conversion and setting up the
character IO deferred words (KEY, EMIT etc).

QUIT
....

QUIT initializes both data and return stack pointers by reading
them from the user area and enters the traditional ACCEPT -- INTERPRET
loop that never ends. It provides the topmost exception catcher as
well. Depending on the exception thrown, it prints an error message
and restarts itself.

MCU Access
..........

amforth provides wrapper words for the
microcontroller instructions
:command:`SLEEP` and :command:`WDR` 
(watch dog reset). To work properly, the MCU needs
more configuration. amforth itself does not call
these words.

Assembler
.........

Lubos Pekny has written an assembler for amforth. To support it, amforth
provides the two words :command:`CODE` and :command:`END-CODE`. The first
creates a dictionary entry and sets the code field to the data filed address. The
interpreter will thus jump directly into the data field assuming some machine
code there. The word :command:`END-CODE` places a JUMP NEXT into
the data field. This finishes the machine instruction execution and jumps back
to the forth interpreter.

Memories
........

Atmega microcontroller have three different types of
memory. RAM, EEPROM and Flash. The words
:command:`@` and :command:`!`
work on the RAM address space (which includes IO
Ports and the CPU register), the words
:command:`@e` and :command:`!e`
operate on the EEPROM and
:command:`@i` and :command:`!i`
deal with the flash memory. All these words transfer
one cell (2 bytes) between the memory and the data
stack. The address is always the native address of
the target storage: byte-based for EEPROM and RAM,
word-based for flash. Therefore the flash addresses
64KWords or 128 KBytes address space.

External RAM shares the normal RAM address space
after initialization (which can be done in the
turnkey action). It is accessible without further
changes.

For RAM only there is the special word pair
:command:`c@`/:command:`c!`
which operate with the lower half of a stack cell.
The upper byte is either ignored or set to 0 (zero).

All other types of external memory need special
handling, which may be masked with the block word
set.

Input Output
............

amforth uses character terminal IO. A serial console is
used. All IO is based upon the standard words
:command:`EMIT`/:command:`EMIT?` and 
:command:`KEY`/:command:`KEY?`. Additionally the word
:command:`/KEY` is used to signal the sender to stop. 
All these words are deferred words in the USER area 
and can be changed with the :command:`IS` command.

The predefined words use an interrupt driven IO with
a buffer for input and output. They do not implement
a handshake procedure (XON/XOFF or CTS/RTS). The
default terminal device is selected at compile time.

These basic words include a call to the
:command:`PAUSE`
command to enable the use of multitasking.

Other IO depend on the hardware connected to the
microcontroller. Code exists to use LCD and TV
devices. CAN, USB or I2C are possible as well.
Another use of the redirect feature is the
following: consider some input data in external
EEPROM (or SD-Cards). To read it, the words
:command:`KEY`
and
:command:`KEY?`
can be redirected to fetch the data from them.

Strings
.......

Strings can be stored in two areas: RAM and FLASH.
It is not possible to distinguish between the
storage areas based on the addresses found on the
data stack, it's up to the developer to keep track.

Strings are stored as counted strings with a 16 bit
counter value (1 flash cell)
Strings in flash are compressed: two consecutive
characters (bytes) are placed into one flash cell. The standard
word
:command:`S"`
copies the string from the RAM into flash using the
word
:command:`S,`
.
