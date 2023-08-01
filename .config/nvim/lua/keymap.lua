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

nnoremap("<space>e", vim.diagnostic.open_float)
-- LSP
on_lsp_attach(function(ev)
    local opts = { buffer = ev.buf }
    nnoremap("gd", vim.lsp.buf.definition, opts)
    nnoremap("<space>h", vim.lsp.buf.hover, opts)
    nnoremap("F", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end)

-- Telescope
local telescope_builtin = require("telescope.builtin")
nnoremap("ff", telescope_builtin.find_files)
nnoremap("fg", telescope_builtin.live_grep)
nnoremap("fb", telescope_builtin.buffers)
