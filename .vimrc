set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'inkarkat/vim-IndentConsistencyCop'
Plugin 'itchyny/landscape.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive.git'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tokorom/vim-review'
Plugin 'lervag/vimtex'
Plugin 'digitaltoad/vim-pug'
Plugin 'ntk148v/vim-horizon'
Plugin 'flrnprz/plastic.vim'
Plugin 'nightsense/snow'
Plugin 'tpope/vim-surround'
Plugin 'cohama/lexima.vim'
call vundle#end()
filetype plugin indent on


" include config
runtime! conf.d/*.vim

"IndentConsistencyCop
