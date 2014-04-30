clear
#CScope Update
cd
cd /home/$(whoami)/ws/
echo "Changed Directory to Workspace::"
cvs update panos
echo "Updating from CVS :: Done"
echo -e "Clean Update :: Cscope		 	: Started\t\t" $(date) >> ~/logs/cvs_refresh.log
rm -r cscope*
cscope -b -R -q -s panos/
ctags -R *
	# -b Build Cross Reference only, 
	# -R Run recursively
	# -u Unconditionally build Cross Reference (considers unchanged files as changed, runs longer)
	# -s Source Directory for updating

echo -e "Clean Update :: Cscope                 : Ended\t\t" $(date) >> ~/logs/cvs_refresh.log
