-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap

-- Movement Improvement
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "<C-f>", "<C-f>zz")
map.set("n", "<C-b>", "<C-b>zz")
map.set("n", "Y", "yy")

-- Select all
map.set("n", "<C-a>", "gg<S-v>G")
map.set("n", "<C-w><left>", "<C-w><")
map.set("n", "<C-w><right>", "<C-w>>")
map.set("n", "<C-w><up>", "<C-w>+")

map.set("n", "<C-w><down>", "<C-w>-")

map.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
