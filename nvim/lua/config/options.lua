-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.backup = false
opt.cmdheight = 0
opt.winbar = "%=%m %f"
opt.spelllang = "en_us"
opt.spell = true

opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
