local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            rustc = {
                source = "discover",
            },
            cargo = {
                features = "all",
            },
        },
    },
}
lspconfig.ts_ls.setup {
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern("package.json"),
}
lspconfig.denols.setup {
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
lspconfig.texlab.setup {}
lspconfig.astro.setup {}

on_lsp_attach(function(ev)
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
end)

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                pathStrict = true,
                path = { "?.lua", "?/init.lua" },
            },
            workspace = {
                library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                    "${3rd}/luv/library",
                    "${3rd}/busted/library",
                    "${3rd}/luassert/library",
                }),
                checkThirdParty = "Disable",
            },
        },
    },
})

lspconfig.terraformls.setup {}
