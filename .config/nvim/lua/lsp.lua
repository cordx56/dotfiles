local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}
lspconfig.rust_analyzer.setup {
    -- TODO: Check `type rust-analyzer` return value!
    cmd = {"rustup", "run", "stable", "rust-analyzer"},
}
lspconfig.tsserver.setup {
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
