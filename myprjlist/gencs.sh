#!/bin/bash
deffiletype="*.c"
filetype="*.h *.cpp *.htm *.html *.js Makefile.* Makefile *.make"
dbfolder="/CSCOPE"

for i in $filetype
do
    findfiletype=$findfiletype" -o -name \""$i"\""
done
findfiletype="-name \""$deffiletype"\" "$findfiletype

for d in `cat $1`
do
    mkdir -p $dbfolder$d
    echo "find $d "$findfiletype" > $dbfolder$d/cscope.files"
    eval "find $d "$findfiletype" > $dbfolder$d/cscope.files"
    echo "cscope -bkq -i $dbfolder$d/cscope.files -f $dbfolder$d/cscope.out"
    eval "cscope -bkq -i $dbfolder$d/cscope.files -f $dbfolder$d/cscope.out"
done

