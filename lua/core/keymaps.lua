-------------------------------------------------------------
-- Author: Vasile Campeanu                                 --
-- Description : Used to setup keybinds                    --
-------------------------------------------------------------

-- Variables
local M = {}

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
