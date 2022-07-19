-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Custom configs will be put here           --
-------------------------------------------------------------

-- Local variables
local keymap = vim.keymap.set
local opts = {
    silent = true
}

-- Custom hotkeys
-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Indentation: Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear highlights
keymap("n", "<leader>wh", "  <cmd>nohlsearch<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

---

-- Custom GUI styles
-- Remove vim background colore and use the terminal color.
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]

-- Remove sign bar background colore.
vim.cmd [[highlight SignColumn guibg=NONE]]

-- Make cursor block in insert mode
vim.cmd [[set guicursor=i:block]]

-- Enable cursor blinking
vim.cmd [[set guicursor=a:blinkon1]]
