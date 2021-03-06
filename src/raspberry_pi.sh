#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" && . "./os/utils.sh"

printf "Note: This repo should be in ~/dotfiles! This is so soft links are linked correctly.\n"

ask_for_confirmation "Is this repo in ~/dotfiles?"

if ! answer_is_yes; then
  printf "Please put repo at ~/dotfiles and run this again."
  exit 1
fi

ask_for_confirmation "Do you want to run sudo apt-get update?"

if answer_is_yes; then
    sudo apt-get update
fi

if ! cmd_exists "node"; then
  sudo apt-get --yes --force-yes install node
  print_success "installed node"
fi

if ! cmd_exists "npm"; then
  sudo apt-get --yes --force-yes install npm
  print_success "installed npm"
fi

if ! cmd_exists "vim"; then
  sudo apt-get --yes --force-yes install vim-runtime vim
  print_success "installed vim"
fi

printf "Now installing vim plugins and .tmux.conf\n"

touch ~/.bash.local

ln -s ~/dotfiles/src/vim/vimrc ~/.vimrc

mkd "~/.vim/backups"
mkd "~/.vim/plugins"
mkd "~/.vim/snippets"
mkd "~/.vim/swaps"

# This has to be done manually
cp vim/vim/snippets/emmet.json ~/.vim/snippets/

# should successfully install all vim plugins.
cd os/install && ./vim.sh

ln -s ~/dotfiles/src/shell/tmux.conf ~/.tmux.conf

printf "All done. You may have to edit ~/.tmux.conf to remove some commands the OS complains about.\n"

printf "For mouse mode, try: \n"
printf "setw -g mode-mouse on \n"
printf "set -g mouse-select-pane on \n"
printf "set -g mouse-resize-pane on \n"
printf "set -g mouse-select-window on \n"

printf "Also: to set vim as default editor:\n"
print_in_purple "$ sudo update-alternatives --config editor"
