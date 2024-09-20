vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        -- move pane with s
        nnoremap("s", "<c-w>", { buffer = bufnr })
    end
})
