" ALE Linter settings
let g:ale_completion_enabled = 1
let g:ale_completion_max_suggestions = 10
let g:ale_open_list = 1
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
autocmd QuitPre * if empty(&bt) | lclose | endif
"" Python Linter settings
let g:ale_python_flake8_options = '--ignore="E201,E202,E251,E301,E302,E303,E305,E501,E701"'
