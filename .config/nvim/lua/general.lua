local opt = vim.opt

vim.g.mapleader = " "

-- Visual
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.list = true
opt.listchars = { tab = "> " }

-- Tab / Indent
opt.tabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4

-- Encoding
opt.encoding = "utf-8"

-- Spell check
opt.spell = true
opt.spelllang = { "en", "cjk" }

-- Completion
opt.pumheight = 15
opt.pumblend = 15

opt.syntax = "on"

-- Search
opt.incsearch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true

-- undo
opt.undofile = true

opt.termguicolors = true

require("catppuccin").setup({
    flavor = "mocha",
    transparent_background = true,
    color_overrides = {
        mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
        },
    },
    integrations = {
        notify = true,
    },
})
vim.cmd("colorscheme catppuccin")
