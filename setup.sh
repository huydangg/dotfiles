#!/bin/bash

HOME=pwd
CURRENT_VERSION_NVIM=""


build_prerequisites()
{
	if [ "$OSTYPE" = "linux-gnu"* ] ; then
		 echo "you chose choice 1"
	elif [ "$OSTYPE" = "darwin"* ] ; then
					# Mac OSX
		 echo "you chose choice 1"
	elif [ "$OSTYPE" = "cygwin" ] ; then
					# POSIX compatibility layer and Linux environment emulation for Windows
		 echo "you chose choice 1"
	elif [ "$OSTYPE" = "msys" ] ; then
					# Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
		 echo "you chose choice 1"
	elif [ "$OSTYPE" = "win32" ] ; then
					# I'm not sure this can happen.
		 echo "you chose choice 1"
	elif [ "$OSTYPE" = "freebsd"* ] ; then
					# ...
		 echo "you chose choice 1"
	else
					# Unknown.
		 echo "you chose choice 1"
	fi
}

pre_install_nvim()
{
	echo "Checking current version"
	CURRENT_VERSION=nvim --version

	echo "Build prerequisites"
	echo "Your current OS: $OSTYPE"
}

post_install_nvim()
{
   echo "Install dependentcies"
	 #lazygit
	 #delta git

	 echo "Applying current config"
	 cp /nvim $HOME/.config/nvim
   echo "Clear cache"
	 rm -rf neovim
}

install_nvim()
{
   echo "START INSTALL NEOVIM"
	 pre_install_nvim
   echo "Downloading latest version"
	 git clone https://github.com/neovim/neovim
	 cd neovim
	 git checkout stable
	 make CMAKE_BUILD_TYPE=Release
	 sudo make install 
	 nvim --version
}

PS3='Please enter your choice: '
options=("Auto" "Install neovim" "Install alacritty" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Auto")
            echo "you chose choice 1"
            ;;
        "Install neovim")
					install_nvim
            ;;
        "Install alacritty")
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done



