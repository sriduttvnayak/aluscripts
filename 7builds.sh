#!/bin/sh
HOME=/home/$(whoami)/

for i in 7_0S 7_0F
    do
    echo "Updating $i folder"
    cd $HOME/Source/$i/panos
    cvs update -d
    done
exit

for i in 7_0S 7_0F
    do
    cd $HOME/Source/$i/panos/
    run_now.sh
    done

echo "All Builds done on 7_0 Branches"
