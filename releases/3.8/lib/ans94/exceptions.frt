\ ******************************************
\ some exceptions 
\ ******************************************
: ?comp  ( -- )
    state @ 0= 
    if -&14 throw then ;

: ?pairs ( n1 n2 -- ) 
    - 
    if -&22 throw then ;

: ?stack ( -- )
    depth 0< if -&42 throw then
;
