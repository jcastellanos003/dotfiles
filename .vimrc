syntax on
set nocompatible              " be iMproved, required
set encoding=utf-8
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set laststatus=2
set hidden
set number
set completeopt-=preview
filetype off                  " required

filetype off
filetype plugin on
filetype plugin indent on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'moll/vim-node'

Plugin 'sjbach/lusty'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
let mapleader = "\<Space>"

let g:NERDTreeDirArrowExpandable = '+' 
let g:NERDTreeDirArrowCollapsible = '~'

map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>w <C-w>w
