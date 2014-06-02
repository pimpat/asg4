#!/usr/local/bin/bash

a="rrdtool graph -w 962 -h 282 -A vm.png "
a+="--start $1 --end $2 "
for i in ${@:3}
do
	if [ "$i" == "cpu_user" ]
	then
 		a+="DEF:cpu_user=file.rrd:cpu_user:AVERAGE "
	elif [ "$i" == "cpu_system" ] 
        then
		a+="DEF:cpu_system=file.rrd:cpu_system:AVERAGE "
        elif [ "$i" == "mem_act" ]
        then
 		a+="DEF:mem_act=file.rrd:mem_act:AVERAGE "
        elif [ "$i" == "mem_free" ]
        then
 		a+="DEF:mem_free=file.rrd:mem_free:AVERAGE "
        elif [ "$i" == "disks_op" ]
        then
 		a+="DEF:disks_op=file.rrd:disks_op:AVERAGE "
        elif [ "$i" == "total_page" ]
        then
		a+="DEF:total_page=file.rrd:total_page:AVERAGE "
        elif [ "$i" == "page_out" ]
        then
		a+=" DEF:page_out=file.rrd:page_out:AVERAGE "
        elif [ "$i" == "page_freed" ]
        then
		a+="DEF:page_freed=file.rrd:page_freed:AVERAGE "
        elif [ "$i" == "page_in" ]
        then
		a+="DEF:page_in=file.rrd:page_in:AVERAGE "
	else
        echo "Can not found this command"
        fi
done

for i in ${@:3}
do
        if [ "$i" == "cpu_user" ]
        then
		a+="LINE2:cpu_user#FF0000 "
        elif [ "$i" == "cpu_system" ]
        then
		a+="LINE2:cpu_system#00FF00 "
        elif [ "$i" == "mem_act" ]
        then
		a+="LINE2:mem_act#19F2FE "
        elif [ "$i" == "mem_free" ]
        then
		a+="LINE2:mem_free#1930FE "
        elif [ "$i" == "disks_op" ]
        then
		a+="LINE2:disks_op#FFF300 "
        elif [ "$i" == "total_page" ]
        then
		a+="LINE2:total_page#FF00FF "
        elif [ "$i" == "page_out" ]
        then
		a+="LINE2:page_out#FF5A00 "
        elif [ "$i" == "page_freed" ]
        then
		a+="LINE2:page_freed#6B00FF "
        elif [ "$i" == "page_in" ]
        then
		a+="LINE2:page_in#4B2C07 "
        else
        echo "Can not found this command"
        fi
done

echo $a
$a
