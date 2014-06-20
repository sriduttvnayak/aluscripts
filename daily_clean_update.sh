buildoption="build"
alloption="all"
HOME=/home/svnayak/
date >> ~/logs/daily_cvs.log

echo -e "\n Starting update...!\n\n" >> ~/logs/daily_cvs.log

if [ "$2" == "$alloption" ]; then
	cd $HOME/Source/Edit/
   echo "Updating 'Edit' folder"
   cvs update panos
fi

cd $HOME/Source/Temp/
echo "Updating 'Temp' folder"
cvs update panos

cd $HOME/Source/Base/
echo "Updating 'Base' folder"
cvs update panos

echo -e "Daily CVS Update     : Done\t\t\t" $(date) >> ~/logs/daily_cvs.log

echo $1

if [ "$1" == "$buildoption" ]; then
	sleep 2
	clear
	echo "Build will start now..." 
	sleep 2
	if [ "$2" == "$alloption" ]; then
		cd $HOME/Source/Edit/panos/
		clean_run.sh
	fi
	cd $HOME/Source/Temp/panos/
	clean_run.sh
	cd $HOME/Source/Base/panos/
	clean_run.sh
else
	sleep 2
        clear
	echo "No Build Requested..."
fi

echo -e "Daily CVS Build    : Done\t\t\t" $(date) >> ~/logs/daily_cvs.log
