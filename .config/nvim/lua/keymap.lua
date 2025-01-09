-- Keymaps
--- General
inoremap("jj", "<esc>")
nvnoremap("j", "gj")
nvnoremap("k", "gk")
noremap("H", "^")
noremap("L", "$")
--- Page
nvnoremap("J", "<c-d>")
nvnoremap("K", "<c-u>")
--- Split
nnoremap("s", "<c-w>")
--- Tab
nnoremap("st", ":tabnew<cr>")
nnoremap("gr", "gT")

noremap("<tab>", ">")
noremap("<s-tab>", "<")

nnoremap("<space>e", vim.diagnostic.open_float)
nnoremap("]", function()
    vim.diagnostic.goto_next({
        severtity = { min = vim.diagnostic.severity.WARN }
    })
end)
nnoremap("[", function()
    vim.diagnostic.goto_prev({
        severtity = { min = vim.diagnostic.severity.WARN }
    })
end)
-- LSP
on_lsp_attach(function(ev)
    local opts = { buffer = ev.buf }
    nnoremap("gd", vim.lsp.buf.definition, opts)
    nnoremap("<space>h", vim.lsp.buf.hover, opts)
    nnoremap("F", function()
        vim.lsp.buf.format { async = true }
    end, opts)
end)

local nvim_tree_api = require("nvim-tree.api")
nnoremap("t", nvim_tree_api.tree.toggle)

-- Telescope
local telescope_builtin = require("telescope.builtin")
nnoremap("ff", telescope_builtin.find_files)
nnoremap("fg", telescope_builtin.live_grep)
nnoremap("fc", telescope_builtin.git_commits)
nnoremap("fb", telescope_builtin.buffers)
local telescope_undo = require("telescope").extensions.undo
nnoremap("fu", telescope_undo.undo)

-- Terminal
local Terminal = require("toggleterm.terminal").Terminal
local term_func = function(opts)
    return function()
        Terminal:new(opts):toggle()
    end
end
nnoremap("Tp", term_func({ direction = "horizontal" }))
nnoremap("Tv", term_func({ direction = "vertical" }))
nnoremap("T", term_func({ direction = "float" }))
