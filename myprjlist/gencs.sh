#!/bin/bash
deffiletype="*.c"
filetype="*.h *.cpp *.htm *.html *.js Makefile.* Makefile *.make"

for i in $filetype
do
    findfiletype=$findfiletype" -o -name "$i
done
findfiletype="-name "$deffiletype" "$findfiletype
echo $findfiletype

for i in `cat $1`
do
    find $i $findfiletype > "/CSCOPE"$i/cscope.files
    cscope -bkq -i "/CSCOPE"$i/cscope.files -f "/CSCOPE"$i/cscope.out
done

