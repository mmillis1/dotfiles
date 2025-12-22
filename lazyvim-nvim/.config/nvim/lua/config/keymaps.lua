-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable arrow keys in normal, insert, and visual modes
local disable_arrows = function()
	local opts = { noremap = true, silent = true }
	local map = vim.keymap.set

	-- Normal mode
	map("n", "<Up>", "<Nop>", opts)
	map("n", "<Down>", "<Nop>", opts)
	map("n", "<Left>", "<Nop>", opts)
	map("n", "<Right>", "<Nop>", opts)

	-- Visual mode
	map("v", "<Up>", "<Nop>", opts)
	map("v", "<Down>", "<Nop>", opts)
	map("v", "<Left>", "<Nop>", opts)
	map("v", "<Right>", "<Nop>", opts)
end

disable_arrows()
