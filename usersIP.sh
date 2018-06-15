#!/bin/bash
file="usersAndIP.txt"


if [ -f $file ] ; then
    echo "file already exists would you like to delete it?"
    read input
    if [ $input = "y" ]; then
	rm $file
    fi
fi
echo "----------Users currently logged in ----------- " >> $file

who >> $file
echo "---------------" >> $file
echo "----------IP address of machine ----------" >> $file
ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' >>  $file
