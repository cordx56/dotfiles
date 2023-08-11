local opt = vim.opt

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

opt.autoread = true

opt.termguicolors = true
vim.cmd("colorscheme tokyonight-night")
