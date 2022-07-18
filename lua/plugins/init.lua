-- Firs add packer
vim.cmd "packadd packer.nvim"

local plugins = {
    ------------------
    -- Core plugins --
    ------------------

    -- packer.nvim
    -- Package manager
    -- Github link: https://github.com/wbthomason/packer.nvim.git
    ["wbthomason/packer.nvim"] = {
        commit = "e4c2afb37d31e99b399425e102c58b091fbc16be"
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
            require("plugins.configs.colorscheme")
        end
    }
}

require("core.packer").run(plugins)
