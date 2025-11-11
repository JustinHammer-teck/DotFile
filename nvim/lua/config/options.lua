-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.o

opt.mouse = ""

opt.backup = false
opt.cmdheight = 0
opt.winbar = "%=%m %f"
opt.spelllang = "en_us"
opt.spell = true

opt.expandtab = true
opt.number = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.softtabstop = 4
opt.expandtab = true

opt.wrap = false
opt.swapfile = false

opt.termguicolors = true

opt.exrc = true -- Enable specific project neovim configuration
