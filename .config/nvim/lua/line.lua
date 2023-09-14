local set_filepath_from_git_repo = function()
    vim.system({"git", "rev-parse", "--show-toplevel"}, { text = true }, function(res)
        local path = vim.api.nvim_buf_get_name(0)
        if res.code == 0 then
            local git_dir = vim.trim(res.stdout)
            vim.b.filepath_from_git_repo = string.sub(path, string.len(git_dir) + 2)
        else
            vim.b.filepath_from_git_repo = path
        end
    end)
end
vim.api.nvim_create_autocmd({"BufAdd", "BufFilePost"}, {
    callback = set_filepath_from_git_repo,
})

require("lualine").setup {
    options = {
        theme = "horizon",
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", "diff", "diagnostics"},
            lualine_c = {"b:filepath_from_git_repo"},
            lualine_x = {"encoding", "fileformat", "filetype"},
            lualine_y = {},
            lualine_z = {"progress", "location"},
        },
    },
}
