-- Keymap
local keymap = function(mode, before, after, opts)
    new_opts = { noremap = true, silent = true }
    if opts ~= nil then
        new_opts = vim.tbl_extend("force", new_opts, opts)
    end
    vim.keymap.set(mode, before, after, new_opts)
end
nnoremap = function(before, after, opts)
    keymap("n", before, after, opts)
end
inoremap = function(before, after, opts)
    keymap("i", before, after, opts)
end
vnoremap = function(before, after, opts)
    keymap("v", before, after, opts)
end
nvnoremap = function(before, after, opts)
    nnoremap(before, after, opts)
    vnoremap(before, after, opts)
end

-- Autocmd
on_lsp_attach = function(callback)
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = callback,
    })
end
