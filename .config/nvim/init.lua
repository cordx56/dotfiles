-- Preload
require("preload")

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
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    "nvim-lualine/lualine.nvim",
    "rmagatti/auto-session",
    { "windwp/nvim-autopairs", event = "InsertEnter" },
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "NMAC427/guess-indent.nvim",
    { "nvim-telescope/telescope.nvim", tag = "0.1.2", dependencies = { "nvim-lua/plenary.nvim" } },
    { "debugloop/telescope-undo.nvim", dependencies = { "nvim-telescope/telescope.nvim" } },
    { "akinsho/toggleterm.nvim" },
    "klen/nvim-config-local",
    "rcarriga/nvim-notify",
    -- Languages
    { "Julian/lean.nvim", dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } },
    { "mrcjkb/haskell-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" }, version = "^2" },
})

-- Plugins
require("auto-session").setup()
require("nvim-autopairs").setup()
require("line")
require("tree")
require("lsp")
require("completion")
require("lint")
require("guess-indent").setup {}
require("telescope").setup {}
require("term")
require("config-local").setup {}

-- Settings
require("general")
require("keymap")
