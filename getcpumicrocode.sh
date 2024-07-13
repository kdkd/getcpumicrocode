#!/bin/sh

echo $shell | grep -q csh && goto CSH

#bash
o=`uname -s`
p=`uname -m`
if [ $o = "FreeBSD" ] && [ $p = "amd64" ]
then
 if [ `id -u` -ne 0 ]
 then
  echo "Requires root on FreeBSD"
  exit 1
 fi
 sysctl -n hw.model
 cpucontrol -m 8b /dev/cpuctl0 | awk '{print $NF}'
 exit
fi
if [ $o = "Linux" ] && [ $p = "x86_64" ]
then
 cat /proc/cpuinfo | grep -m 1 "model name" | awk -F': ' '{print $2}'
 cat /proc/cpuinfo | grep -m 1 microcode | awk '{print $NF}'
 exit
fi
echo "Unsupported system"
exit 1

#csh
CSH:
set o=`uname -s`
set p=`uname -m`
if ( "$o" == "FreeBSD" && "$p" == "amd64" ) then
 if ( `id -u` != "0" ) then
  echo "Requires root on FreeBSD"
  exit 1
 endif
 sysctl -n hw.model
 cpucontrol -m 8b /dev/cpuctl0 | awk '{print $NF}'
 exit
endif
if ( "$o" == "Linux" && "$p" == "x86_64" ) then
 cat /proc/cpuinfo | grep -m 1 "model name" | awk -F': ' '{print $2}'
 cat /proc/cpuinfo | grep -m 1 microcode | awk '{print $NF}'
 exit
endif
echo "Unsupported system"
exit 1
