local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<s-tab>"] = cmp.mapping.select_prev_item(),
        ["<cr>"] = cmp.mapping.confirm({ select = false }),
        ["jc"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "minuet" },
    }),
    performance = {
        fetching_timeout = 2000,
    },
})

require("minuet").setup {
    provider = "openai",
    provider_options = {
        openai = {
            model = "gpt-5-mini",
        },
    },
}
