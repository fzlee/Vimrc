"Plugin setting
set nocompatible
" vim-plug
call plug#begin('~/.vim/plugged')
" general plugins
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Lokaltog/vim-powerline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'rakr/vim-one'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" compability configuration for vim and neovim
set guicursor=

" file encoding
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" syntax on
syntax enable

" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
" avoid confliction between syntastic and python-mode
autocmd FileType python let g:syntastic_check_on_wq = 0

if has('termguicolors')
    set termguicolors
else
endif

"highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

""""""""""""""""""""
" search operations
""""""""""""""""""""
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

""""""""""""""""""""
" display settings
""""""""""""""""""""
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

"color scheme for one dark light
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark
let g:airline_theme='one'
colorscheme one

" specify python path, so we don't have to install neovim  for each python virtualenv
" let g:python_host_prog = '~/.virtualenvs/neovim/bin/python'
" let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/Users/fzlee/.pyenv/versions/neovim/bin/python'
let g:ycm_path_to_python_interpreter = '/Users/fzlee/.pyenv/versions/neovim/bin/python'


""""""""
"config for coc
""""""""
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


call coc#config('python', {
  \   'jediEnabled': v:false,
  \   'pythonPath': split(execute('!which python'), '\n')[-1]
  \ })


""""""""""""""""""""
" Python-mode
""""""""""""""""""""
let g:pymode_python = 'python3'
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
let g:pymode_options_max_line_length = 100
"Set PEP8 options                                  *'g:pymode_lint_options_pep8'*
let g:pymode_lint_options_pep8 = ({'max_line_length': g:pymode_options_max_line_length})
"Setup pymode |quickfix| window
let g:pymode_quickfix_minheight = 4
let g:pymode_quickfix_maxheight = 4

"turn off rope
let g:pymode_rope = 0
"Don't Place error |signs|                                             *'g:pymode_signs'*
let g:pymode_lint_signs = 0
"Turn off code completion support in the plugin       *'g:pymode_rope_completion'*
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

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


"config for gundo
""""""""""""""""""""
let g:gundo_width = 40
let g:gundo_preview_height = 40
let g:gundo_right = 1


""""""""""""""""""""
"keyboard binding 
""""""""""""""""""""
noremap <F1> <Esc>
" Disable Ex mode
nnoremap Q <nop>
nmap <F2> :call CompileRunGcc()<cr>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F7> :PymodeLintAuto<cr>
nmap <F8> :GundoToggle<cr>
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
let g:tagbar_width=20
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0 
let g:tagbar_compact = 1

" support for smali
let g:tagbar_type_smali = {'ctagstype' : 'smali', 'kinds' : ['f:field', 'm:method',]}

" Nerd Tree 
let NERDChristmasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" bug fix for OSX iTerm2, mouse reporting issue
if has('mouse_sgr')
    set ttymouse=sgr
endif

" config for go ctags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
    \ }

"""""""""""""""""""""""""""""""""""""""
"auto complete file head
"""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.py,*.cc,*.sh,*.java,*.c,*.cpp exec ":call SetTitle()"        
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"新建.py,.cc,.java,.sh,  
""定义函数SetTitle，自动插入文件头  
func SetTitle()  
        if &filetype == 'sh'  
                call setline(1, "#!/bin/bash")  
                call setline(2, "\# File Name: ".expand("%"))  
                call setline(3, "\# Created Time : ".strftime("%Y/%m/%d %H:%M"))   
                call setline(4, "\# Description:")  
                call setline(5, "PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin")  
                call setline(6, "export PATH")    
        endif    
        if &filetype == 'python'  
                call setline(1, "\"\"\"")  
                call setline(2, "    ".expand("%"))
                call setline(3, "    ~~~~~~~~~~")
                call setline(4, "")
                call setline(5, "\"\"\"")  
        endif  
        if &filetype == 'java'  
                call setline(1, "//coding=utf8")  
                call setline(2, "/*************************************************************************")  
                call setline(3, "\ @Created Time : ".strftime("%Y/%m/%d %H:%M"))  
                call setline(4, "")  
                call setline(5, "\ @File Name: ".expand("%"))  
                call setline(6, "\ @Description:")  
                call setline(7, "")  
                call setline(8, " ************************************************************************/")  
                call setline(9,"")  
        endif  
        if &filetype == 'cpp'
                call setline(1,"//Source:    ")
                call setline(2,"//Date:      ".strftime("%Y/%m/%d %H:%M"))
                call setline(3,"")
                call setline(4,"#include<iostream>")
                call setline(5,"using namespace std;")
                call setline(6,"")
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
