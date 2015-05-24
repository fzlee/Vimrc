"Bundle setting
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle  'gmarik/Vundle.vim'
"Bundle plugin installation"
Bundle 'The-NERD-tree'
Bundle 'Tagbar'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Townk/vim-autoclose'
Bundle 'klen/python-mode'
Bundle 'sjl/gundo.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set shiftwidth=4

"set nofoldenable                                                 " disable folding
set confirm                                                       " prompt when existing from an unsaved file
set history=100
set backspace=indent,eol,start                                    " More powerful backspacing
"code highlight customize
let g:rehash256 = 1
"colorscheme molokai

let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
set background=light
colorscheme solarized


" Python-mode
"Enable all python highlights                          *'g:pymode_syntax_all'*
let g:pymode_syntax_all = 1
"Turn on pymode syntax                                        *'g:pymode_syntax'*
let g:pymode_syntax = 1
"Enable automatic virtualenv detection                     *'g:pymode_virtualenv'*
let g:pymode_virtualenv = 1
"Enable pymode folding                                       *'g:pymode_folding'*
let g:pymode_folding = 0
"Turns on the documentation script                               *'g:pymode_doc'*
let g:pymode_doc = 0
"Turn on code checking                                          *'g:pymode_lint'*
let g:pymode_lint = 1
"Check code on every save (if file has been modified)  *'g:pymode_lint_on_write'*
"let g:pymode_lint_on_write = 1
"Show error message if cursor placed at the error line  *'g:pymode_lint_message'*
let g:pymode_lint_message = 1
"Check code when editing (on the fly)                        *'g:pymode_lint_on_fly'*
"let g:pymode_lint_on_fly = 1
"Check code on every save (every)                    *'g:pymode_lint_unmodified'*
let g:pymode_lint_unmodified = 1
"Default code checkers (you could set several)         *'g:pymode_lint_checkers'*
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
"Setup max line length                       *'g:pymode_options_max_line_length'*
let g:pymode_options_max_line_length = 79
"Set PEP8 options                                  *'g:pymode_lint_options_pep8'*
let g:pymode_lint_options_pep8 = ({'max_line_length': g:pymode_options_max_line_length})
"Setup pymode |quickfix| window
let g:pymode_quickfix_minheight = 4
let g:pymode_quickfix_maxheight = 4

"Don't Place error |signs|                                             *'g:pymode_signs'*
let g:pymode_lint_signs = 0
"Turn off code completion support in the plugin       *'g:pymode_rope_completion'*
let g:pymode_rope_completion = 0

"Disable markdown folding
let g:vim_markdown_folding_disabled=1
"Trim unused white spaces on save                   *'g:pymode_trim_whitespaces'*
let g:pymode_trim_whitespaces = 1
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 1

"config for gunco
let g:gundo_width = 40
let g:gundo_preview_height = 40
let g:gundo_right = 1

"keyboard binding 
noremap <F1> <Esc>
nmap <F2> :call CompileRunGcc()<cr>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F7> :PymodeLintAuto<cr>
nmap <F8> :GundoToggle<CR>
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
autocmd BufNewFile *.py,*.cc,*.sh,*.java,*.c,*.cpp exec ":call SetTitle()"        
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
                call setline(1, "\#!/usr/bin/env python3")  
                call setline(2, "\# coding: utf-8")  
                call setline(3, "\"\"\"")  
                call setline(4, "    ".expand("%"))
                call setline(5, "    ~~~~~~~~~~")
                call setline(6, "")
                call setline(7, "\"\"\"")  
                call setline(8,"")  
                call setline(9, "if __name__ == \"__main__\":")  
                call setline(10, "    pass")  
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
        if &filetype == 'cpp'
                call setline(1,"//Source:    ")
                call setline(2,"//Author:    fzlee")
                call setline(3,"//Date:      ".strftime("%Y/%m/%d %H:%M"))
                call setline(4,"")
                call setline(5,"#include<iostream>")
                call setline(6,"using namespace std;")
                call setline(7,"")
        endif
endfunc

func CompileRunGcc()
    exec "w"
    if &filetype == 'python'
	exec "!python %"
    elseif &filetype == 'c'
        exec "!g++ % -o %<.out"
        exec "! ./%<.out"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<.out"
        exec "! ./%<.out"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc


