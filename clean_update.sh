HOME=/home/$(whoami)/
date > ~/logs/weekly_cvs.log

echo -e "\n Starting update...!\n\n" >> ~/logs/weekly_cvs.log

for i in Temp Base KT2 Edit 7_0B 7_0F 7_0S 6_0B 6_0S 6_1F 6_1S
	do
	echo "Updating $i folder"
	cd $HOME/Source/$i/panos
    echo $PWD >> ~/logs/weekly_cvs.log
	cvs update -d
    ./buildall.sh -S -d -c >> ~/logs/weekly_cvs.log
    ./buildall.sh -S -d
	done

echo -e "Daily CVS Update     : Done\t\t\t" $(date) >> ~/logs/weekly_cvs.log
exit
