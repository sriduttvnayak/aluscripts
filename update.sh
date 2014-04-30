date >> ~/daily.log

wsPath=/home/$(whoami)/ws
buildpath=$wsPath/panos

cd $wsPath

DIR=panos

#CVS Update
echo -e "Daily Update :: Checkout	: Started\t\t" $(date) >> ~/daily.log
if [ -d "$DIR" ]
then
	cvs update panos
else
	cvs checkout panos
fi
echo -e "Daily Update :: Checkout	: Done\t\t\t" $(date) >> ~/daily.log
cp /home/svnayak/Documents/Work/Scripts/prefs.mk $buildpath

#Build All
echo -e "Daily Update :: Build		: Started\t\t" $(date) >> ~/daily.log

cd $buildpath
$buildpath/buildall.sh -S -d
echo -e "Daily Update :: Build		: Done\t\t\t" $(date) >> ~/daily.log

#CScope Update
echo -e "Daily Update :: Cscope		: Started\t\t" $(date) >> ~/daily.log
cd $wsPath
cscope -b -R -s panos/
	# -b Build Cross Reference only, 
	# -R Run recursively
	# -u Unconditionally build Cross Reference (considers unchanged files as changed, runs longer)
	# -s Source Directory for updating
echo -e "Daily Update :: Cscope		: Done\t\t\t" $(date) >> ~/daily.log

exit 0
