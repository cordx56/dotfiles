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
    local opts_expr = vim.tbl_extend("force", opts, { expr = true })
    inoremap("<tab>", function()
        return vim.fn.pumvisible() == 1 and "<c-n>" or "<tab>"
    end, opts_expr)
    inoremap("<s-tab>", function()
        return vim.fn.pumvisible() == 1 and "<c-p>" or "<s-tab>"
    end, opts_expr)
    inoremap("jc", "<c-x><c-o>")
    nnoremap("gd", vim.lsp.buf.definition, opts)
    nnoremap("<space>h", vim.lsp.buf.hover, opts)
    nnoremap("F", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end)
