#!/bin/bash
deffiletype="*.c"
filetype="*.h *.cpp *.htm *.html *.js Makefile.* Makefile *.make"
dbfolder="/CSCOPE"

for i in $filetype
do
    findfiletype=$findfiletype" -o -name "$i
done
findfiletype="-name "$deffiletype" "$findfiletype
echo $findfiletype

for d in `cat $1`
do
#    echo $dbfolder$d
    mkdir -p $dbfolder$d
    find $i $findfiletype > $dbfolder$d/cscope.files
    cscope -bkq -i $dbfolder$d/cscope.files -f $dbfolder$d/cscope.out
done

