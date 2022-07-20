-- Local variables
local keymap = vim.keymap.set
local opts = { silent = true }

-- Custom hotkeys
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
