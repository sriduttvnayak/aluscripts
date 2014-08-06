date >> ~/weekly.log

wsPath=/home/$(whoami)/clean_build/
buildpath=$wsPath/panos

cd $wsPath
rm -rf panos

DIR=panos

#CVS Update
echo -e "Weekly Update :: Checkout	: Started\t\t" $(date) >> ~/weekly.log
if [ -d "$DIR" ]
then
	cvs update panos -d
else
	cvs checkout panos
fi
echo -e "Weekly Update :: Checkout	: Done\t\t\t" $(date) >> ~/weekly.log
cp /home/svnayak/Documents/Work/Scripts/prefs.mk $buildpath

#Build All
echo -e "Weekly Update :: Build		: Started\t\t" $(date) >> ~/weekly.log

cd $buildpath
$buildpath/buildall.sh -S -d
echo -e "Weekly Update :: Build		: Done\t\t\t" $(date) >> ~/weekly.log

#CScope Update
echo -e "Weekly Update :: Cscope		: Started\t\t" $(date) >> ~/weekly.log
cd $wsPath
cscope -u -b -R -s panos/
	# -b Build Cross Reference only, 
	# -R Run recursively
	# -u Unconditionally build Cross Reference (considers unchanged files as changed, runs longer)
	# -s Source Directory for updating
echo -e "Weekly Update :: Cscope		: Done\t\t\t" $(date) >> ~/weekly.log

exit 0
