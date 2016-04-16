Vimrc
=====

Vim configuration using vundle

##To use this repository
1. git clone https://github.com/fzlee/Vimrc.git ~/.vim
2. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. ln -s `~/`.vim/vimrc ~/.vimrc
4. vim ~/.vimrc, run PluginInstall
5. apt-get install ctags, cmake, python-dev, build-essential.
6. cd ~/.vim/bundle/YouCompleteMe, run ./install.sh, if vim version is below 7.3.598, you should try neocomplete instead 
7. to update plugin installed, use BundleUpdate
8. to remove installed plugin , delete correspond bundle config, run BundleClean

## To use neovim
1. `mkdir -p ~/.config/nvim` to create a neovim config folder.
2. `ln ~/.vim/vimrc ~/.config/nvim/init.vim` to create neovim config file.
3. `ln ~/.vim/colors ~/.config/nvim/` to create color scheme folder.
