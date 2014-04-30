date >> ~/daily_cvs.log

echo -e "\nNOTE :: Edit folder not updated everyday. Your changes reside there.!\n\n" >> ~/daily_cvs.log

wsPath=/home/svnayak/Source
DIR=panos

for i in Base Network Temp ThirtyTwo
  do
    cd $wsPath/$i
    if [ -d "$DIR" ]
    then
	cvs update panos
    else
	cvs checkout panos
    fi
    
    echo -e "Daily CVS Update :: $i	: Done\t\t\t" $(date) >> ~/daily_cvs.log
  done

for i in Base Edit Temp
  do
    cd $wsPath/$i/$DIR
    echo "Folder is $i"
    run_now.sh
  done

exit 0
