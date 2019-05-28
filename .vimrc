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
call vundle#end()
filetype plugin indent on

set number
set cursorline

set tabstop=6
set noexpandtab
set smartindent
set shiftwidth=6

set spell
"set spelllang=en,ru
set spelllang=en,cjk
highlight clear SpellBad
highlight SpellBad cterm=underline

syntax on

"IndentConsistencyCop
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_theme = 'deus'
let g:airline_solarized_bg = 'dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" Airline ALE extension
let g:airline#extensions#ale#enabled = 1
"call airline#parts#define_function('ALE', 'ALEGetStatusLine')
"call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
"let g:airline_section_error = airline#section#create_left(['ALE'])
let airline#extensions#ale#error_symbol = '✕ '
let airline#extensions#ale#warning_symbol = '⚠ '
"let g:airline#extensions#

" ALE Linter settings
let g:ale_open_list = 1
let g:ale_set_signs = 1
"let g:ale_sign_column_always = 1
autocmd QuitPre * if empty(&bt) | lclose | endif
"" Python Linter settings
let g:ale_python_flake8_options = '--ignore="E201,E202,E251,E301,E302,E303,E305,E501,E701"'


" Key mapping
map <C-n> :NERDTreeToggle<CR>
"" Split op. mapping
nnoremap s <nop>
nnoremap sp :sp<CR>
nnoremap sv :vsp<CR>
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap s< <C-w><
nnoremap s> <C-w>>
"" Tab op. mapping
nnoremap st :tabnew<CR>
