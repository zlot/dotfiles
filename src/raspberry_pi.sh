#!/bin/sh

echo -e "Install vim plugins, and tmux config\n"
echo -e "This repo should be in ~/dotfiles"

touch ~/.bash.local

ln -s ~/dotfiles/src/vim/vimrc ~/.vimrc

# should successfully install all vim plugins.
cd os/install && ./vim.sh

ln -s ~/dotfiles/src/shell/tmux.conf ~/.tmux.conf

echo -e "All done. You may have to edit ~/.tmux.conf to remove some commands the OS complains about.\n"

echo -e "For mouse mode, try: \n"
echo -e "setw -g mode-mouse on \n"
echo -e "set -g mouse-select-pane on \n"
echo -e "set -g mouse-resize-pane on \n"
echo -e "set -g mouse-select-window on \n"
