#!/bin/bash
defaultCodeBaseName="/ISD2"
if [ "$1" != "" ]; then
    defaultCodeBaseName="$1"
fi

genfolder=`find $defaultCodeBaseName \-maxdepth 1 \-type d |grep -v "^$defaultCodeBaseName/\.git$\|^$defaultCodeBaseName/crosslibs$\|^$defaultCodeBaseName$\|^$defaultCodeBaseName/TARGET_RAMDISK$"|grep -v "dir/toolchain-"`

echo "CodeBase:$defaultCodeBaseName"
echo "Folder:$genfolder"

exgentype=`printf '\-name "*.c" "*.h" "Makefile*" "*.cpp"' | sed 's/" /" -or -name /g'`

echo "--------Start Scanning---------"
for d in $genfolder
do
    echo "Scanning... $d"
    mkdir -p /CSCOPE/$d
    eval "find $d -type f -and \\( $exgentype \\) > /CSCOPE/$d/cscope.files"
    sed -i -e 's/^/"/g' /CSCOPE/$d/cscope.files
    sed -i -e 's/$/"/g' /CSCOPE/$d/cscope.files
    cscope -bkq -i /CSCOPE/$d/cscope.files -f /CSCOPE/$d/cscope.out
done
echo "--------Finish Scanning---------"
