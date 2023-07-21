-- Load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
    "lunarvim/horizon.nvim",
    "nvim-lualine/lualine.nvim",
    "rmagatti/auto-session",
    { "windwp/nvim-autopairs", event = "InsertEnter" },
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
})

require("auto-session").setup()
require("nvim-autopairs").setup()
require("nvim-tree").setup()


-- Load settings
require("general")
require("keymap")
require("plugin-lualine")

vim.cmd("colorscheme horizon")
