#!/bin/bash

DEFAULT_PATH_NEOVIM=""
DEFAULT_PATH_ALACRITTY=""
DEFAULT_PATH_TMUX=""
DEFAULT_PATH_ZSHRC=""


echo "YOUR CURRENT OS: $OSTYPE"
if [ "$OSTYPE" = "linux-gnu" ] ; then
	DEFAULT_PATH_NEOVIM="$HOME/.config/nvim"
	DEFAULT_PATH_FISH="$HOME/.config/fish"
	DEFAULT_PATH_ALACRITTY="$HOME/.config/alacritty"
	DEFAULT_PATH_TMUX="$HOME/.tmux.conf"
	DEFAULT_PATH_ZSHRC="$HOME/.zshrc"
fi

local_to_git() {

	echo "START SYNC ZSH (from source: $DEFAULT_PATH_ZSHRC)" 
 	rsync -avh --progress $DEFAULT_PATH_ZSHRC ./zsh

	echo "START SYNC ALACRITTY (from source: $DEFAULT_PATH_ALACRITTY)" 
 	rsync -avh --progress $DEFAULT_PATH_ALACRITTY . 

	echo "START SYNC TMUX (from source: $DEFAULT_PATH_TMUX)" 
 	rsync -avh --progress $DEFAULT_PATH_TMUX ./tmux

	echo "START SYNC NEOVIM (from source: $DEFAULT_PATH_NEOVIM)" 
 	rsync -avh --progress $DEFAULT_PATH_NEOVIM . --exclude '.gitignore' --delete

	echo "START SYNC FISH (from source: $DEFAULT_PATH_FISH)" 
 	rsync -avh --progress $DEFAULT_PATH_FISH . --exclude '.gitignore' --delete

}

git_to_local() {
	echo "START SYNC ZSH (from source: $PWD/zsh)" 
 	rsync -avh --progress ./zsh/.zshrc $DEFAULT_PATH_ZSHRC 

	echo "START SYNC ALACRITTY (from source: $PWD/.alacritty)" 
 	rsync -avh --progress  ./alacritty/ $DEFAULT_PATH_ALACRITTY

	echo "START SYNC TMUX (from source: $PWD/tmux)" 
 	rsync -avh --progress  ./tmux/.tmux.conf $DEFAULT_PATH_TMUX

	echo "START SYNC NEOVIM (from source: $PWD/nvim)" 
 	rsync -avh --progress ./nvim/ $DEFAULT_PATH_NEOVIM --exclude 'plugin' --exclude '.gitignore' --delete
}


PS3='Please enter your choice: '
options=("local->git" "git->local" "Quit")
select opt in "${options[@]}"
do
	case $opt in
      "local->git")
				local_to_git
          ;;
	     "git->local")
				git_to_local
				stop
          ;;				
      "Quit")
					break
					;;
        *) echo "invalid option $REPLY";;
    esac
done

