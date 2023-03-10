#!/bin/bash

CURRENT_VERSION_NVIM=""

# TODO
# Set tap to click
# /etc/X11/xorg.conf.d/40-libinput.conf
# --------------------------
# Section "InputClass"
#         Identifier "libinput touchpad catchall"
#         MatchIsTouchpad "on"
#         MatchDevicePath "/dev/input/event*"
#         Driver "libinput"
# 	Option "Tapping" "on"
# EndSection
#
# Fix bluetooth autosuspend
#/etc/default/grub
#Add this line: GRUB_CMDLINE_LINUX_DEFAULT="usbcore.autosuspend=0"
#sudo grub2-mkconfig -o /boot/grub2/grub.cfg
build_prerequisites()
{
	if [ "$OSTYPE" = "linux-gnu" ] ; then
		 sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
	fi
}

pre_install_nvim()
{
	echo "Checking current version"
	CURRENT_VERSION=$(nvim --version)

	echo "Build prerequisites"
	echo "Your current OS: $OSTYPE"
	build_prerequisites
	
}

post_install_nvim()
{
   echo "Install dependentcies"
	 #lazygit
	 LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' |  sed -E 's/.*"v*([^"]+)".*/\1/')
	 curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	 sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
	 lazygit --version
	 #	------
	 #delta git
	 echo "Applying current config"
	 rsync -a nvim/ $HOME/.config/nvim
   echo "Clear cache"
	 rm -rf neovim
}

install_nvim()
{
   echo "START INSTALL NEOVIM"
	 pre_install_nvim
   echo "Downloading latest version"
	 git clone https://github.com/neovim/neovim
	 echo "Installing  on path: $PWD"
	 (cd neovim && git checkout stable && make distclean; make CMAKE_BUILD_TYPE=Release && sudo make install) 
	 nvim --version
	 post_install_nvim
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
options=("Install zsh" "Install neovim" "Install alacritty" "Quit")
select opt in "${options[@]}"
do
	case $opt in
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



