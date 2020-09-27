#!/bin/bash

# script to install vim preferences onto linux os
echo "Welcome to pecan-pine's vim configuration script. This script is only for linux systems. The script will copy vim configuration files to your home directory if you don't already have some vim configuration files."

# ask for permission to proceed
while true; do
	read -p "Proceed? [Y/n]: " yn
	case $yn in 
		[Yy]*|"") echo "Proceeding..."; break;;
		[Nn]*) echo "Aborting..."; exit 1;;
	esac
done

# get full paths to vimrc and dotvim folder
vimrc="$PWD/.vimrc"
dotvim="$PWD/vim"

# put vimrc in home directory if there isn't already one there
echo "Checking for .vimrc files..."
cd $HOME
if [[ -f .vimrc ]]
then
	echo "there is already a .vimrc here. Consider copying changes over yourself."
else 
	echo "copying .vimrc file to home directory $HOME..."
	cp $vimrc ./.vimrc
fi

# put vim folder in home directory as .vim if there isn't already one there
echo "Checking for .vim directory..."
if [[ -d .vim ]]
then
	echo "there is already a .vim folder here. Consider copying over the plugins yourself."
else
	echo "copying .vim folder to home directory $HOME..."
	cp -r $dotvim ./.vim
fi

echo "done"

