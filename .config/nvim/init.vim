set nocompatible

let s:dein_plugin = expand('~/.cache/dein')
let s:dein_path = s:dein_plugin . '/repos/github.com/Shogo/dein.vim'
let g:python3_host_prog = substitute(system('which python3'), "\n", "", "")

if !isdirectory(s:dein_plugin)
	execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_path
endif
execute 'set runtimepath+=' . s:dein_path

if dein#load_state(s:dein_plugin)
	call dein#begin(s:dein_plugin)

	call dein#load_toml('~/.config/nvim/dein.toml', { 'lazy': 0 })
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', { 'lazy': 1 })

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on

runtime! conf.d/*.vim
