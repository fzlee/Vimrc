Vimrc
=====

NeoVIM/Vim configuration with vundle

## Qucik configuration 
1. git clone https://github.com/fzlee/Vimrc.git ~/.vim
2. git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
3. ln -s `~/`.vim/vimrc ~/.vimrc
4. vim ~/.vimrc, run `PlugInstall`
5. to update plugin installed, use `PlugUpdate`
6. to remove installed plugin , delete correspond bundle config, run `PlugClean`

## Additional steps for NeoVIM
1. `ln ~/.vim/ ~/.config/nvim` to create neovim configuration folder 
2. `ln ~/.vim/vimrc ~/.vim/init.vim` to create a neovim configuration file.
