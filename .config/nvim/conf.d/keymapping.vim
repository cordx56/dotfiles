" General
inoremap jj <ESC>
noremap <Down> gj
noremap <Up> gk
"" Split op. mapping
nnoremap s <nop>
nnoremap <silent> sp :sp<CR>
nnoremap <silent> sv :vsp<CR>
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
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
"" Tab op. mapping
nnoremap <silent> st :tabnew<CR>
"" Buffer op. mapping
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> gB :bprevious<CR>
" Completion
inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
" Terminal
tnoremap <C-w> <C-\><C-n><C-w>

" Plugin
"" ALE
"nnoremap <C-k> <Plug> (ale_previous_wrap)
"nnoremap <C-j> <Plug> (ale_next_wrap)
"" NerdTree
map <C-n> :NERDTreeToggle<CR>
""" coc.nvim
inoremap <silent><expr> jc coc#refresh()
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><nowait> <space>a :CocList diagnostics<CR>
nnoremap <silent><nowait> <space>e :CocList extensions<CR>
nnoremap <silent><nowait> <space>c :CocList commands<CR>
nnoremap <silent><nowait> <space>o :CocList outline<CR>
nnoremap <silent><nowait> <space>s :CocList -I symbols<CR>
nnoremap <silent><nowait> <space>j :CocNext<CR>
nnoremap <silent><nowait> <space>k :CocPrev<CR>
nnoremap <silent><nowait> <space>p :CocListResume<CR>
