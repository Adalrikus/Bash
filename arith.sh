#!/bin/sh

c=`expr 2 + 2`
echo "Total value : $c"
c=`expr 2 - 2`
echo "Substraction : $c"
c=`expr 2 \* 2`
echo "Multiplication : $c"
c=`expr 2 / 2`
echo "Division : $c"
c=`expr 2 % 2`
echo "Modulus : $c"

bool=`expr 2 != 2`
echo "False : $bool"
bool=`expr 2 == 2`
echo "True : $bool"
