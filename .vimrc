" break vi compatibility in favour of vim settings
set nocompatible

set encoding=utf-8

" fire up pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim

" pathogen
execute pathogen#infect()

" enable syntax highlighting
filetype plugin indent on
syntax on

" solarized
set background=dark
colorscheme solarized

" indentation settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" automatic indenting
set smartindent
set autoindent

" manual indenting
set smarttab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" searching
set hlsearch                " hilight search matches
set incsearch               " go to search results as you type
set ignorecase smartcase    " select case-insenitive search (not default)

" tags
set tags+=./.tags;

" put a marker in column 120
set colorcolumn=120

" fold by syntax
set foldmethod=syntax

" enable mouse
"set mouse=a " disabled in favour of os mouse functionality

set number                  " enable line numbers

" send more characters from redraws
set ttyfast

" show cursor line and column in the status line
set ruler

"show (partial) commands in status line
set showcmd

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

"enable wrapping for tex and .txt files
autocmd FileType tex setlocal wrap
autocmd BufNewFile,BufRead *.txt setlocal wrap

" set shell depending on OS
if has('win32')
    set shell=powershell
    command Powershell !start powershell
endif

" spell checking
if v:version >= 700
	" enable spellchecking
	"set spell

	"enable spellchecking for tex files
	autocmd FileType tex setlocal spell

	"enable spellchecking for .txt files
	autocmd BufNewFile,BufRead *.txt setlocal spell

	" set language
	setlocal spelllang=en_gb
endif

" restore cursor position in files
if has ("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

