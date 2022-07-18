-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : The scope of this file is to manage       --
-- and initialize confgs for plugins                       --
-------------------------------------------------------------

-- First add packer
vim.cmd "packadd packer.nvim"

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

    ---------------------
    -- File Management --
    ---------------------

    -- Telescope
    -- Find, Filter, Preview, Pick. All lua, all the time
    -- Github link: https://github.com/nvim-telescope/telescope.nvim
    ["nvim-telescope/telescope.nvim"] = {
        cmd = "Telescope",
        config = function()
            require "plugins.configs.telescope"
        end
    }
}

-- Initialize configs
require("core.packer").run(plugins)
