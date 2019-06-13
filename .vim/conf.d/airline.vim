if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
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
let airline#extensions#ale#error_symbol = '✕ '
let airline#extensions#ale#warning_symbol = '⚠ '
