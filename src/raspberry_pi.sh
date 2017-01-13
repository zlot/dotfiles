#!/bin/sh

echo -e "Running sudo apt-get update\n"
sudo apt-get update

echo -e "Installing vim\n"
sudo apt-get --yes --force-yes install vim-runtime vim
printf "Note: This repo should be in ~/dotfiles! This is so soft links are linked correctly.\n"

printf "Install vim plugins, and tmux config\n"

touch ~/.bash.local

ln -s ~/dotfiles/src/vim/vimrc ~/.vimrc

# should successfully install all vim plugins.
cd os/install && ./vim.sh

ln -s ~/dotfiles/src/shell/tmux.conf ~/.tmux.conf

printf "All done. You may have to edit ~/.tmux.conf to remove some commands the OS complains about.\n"

printf "For mouse mode, try: \n"
printf "setw -g mode-mouse on \n"
printf "set -g mouse-select-pane on \n"
printf "set -g mouse-resize-pane on \n"
printf "set -g mouse-select-window on \n"
