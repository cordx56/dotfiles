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
    { "catppuccin/nvim",       name = "catppuccin" },
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
    -- { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "NMAC427/guess-indent.nvim",
    { "nvim-telescope/telescope.nvim",   tag = "0.1.2",                                     dependencies = { "nvim-lua/plenary.nvim" } },
    { "debugloop/telescope-undo.nvim",   dependencies = { "nvim-telescope/telescope.nvim" } },
    { "akinsho/toggleterm.nvim" },
    "klen/nvim-config-local",
    "rcarriga/nvim-notify",
    "mrded/nvim-lsp-notify",
    "lewis6991/gitsigns.nvim",
    -- Languages
    { "Julian/lean.nvim",          dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" } },
    { "mrcjkb/haskell-tools.nvim", dependencies = { "nvim-lua/plenary.nvim" },                         version = "^2" },
    "wuelnerdotexe/vim-astro",
    { "cordx56/rustowl", version = "*", opts = { auto_enable = true }, dependencies = { "neovim/nvim-lspconfig" } },
    "sindrets/diffview.nvim",
    {
        "linrongbin16/lsp-progress.nvim",
        config = function()
          require("lsp-progress").setup()
        end,
    },
    {
        "yetone/avante.nvim",
        build = function()
            return "make"
        end,
        event = "VeryLazy",
        version = false,
        build = "make",
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "echasnovski/mini.pick",
            "nvim-telescope/telescope.nvim",
            "hrsh7th/nvim-cmp",
            "ibhagwan/fzf-lua",
            "nvim-tree/nvim-web-devicons",
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    }
})

-- Settings
require("general")

-- Plugins
require("auto-session").setup()
require("nvim-autopairs").setup()
require("line")
require("tree")
require("lsp")
require("completion")
-- require("lint")
require("guess-indent").setup {}
require("telescope").setup {}
require("term")
require("config-local").setup {}
vim.notify = require("notify")
vim.notify.setup {
    top_down = false,
}
require('gitsigns').setup()
--require("lsp-notify").setup {}
require("ai")

-- Settings (After plugin load)
require("keymap")
