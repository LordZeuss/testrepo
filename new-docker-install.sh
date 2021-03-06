#!/bin/bash

#This is a script to help install Mullvad VPN for the Raspberry pi

######################################################################

#Functions List

noanswer () { echo "Skipping..." ; }
update () { yes | sudo apt-get update && sudo apt-get upgrade; }

######################################################################

#
#System Update
#

echo "Would you like to update the system (Recommended)? (y/n)"

read yesorno

if [ "$yesorno" = y ]; then
	update
	echo "Update Successful."
elif [ "$yesorno" = n ]; then
	echo "Skipping..."
else
	echo "Not a valid answer. Exiting..."
fi



#
#Docker Script Install
#

echo "Would you like to install Docker (Required)? (y/n)"

read yesorno

if [ "$yesorno" = y ]; then
	yes | sudo apt-get install curl
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	sudo usermod -aG docker $USER
	sudo usermod -aG docker Pi
	echo "Installation Successful."
elif [ "$yesorno" = n ]; then
	echo "Skipping..."
else
	echo "Not a valid answer. Exiting..."
fi



#Docker Compose Install

echo "Would you like to install Docker Compose (Required)? (y/n)"

read yesorno

if [ "$yesorno" = y ]; then
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
	echo "Installation Successful."
elif [ "$yesorno" = n ]; then
	echo "Skipping..."
else
	echo "Not a valid answer. Exiting..."
fi

