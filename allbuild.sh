#!/bin/sh
HOME=/home/$(whoami)/

for i in 7_0S 7_0F Base dot1q Edit KT2 Temp
    do
    echo "Updating $i folder"
    cd $HOME/Source/$i/panos
    cvs update -d
    done
echo "All Updates done on Branches"

for i in 7_0S 7_0F Base dot1q Edit KT2 Temp
    do
    cd $HOME/Source/$i/panos/
    run_now.sh
    done

echo "All Builds done on Branches"
