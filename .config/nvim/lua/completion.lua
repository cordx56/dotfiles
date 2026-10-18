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
    provider = "openai_compatible",
    provider_options = {
        openai_compatible = {
            model = "deepseek/deepseek-v4.1-flash-1017:nitro",
            stream = true,
            end_point = "https://openrouter.ai/api/v1/chat/completions",
            api_key = "OPENROUTER_API_KEY",
            name = "OpenRouter",
        },
    },
}
