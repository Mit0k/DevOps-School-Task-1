#!/bin/bash
function isRunnedAsRoot()
{
	if [ "$EUID" -ne 0 ] 
	then
		echo "Please run as superuser"
		false
	else
		true
	fi
}

function isUserExist()
{
	if id "$1" &>/dev/null; 
	then
		true
	else
		echo "User not exist"
		false
	fi
}

function isDirectoryExist()
{
	if [ -d "$1" ]; 
	then
		true
	else
		echo "Directory not exist"
		false
	fi
}


if isRunnedAsRoot && isUserExist $1 && isDirectoryExist $2
then
	echo `chown -R $1 $2` &> /dev/null
	echo "Succefully done" 
fi

