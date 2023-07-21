-- Functions
local keymap = function(mode, before, after)
    vim.keymap.set(mode, before, after, { noremap = true, silent = true })
end
local nnoremap = function(before, after)
    keymap("n", before, after)
end
local inoremap = function(before, after)
    keymap("i", before, after)
end


-- Keymaps
--- General
inoremap("jj", "<esc>")
--- Split
nnoremap("s", "<c-w>")
nnoremap("sp", "<c-w>s")
nnoremap("sv", "<c-w>v")
--- Tab
nnoremap("st", ":tabnew<cr>")
nnoremap("t", ":NvimTreeFocus<cr>")
