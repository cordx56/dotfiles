local set_filepath_from_git_repo = function()
    local path = vim.api.nvim_buf_get_name(0)
    local git_dir = vim.trim(vim.fn.system({"git", "rev-parse", "--show-toplevel"}))
    local index = string.find(path, git_dir, 1, true)
    if index == 1 then
        vim.b.filepath_from_git_repo = string.sub(path, string.len(git_dir) + 2)
    else
        vim.b.filepath_from_git_repo = path
    end
end
vim.api.nvim_create_autocmd({"BufAdd", "BufEnter", "BufFilePost"}, {
    callback = set_filepath_from_git_repo,
})

require("lualine").setup {
    options = {
        theme = "catppuccin",
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {
            {
                "filename",
                file_status = true,
                newfile_status = true,
                path = 1,
            }
        },
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {},
        lualine_z = {"progress", "location"},
    },
}
