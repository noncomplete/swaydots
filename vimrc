call plug#begin()
Plug 'tribela/vim-transparent'
call plug#end()

" show the filename in the window titlebar
set title

" shows incomplete command
set showcmd

" set encoding
set encoding=utf-8

" mouse support
set mouse=a

" line numbers
set number
set relativenumber

" When auto-indenting, use the indenting format of the previous line
set copyindent
" When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.
" 'tabstop' is used in other places. A <BS> will delete a 'shiftwidth' worth of
" space at the start of the line.
set smarttab
" Copy indent from current line when starting a new line (typing <CR> in Insert
" mode or when using the "o" or "O" command)
set autoindent
" Automatically inserts one extra level of indentation in some cases, and works
" for C-like files
set smartindent

syntax enable

colorscheme quiet
highlight LineNr ctermfg=Darkgrey
autocmd InsertEnter,InsertLeave * set cul!

filetype plugin indent on
