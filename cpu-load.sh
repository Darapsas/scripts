#!/bin/sh


if [ -e "/tmp/cpu-load" ]; then
	raw1=`cat /tmp/cpu-load`
	raw2=`cat /proc/stat | grep "cpu "`

	_usr1=`echo $raw1 | awk '{print $2}'`
	_usr2=`echo $raw2 | awk '{print $2}'`
	((usr=$_usr2 - $_usr1))
	       
	_nic1=`echo $raw1 | awk '{print $3}'`
	_nic2=`echo $raw2 | awk '{print $3}'`
	((nic=$_nic2 - $_nic1))
	       
	_sys1=`echo $raw1 | awk '{print $4}'`
	_sys2=`echo $raw2 | awk '{print $4}'`
	((sys=$_sys2 - $_sys1))
	       
	_idl1=`echo $raw1 | awk '{print $5}'`
	_idl2=`echo $raw2 | awk '{print $5}'`
	((idl=$_idl2 - $_idl1))
	       
	_iowait1=`echo $raw1 | awk '{print $6}'`
	_iowait2=`echo $raw2 | awk '{print $6}'`
	((iowait=$_iowait2 - $_iowait1))
	       
	_irq1=`echo $raw1 | awk '{print $7}'`
	_irq2=`echo $raw2 | awk '{print $7}'`
	((irq=$_irq2 - $_irq1))
	       
	_softirq1=`echo $raw1 | awk '{print $8}'`
	_softirq2=`echo $raw2 | awk '{print $8}'`
	((softirq=$_softirq2 - $_softirq1))
	       
	((total=$usr + $nic + $sys + $idl + $iowait + $irq + $softirq))
	       
	#echo $usr $total | awk '{printf "%4.2f ",$1/$2*100}'
	#echo $nic $total | awk '{printf "%4.3f ",$1/$2*100}'
	#echo $sys $total | awk '{printf "%4.2f ",$1/$2*100}'
	echo $idl $total | awk '{printf "%4.1f%%", 100-($1/$2*100)}'
else
	echo "-%"
fi
