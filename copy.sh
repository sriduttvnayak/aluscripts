rm -rf temp_builds
rm -rf edit_builds
rm -rf network
rm -rf thirtytwo
rm -rf panos_builds

mkdir temp_builds
mkdir edit_builds
#mkdir network
#mkdir thirtytwo
mkdir panos_builds

cp -r /home/svnayak/Source/Temp/panos/bin/ /home/ftpuser/temp_builds
echo "Temp_builds builds copied"

cp -r /home/svnayak/Source/Edit/panos/bin/ /home/ftpuser/edit_builds
echo "Edit_builds builds copied"

#cp -r /home/svnayak/Source/Network/panos/bin/ /home/ftpuser/network
#echo "Network Builds... Copied"

#cp -r /home/svnayak/Source/ThirtyTwo/panos/bin/ /home/ftpuser/thirtytwo
#echo "32MB Builds... Copied"

cp -r /home/svnayak/ws/panos/bin/ /home/ftpuser/panos_builds
echo "Panos Builds... Copied"

for i in temp_builds edit_builds panos_builds
    do
	cd /home/ftpuser/$i/bin/
	mkdir SASR/
	mv /home/ftpuser/$i/bin/SASR-arc/iom.tim /home/ftpuser/$i/bin/SASR/
	mv /home/ftpuser/$i/bin/SASR-hops/cpm.tim /home/ftpuser/$i/bin/SASR/
    done

chown -R ftpuser /home/ftpuser/
