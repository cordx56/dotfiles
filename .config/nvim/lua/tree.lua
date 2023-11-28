require("nvim-tree").setup({
    on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        -- move pane with s
        nnoremap("s", "<c-w>", { buffer = bufnr })
    end
})
