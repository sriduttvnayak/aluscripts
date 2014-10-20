DATE=`date "+%d%m%Y"`
cvs diff -u -U 5 > $DATE.diff
grep -i "? panos" $DATE.diff > tmp.diff     #MATCH STRING is "? panos"
grep -vf tmp.diff $DATE.diff > tmp1.diff
mv tmp1.diff $DATE.diff
rm tmp*.diff
