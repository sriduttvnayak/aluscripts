echo "Update on HEAD :: Started"

cd /var/opengrok/src/HEAD
cvs update panos
sleep 3
clear

echo "Update on HEAD :: Done"

cd /var/opengrok/
sudo ./bin/OpenGrok index
sudo ./bin/OpenGrok deploy

cd
