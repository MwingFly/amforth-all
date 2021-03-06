
AmForth
=======

AmForth is an easily extendible command interpreter for the Atmel
AVR8 Atmega micro controller family. It has a turnkey feature
for embedded use too.

AmForth runs completely on the controller. It does not need additional
hardware beyond a power supply. It makes no restrictions for hardware
extensions that can be connected to the controller.

The command language is `Forth <http://www.forth.org/tutorials.html>`_.
AmForth implements an almost compatible `ANS94 <http://forth.sourceforge.net/std/dpans/>`_
indirect threading 16bit Forth. There are some extensions from the
`Forth 2012 <http://www.forth200x.org/>`_ standard.

The interpreter has a command prompt in a serial terminal. Other
connections like TCP/IP telnet or radio links are possible.

AmForth is published under the GNU Public License v2 (GPL).

AmForth needs approx. 8KB Flash memory, 80 bytes EEPROM, and 200 bytes
RAM for the core system.

Karl Lunt has written an excellent :ref:`User Guide`
on how to start and work with AmForth. For those who want
to take a deeper look into the system is the :ref:`Technical Guide`.
The whole documentation is available as `PDF <amforth.pdf>`_
and `EPUB <AmForth.epub>`_.

.. raw:: html
  :file: leon-video.html


Under Construction
------------------

Here you'll find things that are not yet
released but will be part of the next release.
See the code section at Sourceforge to get the
`most recent sources <http://sourceforge.net/p/amforth/code/HEAD/tree/trunk/>`__

* Forth 2012 `Traverse-Wordlist <http://www.forth200x.org/traverse-wordlist.html>`__
* improved documentation
* core: added :command:`d0=` and :command:`0=` as assembly primitives and
  use them in other compare operations. Saves a lot of code space.
* Wordlist entries are now 8bit clean. Words with umlauts or e.g.
  Greek commands work as expected, unless the terminal does not cooperate.
  Thanks to Enoch.

.. code-block:: forth

   > : Σ  0 swap 0  do  +  loop  ;
    ok
   > 7 8 9 3 Σ .
    24  ok
   >

More To Read
----------------

.. toctree::
   :maxdepth: 2

   UG/amforth_user
   faq
   TG/TG
   TG/Cookbook
   TG/refcard
   history


