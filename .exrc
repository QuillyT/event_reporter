if &cp | set nocp | endif
nnoremap <silent>  :nohlsearch
nnoremap ,, 
vmap [% [%m'gv``
vmap ]% ]%m'gv``
vmap a% [%v]%
let s:cpo_save=&cpo
set cpo&vim
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cmdheight=2
set complete=.,w,b,u,t
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set helplang=en
set hidden
set history=10000
set hlsearch
set incsearch
set laststatus=2
set listchars=tab:\ \ ,trail:·
set modelines=0
set nrformats=hex
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vim-colors-solarized,~/.vim/bundle/vim-sensible,/usr/share/vim/vimfiles,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=1
set shell=bash
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set showtabline=2
set sidescrolloff=5
set smarttab
set tabpagemax=50
set tabstop=2
set ttimeout
set ttimeoutlen=50
set viminfo=!,'100,<50,s10,h
set wildmenu
set window=0
" vim: set ft=vim :
