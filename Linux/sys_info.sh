#!/bin/bash

output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
filePerm=$(find /home -type f -perm 777)

files=( '/etc/passwd' '/etc/shadow' )

if [ ! -d $HOME/research ]
then
    mkdir $HOME/reasearch
fi

if [ -f $output ]
then
    rm $output
fi

echo "Today's date is $(date)" >> $output

echo "uname is: $(uname -a)" >> $output

echo -e "IP address is: " $ip  >> $output

echo "Hostname : $(hostname)" >> $output

echo "executable files in /home directory" $filePerm  >> $output


for file in ${files[@]};
do
    ls -l $file >> $output

done
