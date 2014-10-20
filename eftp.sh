#!/bin/sh
HOST="135.250.26.125"
USER="ftpuser"
PASSWD="ftpuser"
#FILE="IxView_0.log"
FOLDER="bin"
ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
#get $FILE
mput 
quit
END_SCRIPT
