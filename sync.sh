#!/bin/bash

DEFAULT_PATH_NEOVIM=""
DEFAULT_PATH_ALACRITTY=""
DEFAULT_PATH_TMUX=""
DEFAULT_PATH_ZSHRC=""


echo "YOUR CURRENT OS: $OSTYPE"
if [ "$OSTYPE" = "linux-gnu" ] ; then
	DEFAULT_PATH_NEOVIM="$HOME/.config/nvim"
	DEFAULT_PATH_ALACRITTY="$HOME/.config/alacritty"
	DEFAULT_PATH_TMUX="$HOME/.tmux.conf"
	DEFAULT_PATH_ZSHRC="$HOME/.zshrc"
fi

sync_nvim()
{
	echo "START SYNC NEOVIM (from source: $DEFAULT_PATH_NEOVIM)" 
 	rsync -avh --progress $DEFAULT_PATH_NEOVIM . --exclude 'plugin' --exclude '.gitignore' --delete
}

sync_alacritty()
{
	echo "START SYNC ALACRITTY (from source: $DEFAULT_PATH_ALACRITTY)" 
 	rsync -avh --progress $DEFAULT_PATH_ALACRITTY . 
}

sync_tmux()
{
	echo "START SYNC TMUX (from source: $DEFAULT_PATH_TMUX)" 
 	rsync -avz --progress $DEFAULT_PATH_TMUX ./tmux
}

sync_zsh()
{
	echo "START SYNC ZSH (from source: $DEFAULT_PATH_ZSHRC)" 
 	rsync -avz --progress $DEFAULT_PATH_ZSHRC ./zsh
}

PS3='Please enter your choice: '
options=("All" "Quit")
select opt in "${options[@]}"
do
	case $opt in
      "All")
				sync_zsh
				sync_alacritty
				sync_tmux
				sync_nvim
          ;;
      "Quit")
					break
					;;
        *) echo "invalid option $REPLY";;
    esac
done

