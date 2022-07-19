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
        commit = "986ad71ae930c7d96e812734540511b4ca838aa2"
    },

    ---

    -- Web devicons
    -- Adds file type icons to NVim plugins
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    ["kyazdani42/nvim-web-devicons"] = {
        commit = "2d02a56189e2bde11edd4712fea16f08a6656944"
    },

    -- Onedarker colorscheme
    -- Onedark inspired colorscheme written in lua
    -- Github link: 
    ["folke/tokyonight.nvim"] = {
        commit = "",
        config = function()
            -- Variables
            local colorscheme = "tokyonight"
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
    
    -- alpha-nvim
    -- Home page manager
    ["goolord/alpha-nvim"] = {
        config = function()
            require "plugins.configs.alpha"
        end,
    },

    ---

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

    ---
    
    -- vim-fugitive
    -- Setting up fuggitive 
    -- Powerfull git integration
    -- Git link: https://github.com/tpope/vim-fugitive
    ["tpope/vim-fugitive"] = {
        commit = "d84582d5f767c11b7fb5ac2f5dca91d48f5556a9",
        opt = true,
        cmd = { "G", "Git" },
    },

    ---

    -- Setting up fuggitive 
    -- Powerfull git integration
    ["sindrets/diffview.nvim"] = {
        after = "plenary.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("diffview").setup({
                use_icons = true,
                file_panel = {
                    listing_style = "list"
                }
            })
        end
    },

    ------------------------------
    -- Language server protocol --
    ------------------------------
    
    -- nvim-lsp-installer
    -- Simple to use language server installer
    -- Github link: https://github.com/williamboman/nvim-lsp-installer
    ["williamboman/nvim-lsp-installer"] = {
        commit = ""
    },

    ---

    -- nvim-lspconfig
    -- Language Server Protocol support
    -- Github link: https://github.com/neovim/nvim-lspconfig.git
    ["neovim/nvim-lspconfig"] = {
        commit = "", 
        after = "nvim-lsp-installer",
        config = function()
            require("plugins.configs.lsp")
        end
    },

    ---------------------
    -- Code completion --
    ---------------------
    
    -- nvim-cmp
    -- A completion plugin for neovim coded in Lua
    -- This plugin is separated in multiple modules
    -- Github link: https://github.com/hrsh7th/nvim-cmp.git
    ["hrsh7th/nvim-cmp"] = {
        commit = "",
        config = function()
            require("plugins.configs.cmp")
        end
    },

    ---

    -- nvim-lspconfig
    -- Enable LSP
    -- Github link: https://github.com/neovim/nvim-lspconfig
    ["hrsh7th/cmp-nvim-lsp"] = {
        commit = "",
    },

    ---
    
    -- cmp-buffer
    -- Buffer completions
    -- Github link: https://github.com/hrsh7th/cmp-buffer
    ["hrsh7th/cmp-buffer"] = {
        commit = "",
    },

    ---
    
    -- cmp-path
    -- Path completions
    -- Github link: https://github.com/hrsh7th/cmp-path
    ["hrsh7th/cmp-path"] = {
        commit = "",
    },

    --------------------
    -- Code snippets ---
    --------------------
    
    -- LuaSnip
    -- Snippet Engine for Neovim written in Lua.
    -- Github link: https://github.com/L3MON4D3/LuaSnip.git
    ["L3MON4D3/LuaSnip"] = {
        commit = "",
    },

    ---

    -- cmp_luasnip
    -- Used with cmp for snippet suggestions in completions panel.
    -- Github link: https://github.com/saadparwaiz1/cmp_luasnip
    ["saadparwaiz1/cmp_luasnip"] = {
        commit = "",
    },

    ---

    -- friendly-snippets
    -- Library of snippets
    -- Github link: https://github.com/rafamadriz/friendly-snippets
    ["rafamadriz/friendly-snippets"] = {
        commit = "",
    },

    ----------------------
    -- Code management  --
    ----------------------

    --------------------
    -- Hotkeys manger --
    --------------------

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

            local mapping_config = "core.keymaps"
            local mappings = mapping_config
            local mapping_groups = {
                groups = vim.deepcopy(mappings.groups)
            }

            utils.load_mappings(mapping_groups)
        end
    }
}

-- Initialize configs
require("core.packer").run(plugins)
