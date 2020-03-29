let g:deoplete#enable_at_startup = 1
if system('uname -m') != "x86_64\n"
	let g:deoplete#ignore_sources = { '_': ['tabnine'] }
endif
