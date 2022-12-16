#!/bin/bash

CURRENT_VERSION_NVIM=""


build_prerequisites()
{
	if [ "$OSTYPE" = "linux-gnu"* ] ; then
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

install_zsh()
{
		echo "START INSTALL ZSH"
   	echo "Downloading OMZ"
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		post_install_zsh
}

post_install_zsh()
{
   echo "Install dependentcies"
	 echo "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	 echo "Applying current config"
	 cp zsh/.zshrc $HOME 
	 source $HOME/.zshrc
}

PS3='Please enter your choice: '
options=("Auto" "Install neovim" "Install alacritty" "Quit")
select opt in "${options[@]}"
do
	case $opt in
        "Auto")
            echo "you chose choice 1"
            ;;
        "Install zsh")
					install_zsh
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



