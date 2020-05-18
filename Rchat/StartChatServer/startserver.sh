#!/bin/bash
lgreen="\e[92m"
lred="\e[91m"
nc="\e[39m"
lyellow="\e[1;33m"

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
	ncattool=`which ncat`
	if [[ "$?" == "0" ]]; then
		echo ""
		echo -e $lred"You need ncat to use this tool"
		read -p "Would you like to install? (y / n): " yesnorno
		if [[ $yesnorno == "y" ]]; then
			echo -e $lgreen"Installing..."
			sudo apt-get install ncat
			echo "Tools installed..."
			echo "Restart script :)"
			exit 0
		fi
		if [[ $ncattool == "n" ]]; then
			echo -e $lred"You need ncat to use the script..."
			exit 0
		fi
	fi
}	

trap exitprogram EXIT
checkroot
netcatinstalled

while :
do
	echo -e $lgreen"Starting Chat: "
	while :
	do
		echo ""
		echo -e $lgreen"Chat started: "
		ncat -k -l -p 8888 --broker
		echo -e $lred"Something went wrong..."
		echo "restarting..."
	done

done
