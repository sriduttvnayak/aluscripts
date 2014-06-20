#!/bin/sh

#EXAMPLE COMMAND:
#buildall.sh -c -S -d -s boot,cpm,iom,both -p STU,MTU,SASX,SASD,SAST,SASR -a i386,hops,sultan,nano

cp /home/$(whoami)/Documents/Work/Scripts/prefs.mk .

echo "Platform Opted is : $1"

if [ "$1" = "STU" -o "$1" = "E" -o "$1" = "SASE" ]; then
   pf="STU"
elif [ "$1" = "D" -o "$1" = "SASD" ]; then
   pf="SASD"
elif [ "$1" = "X" -o "$1" = "SASX" ]; then
   pf="SASX"
elif [ "$1" = "T" -o "$1" = "SAST" ]; then
   pf="SAST"
elif [ "$1" = "R" -o "$1" = "SASR" -o "$1" = "NGA" ]; then
   pf="SASR"
else
   pf="MTU"
fi

echo "Build running on : $pf"

./buildall.sh -S -d -s -c boot,cpm,iom,both -p $pf -a i386,hops,sultan,nano,arc
