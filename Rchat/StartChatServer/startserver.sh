#!/bin/bash
lgreen="\e[92m"
lred="\e[91m"
nc="\e[39m"
lyellow="\e[1;33m"
issslon=0

function exitprogram()
{
	echo ""
	echo -e $lgreen"Aight bet..."
	echo -e $lred"cya soon XD"
	exit 0
}

function checkroot()
{
	if [ $(id -u) != "0" ]; then
		echo ""
		echo You need to be root to run this script...
		echo Please start R.Deauth with [sudo ./start.sh]
		exit
	else
		echo YAY your root user!
		sleep 1
		clear
	fi
}

function netcatinstalled()
{
	nmaptool=`which nmap`
	if [[ "$?" != "0" ]]; then
		echo -e $lred"Nmap not found need to install..."
		echo -e $lgreen""
		read -p "Would you like to install Nmap? (y / n): " installnmap
		if [[ $installnmap == "y" ]]; then
			echo "Installing nmap"
			sudo apt-get update
			sudo apt-get upgrade
			sudo apt-get nmap
		fi
		if [[ $installnmap == "n" ]]; then
			echo -e $lgreen"You need nmap..."
			exit 0
		fi
	fi
	ncattool=`which ncat`
	if [[ "$?" != "0" ]]; then
		echo -e $lred"Ncat not found need to install..."
		echo -e $lgreen""
		read -p "Would you like to install Ncat? (y / n): " installncat
		if [[ $installncat == "y" ]]; then
			echo "Installing ncat"
			sudo apt-get update
			sudo apt-get upgrade
			sudo apt-get ncat
		fi
		if [[ $installnmap == "n" ]]; then
			echo -e $lgreen"You need Ncat..."
			exit 0
		fi
	fi
}	

trap exitprogram EXIT
checkroot
netcatinstalled

while :
do
	clear
	echo -e $lgreen"Welcome..."
	echo "encryption=$issslon"
	echo "1) Start $chattype chat"
	echo ""
	echo "2) Enable/Disable encryption"
	echo ""
	echo "e) Exit"
	echo ""
	read -p "-->> " menu1
	if [[ $menu1 == "1" ]]; then
		if [[ $issslon == "1" ]]; then
			while :
			do
				echo ""
				echo -e $lgreen"Chat started: "
				ncat -v -p 8888 --listen --ssl --broker -k
				echo -e $lred"something went wrong..."
				echo "restarting"
			done
		fi
		if [[ $issslon == "0" ]]; then
			while :
			do
				echo ""
				echo -e $lgreen"Chat started: "
				ncat -k -l -p 8888 --broker
				echo -e $lred"something went wrong..."
				echo "restarting"
			done
		fi
	fi
	if [[ $menu1 == "2" ]]; then
		if [[ $issslon == "0" ]]; then
			echo "Enableing encryption..."
			issslon=1
			sleep 2
		else
			echo "Disableing encryption..."
			issslon=0
			sleep 2
		fi
	fi
	if [[ $menu1 == "e" ]]; then
		exit 0
	fi

done
