# To install vim plugins and tmux config

Note: this is all assuming dotfiles repo has been cloned to ~/dotfiles/

touch .bash.local

ln -s ~/dotfiles/src/vim/vimrc .vimrc

cd ~/dotfiles/src/os/install 
./vim.sh # should successfully install all plugins


ln -s dotfiles/src/shell/tmux.conf .tmux.conf  # note, might have to edit the file to remove some commands the OS complains about
