"Plugin setting
set nocompatible

" Set leader key
let mapleader = " "
let maplocalleader = " "
" vim-plug
call plug#begin('~/.vim/plugged')
" general plugins
Plug 'preservim/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
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

if has('termguicolors')
    set termguicolors
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
set report=0                                                      " always report number of lines changed
set nowrap                                                        " dont wrap lines
set scrolloff=2                                                   " 2 lines above/below cursor when scrolling
set number                                                        " show line numbers
set norelativenumber                                              " show absolute line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=1                                                   " show matching bracket for 0.1 seconds
set matchpairs+=<:>                                               " specially for html
set showmode                                                      " show mode in status bar (insert/replace/...)
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set lazyredraw
set ttyfast

"set nofoldenable                                                 " disable folding
set confirm                                                       " prompt when existing from an unsaved file
set history=100
set backspace=indent,eol,start                                    " More powerful backspacing
set hidden                                                        " allow switching buffers without saving
set wildmenu                                                      " enhanced command line completion
set wildmode=longest:full,full                                    " command line completion mode
let g:airline_theme='one'
colorscheme sonokai


""""""""""""""""""""
"keyboard binding 
""""""""""""""""""""
noremap <F1> <Esc>
" Disable Ex mode
nnoremap Q <nop>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" tagbar
let g:tagbar_left=1
let g:tagbar_width=20
let g:tagbar_autofocus = 0
let g:tagbar_sort = 0 
let g:tagbar_compact = 1

""""""""""""""""""""
" LSP (vim-lsp)
""""""""""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> K  <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
endfunction
augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" Tab / S-Tab to navigate the completion popup
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Enter selects the highlighted completion item (does not insert a newline)
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
