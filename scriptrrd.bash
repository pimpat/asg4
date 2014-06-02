#!/usr/local/bin/bash

a="rrdtool create file.rrd \
        --step 2 \
        DS:cpu_user:GAUGE:600:U:U \
        DS:cpu_system:GAUGE:600:U:U \
        DS:mem_act:GAUGE:600:U:U \
        DS:mem_free:GAUGE:600:U:U \
        DS:disks_op:GAUGE:600:U:U \
        DS:total_page:GAUGE:600:U:U \
        DS:page_out:GAUGE:600:U:U \
        DS:page_freed:GAUGE:600:U:U \
        DS:page_in:GAUGE:600:U:U \
        RRA:AVERAGE:0.5:1:43200 \
        RRA:MIN:0.5:1:43200 \
        RRA:MAX:0.5:1:43200 \
        RRA:LAST:0.5:1:43200";
$a

x1=""
x2=""
x3=""
x4=""
x5=""
x6=""
x7=""
x8=""
x9=""

#let "t = $1 * 60 / $2" 

#for i in $(eval echo {1..$t})
while true
do
        for i in ${@:3}
        do
        if [ "$i" == "cpu_user" ] 
	then
        	x1=`vmstat | awk -F" " 'NR==3 {print $17}'`
        elif [ "$i" == "cpu_system" ] 
	then
        	x2=`vmstat | awk -F" " 'NR==3 {print $18}'`
        elif [ "$i" == "mem_act" ] 
	then
        	x3=`vmstat | awk -F" " 'NR==3 {print $4}'`
        elif [ "$i" == "mem_free" ] 
	then
        	x4=`vmstat | awk -F" " 'NR==3 {print $5}'`
        elif [ "$i" == "disks_op" ] 
	then
        	x5=`vmstat | awk -F" " 'NR==3 {print $12}'`
        elif [ "$i" == "total_page" ] 
	then
        	x6=`vmstat | awk -F" " 'NR==3 {print $6}'`
        elif [ "$i" == "page_out" ] 
	then
        	x7=`vmstat | awk -F" " 'NR==3 {print $9}'`
        elif [ "$i" == "page_freed" ] 
	then
        	x8=`vmstat | awk -F" " 'NR==3 {print $10}'`
        elif [ "$i" == "page_in" ] 
	then
        	x9=`vmstat | awk -F" " 'NR==3 {print $8}'` 
        else
        echo "Can not found this command"
        fi
	done
echo cpu_user: $x1
echo cpu_system: $x2
echo mem_act: $x3
echo mem_free: $x4
echo disks_op: $x5
echo total_page: $x6
echo page_out: $x7
echo page_freed: $x8
echo page_in: $x9
command="rrdtool update file.rrd N:$x1:$x2:$x3:$x4:$x5:$x6:$x7:$x8:$x9"
$command
echo "Data updated."
sleep $2
done
