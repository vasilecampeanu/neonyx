-------------------------------------------------------------
-- Author: Vasile Campeanu                                 --
-- Description : Used to setup keybinds                    --
-------------------------------------------------------------

-- Variables
local M = {}

-- Local variables
local keymap = vim.keymap.set
local opts = {
    silent = true
}

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

-- Telescope keybinds
M.telescope = {
    n = {
        -- Find files
        ["<leader>ff"] = {"<cmd> Telescope find_files <CR>", "  find files"},
        ["<leader>fa"] = {"<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all"},
        ["<leader>fw"] = {"<cmd> Telescope live_grep <CR>", "  live grep"},
        ["<leader>fb"] = {"<cmd> Telescope buffers <CR>", "  find buffers"},
        ["<leader>fo"] = {"<cmd> Telescope oldfiles <CR>", "  find oldfiles"},

        -- Git stuff
        ["<leader>tgc"] = {"<cmd> Telescope git_commits <CR>", "  git commits"},
        ["<leader>tgs"] = {"<cmd> Telescope git_status <CR>", "  git status"},

        -- Other
        ["<leader>wk"] = {"<cmd> Telescope keymaps <CR>", "  show keys"},
    }
}

M.git = {
    n = {
        ["<leader>gb"] = {"<cmd> Git blame <CR>", "  git blame"},
        ["<leader>gd"] = {"<cmd> Gitsigns diffthis <CR>", "  git diff"},
        ["<leader>gD"] = {"<cmd> DiffviewOpen <CR>", "  git diff open view"},
        ["<leader>gh"] = {"<cmd> DiffviewFileHistory <CR>", "  git diff close"},
        ["<leader>gq"] = {"<cmd> DiffviewClose <CR>", "  git diff close"}
    }
}

-- Whichkey groups
M.groups = {
    n = {
        ["<leader>"] = {
            f = { name = "Files" },
            g = { name = "Git" },
            t = { name = "Telescope" },
            w = { name = "Window" }
        },
    },
}

return M
