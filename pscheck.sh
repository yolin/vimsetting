#!/bin/bash
declare -i date_start=`date +%s`
t1=`grep '==== ok ====' $1 | awk '{print $2}'`

while [ "$t1" != "ok" ]
do
    ps=`ps ax > /tmp/ps.txt`
    p2=`egrep $2 /tmp/ps.txt | egrep -v pscheck | egrep -v xargs | awk '{print $5}'`
    p3=`egrep $3 /tmp/ps.txt | egrep -v pscheck | egrep -v xargs | awk '{print $5}'`
    p4=`egrep $4 /tmp/ps.txt | egrep -v pscheck | egrep -v xargs | awk '{print $5}'`
    if [ "$p2" != "$2" ] && [ "$p3" != "$3" ] && [ "$p4" != "$4" ]; then
            echo "==== ok ====" >> $1
    fi
    t1=`grep '==== ok ====' $1 | awk '{print $2}'`
    p2=''
    p3=''
    p4=''
    declare -i date_now=`date +%s`
    declare -i date_die=$(($date_now-$date_start))
    if [ "$date_die" -gt 60000 ]; then
        echo "==== search too long ====" >> $1
        break
    fi
    vimcheck=`egrep vim | egrep -v pscheck | awk '{print $5}'`
    if [ "$vimcheck" != "vim" ]; then
        break
    fi
done
echo cost time:$date_die s >> $1
