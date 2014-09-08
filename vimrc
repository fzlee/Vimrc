"Bundle setting
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Bundle plugin installation"
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kevinw/pyflakes-vim'
Bundle 'Valloric/YouCompleteMe'


" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion 
syntax enable
syntax on

"highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search operations
set incsearch
set ignorecase
set hlsearch                                                      " "hightlight search
set smartcase
" editor settings
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \  if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif
"set nofoldenable                                                 " disable folding
set confirm                                                       " prompt when existing from an unsaved file
set history=100
set backspace=indent,eol,start                                    " More powerful backspacing

" display settings
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=2                                                   " 2 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=1                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set showmode                                                      " show mode in status bar (insert/replace/...)
set autoindent
set smartindent     

"code highlight customize
"let g:rehash256 = 1
"colorscheme molokai

let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
set background=light
colorscheme solarized

"keyboard binding 
noremap <F1> <Esc>
nmap <F2> :call CompileRunGcc()<cr>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1
hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 
let g:tagbar_compact = 1

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=25
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"


"""""""""""""""""""""""""""""""""""""""
"auto complete file head
"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py,*.cc,*.sh,*.java exec ":call SetTitle()"        
"新建.py,.cc,.java,.sh,  
""定义函数SetTitle，自动插入文件头  
func SetTitle()  
        if &filetype == 'sh'  
                call setline(1, "#!/bin/bash")  
                call setline(2, "\# File Name: ".expand("%"))  
                call setline(3, "\# Author: fzlee")  
                call setline(4, "\# Created Time : ".strftime("%Y/%m/%d %H:%M"))   
                call setline(5, "\# Description:")  
                call setline(6, "PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin")  
                call setline(7, "export PATH")    
        endif    
        if &filetype == 'python'  
                call setline(1, "\#!/usr/bin/env python")  
                call setline(2, "\#coding: utf-8")  
                call setline(3, "\# Author: fzlee")  
                call setline(4, "\# Created Time : ".strftime("%Y/%m/%d %H:%M"))  
                call setline(5, "")  
                call setline(6, "\# File Name: ".expand("%"))  
                call setline(7, "\# Description:")  
                call setline(8, "")  
                call setline(9, "if __name__==\"__main__\":")  
                call setline(10, "    pass")  
                call setline(11,"")  
        endif  
        if &filetype == 'java'  
                call setline(1, "//coding=utf8")  
                call setline(2, "/*************************************************************************")  
                call setline(3, "\ @Author: fzlee")  
                call setline(4, "\ @Created Time : ".strftime("%Y/%m/%d %H:%M"))  
                call setline(5, "")  
                call setline(6, "\ @File Name: ".expand("%"))  
                call setline(7, "\ @Description:")  
                call setline(8, "")  
                call setline(9, " ************************************************************************/")  
                call setline(10,"")  
        endif  
endfunc

func CompileRunGcc()
    exec "w"
    if &filetype == 'python'
	exec "!python %"
    elseif &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc


