#!/bin/bash

#Test file for cscoping required files

if [ -f cscope.files ]
    then
        rm -f cscope.files
fi

echo "Starting to build the cscope files..."

for i in pip bcm agent pmgr iom svcmgr pip bcm bcm_simfw mdadrv oam bcm_hw common iom_api qos pchip_code platform mplsng bcmhost cmp chmgr
    do 
		find $i -name "*.c" -not -name ".#*" -and -not -name "*CVS*"  >> cscope.files
		find $i -name "*.h" -not -name ".#*" -and -not -name "*CVS*"  >> cscope.files
		find $i -name "*.cpp" -not -name ".#*" -and -not -name "*CVS*"  >> cscope.files
		#find $i -name "*.MIB" -not -name ".#*" -and -not -name "*CVS*"  >> cscope.files
		find $i -name "*.ccp" -not -name ".#*" -and -not -name "*CVS*"  >> cscope.files
	done

clear	#Clear the command line
ctags -R *
echo "File list generated"
echo "Generating cross references"
cscope -bRq

exit 0
