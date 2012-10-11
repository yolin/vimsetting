#!/bin/bash
d=/ISD2/vendors
find $d -name "*.c" -o -name "*.h" > /CSCOPE/$d/cscope.files && cscope -bkq -i /CSCOPE/$d/cscope.files -f /CSCOPE/$d/cscope.out
