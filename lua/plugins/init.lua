-------------------------------------------------------------
-- Author: Vasile Campeanu                                 --
-- Description : The scope of this file is to manage       --
-- and initialize confgs for plugins                       --
-------------------------------------------------------------

-- First, add packer
vim.cmd "packadd packer.nvim"

-- Plugin list
local plugins = {
    ------------------
    -- Core plugins --
    ------------------

    -- packer.nvim
    -- Package manager
    -- Github link: https://github.com/wbthomason/packer.nvim.git
    ["wbthomason/packer.nvim"] = {
        commit = "494fd5999b19e29992eb0978c4fa8988d2023ad8"
    },

    ---

    -- plenary.nvim
    -- All the lua functions I don't want to write twice.
    -- Github link: https://github.com/nvim-lua/plenary.nvim.git

    ["nvim-lua/plenary.nvim"] = {
        commit = "986ad71ae930c7d96e812734540511b4ca838aa2",
        module = "plenary"
    },

    ---

    -- Web devicons
    -- Adds file type icons to NVim plugins
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    ["kyazdani42/nvim-web-devicons"] = {
        commit = "2d02a56189e2bde11edd4712fea16f08a6656944",
        module = "nvim-web-devicons"
    },

    -- Test

    ---

    -- Onedarker colorscheme
    -- Onedark inspired colorscheme written in lua
    -- Github link: https://github.com/lunarvim/onedarker
    ["lunarvim/onedarker"] = {
        commit = "b79ebd09779472c00e19c38caf698aa43b51fe1c",
        config = function()
            -- Variables
            local colorscheme = "onedarker"
            local present, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

            -- Check presence
            if not present then
                return
            end
        end
    },

    ---

    -- nvim-treesitter
    -- Code higlisght support    
    -- Github link: https://github.com/nvim-treesitter/nvim-treesitter
    ["nvim-treesitter/nvim-treesitter"] = {
        commit = "6f1bf2feec45ff7c9d7844602fe175907b7db633",
        run = function()
            require('nvim-treesitter.install').update({
                with_sync = true
            })
        end,
        config = function()
            require("plugins.configs.treesitter")
        end
    },

    ---

    -- nvim-treesitter
    -- Identation guides
    -- Github link: https://github.com/lukas-reineke/indent-blankline.nvim
    ["lukas-reineke/indent-blankline.nvim"] = {
        commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025",
        config = function()
            require("indent_blankline").setup {
                filetype_exclude = {"help", "terminal", "alpha", "packer", "lspinfo", "TelescopePrompt",
                                    "TelescopeResults", "lsp-installer"},
                buftype_exclude = {"terminal"},
                indentLine_enabled = 1,
                show_current_context = true,
                show_current_context_start = true,
                show_first_indent_level = true,
                show_trailing_blankline_indent = false
            }
        end
    },

    -----------------------------------
    -- File Management Accessibility --
    -----------------------------------

    -- telescope.nvim
    -- Find, Filter, Preview, Pick. All lua, all the time
    -- Github link: https://github.com/nvim-telescope/telescope.nvim
    ["nvim-telescope/telescope.nvim"] = {
        commit = "b79cd6c88b3d96b0f49cb7d240807cd59b610cd8",
        cmd = "Telescope",
        config = function()
            require("plugins.configs.telescope")
        end
    },

    ---------------------
    -- Version Control --
    ---------------------

    -- gitsigns.nvim
    -- Version control manager
    -- Github link: https://github.com/lewis6991/gitsigns.nvim
    ["lewis6991/gitsigns.nvim"] = {
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = {
                        hl = "GitSignsAdd",
                        text = "▎",
                        numhl = "GitSignsAddNr",
                        linehl = "GitSignsAddLn"
                    },
                    change = {
                        hl = "GitSignsChange",
                        text = "▎",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    },
                    delete = {
                        hl = "GitSignsDelete",
                        text = "契",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    topdelete = {
                        hl = "GitSignsDelete",
                        text = "契",
                        numhl = "GitSignsDeleteNr",
                        linehl = "GitSignsDeleteLn"
                    },
                    changedelete = {
                        hl = "GitSignsChange",
                        text = "▎",
                        numhl = "GitSignsChangeNr",
                        linehl = "GitSignsChangeLn"
                    }
                },
                on_attach = function(bufnr)
                    local function map(mode, lhs, rhs, opts)
                        opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
                        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                    end

                    -- Hotkeys 
                    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr = true})
                    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr = true})
                end
            })
        end
    },

    -------------
    -- Hotkeys --
    -------------

    -- which-key.nvim
    -- Hotkeys visualizer
    -- Only load whichkey after all the gui
    -- Github link: https://github.com/folke/which-key.nvim
    ["folke/which-key.nvim"] = {
        commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71",
        config = function()
            require("which-key").setup {}

            local utils = require "core.utils"

            -- Load load Hotkeys
            vim.defer_fn(function()
                utils.load_mappings()
            end, 0)

            local mapping_config = require "core.defaults"
            local mappings = mapping_config.mappings
            local mapping_groups = {
                groups = vim.deepcopy(mappings.groups)
            }

            utils.load_mappings(mapping_groups)
        end
    }
}

-- Initialize configs
require("core.packer").run(plugins)
