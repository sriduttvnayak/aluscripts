buildoption="build"
alloption="all"
HOME=/home/$(whoami)/
date >> ~/logs/daily_cvs.log

echo -e "\n Starting update...!\n\n" >> ~/logs/daily_cvs.log

if [ "$2" == "$alloption" ]; then
	cd $HOME/Source/Edit/
   echo "Updating 'Edit' folder"
   cvs update panos -d
fi

for i in Temp Base KT2
	do
	echo "Updating $i folder"
	cd $HOME/Source/$i
	cvs update panos -d
	done


echo -e "Daily CVS Update     : Done\t\t\t" $(date) >> ~/logs/daily_cvs.log

echo $1

if [ "$1" == "$buildoption" ]; then
	sleep 2
	clear
	echo "Build will start now..." 
	sleep 2
	if [ "$2" == "$alloption" ]; then
		cd $HOME/Source/Edit/panos/
		run_now.sh
	fi
	
	for i in Temp Base KT2
	do
		cd $HOME/Source/$i/panos/
		run_now.sh
	done
else
	sleep 2
        clear
	echo "No Build Requested..."
fi

echo -e "Daily CVS Build    : Done\t\t\t" $(date) >> ~/logs/daily_cvs.log

