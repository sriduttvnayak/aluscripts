HOME=/home/$(whoami)/
date > ~/logs/daily_cvs.log

echo -e "\n Starting update...!\n\n" >> ~/logs/daily_cvs.log

for i in Temp Base KT2 Edit 7_0B 7_0F 7_0S
	do
    	echo "Updating $i folder"
	    cd $HOME/Source/$i/panos
        echo $PWD >> ~/logs/daily_cvs.log
	    cvs update -d >> ~/logs/daily_cvs.log
        ./buildall.sh -S -d >> ~/logs/daily_cvs.log 
	done

echo -e "Daily CVS Update     : Done\t\t\t" $(date) >> ~/logs/daily_cvs.log
exit
