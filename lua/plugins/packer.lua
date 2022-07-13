-- Define namespace
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    print "Cloning packer .."
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Plugin list
return packer.startup(function(use)

    -- Core plugins

    -- packer.nvim
    -- Package manager
    -- Github link: https://github.com/wbthomason/packer.nvim.git
	use({ "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" })

    -- plenary.nvim
    -- All the lua functions I don't want to write twice.
	-- Github link: https://github.com/nvim-lua/plenary.nvim.git
    use({ "nvim-lua/plenary.nvim", commit = "986ad71ae930c7d96e812734540511b4ca838aa2" })

    -- Web devicons
    -- Adds file type icons to NVim plugins
    -- Github link: https://github.com/kyazdani42/nvim-web-devicons
    use { "kyazdani42/nvim-web-devicons", commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }

    -- Onedarker colorscheme
    -- Onedark inspired colorscheme written in lua
    -- Github link: https://github.com/lunarvim/onedarker
    use { "lunarvim/onedarker", commit = "724aa3ab5efbdfe83ae0ea1ad9d44166b1685ba8" }

    -- Language server protocol stuff

    -- nvim-lspconfig
    -- Language Server Protocol support
    -- Github link: https://github.com/neovim/nvim-lspconfig.git
    use({ "neovim/nvim-lspconfig", commit = "41a826947eefbc7b59cc80cef405cce9ea6d82b8" })

    -- nvim-lsp-installer
    -- Simple to use language server installer
    -- Github link: https://github.com/williamboman/nvim-lsp-installer
    use({ "williamboman/nvim-lsp-installer", commit = "087863896458195a7337475c66409e1ab5f5e802" })

    -- Code completion plugins

    -- nvim-cmp
    -- A completion plugin for neovim coded in Lua.
    -- This plugin is separated in multiple modules.
    -- Github link: https://github.com/hrsh7th/nvim-cmp.git
    use({ "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" })

    -- nvim-lspconfig
    -- Enable LSP
    -- Github link: https://github.com/neovim/nvim-lspconfig
    use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })

    -- cmp-buffer
    -- Buffer completions
    -- Github link: https://github.com/hrsh7th/cmp-buffer
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" })

    -- cmp-path
    -- Path completions
    -- Github link: https://github.com/hrsh7th/cmp-path
    use({ "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" })

    -- Snippet completion

    -- LuaSnip
    -- Snippet Engine for Neovim written in Lua.
    -- Github link: https://github.com/L3MON4D3/LuaSnip.git
    use({ "L3MON4D3/LuaSnip", commit = "7d78278c2a935b8cd1b6b43065223e14490f3133" })

    -- cmp_luasnip
    -- Used with cmp for snippet suggestions in completions panel.
    -- Github link: https://github.com/saadparwaiz1/cmp_luasnip
    use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" })

    -- friendly-snippets
    -- Library of snippets
    -- Github link: https://github.com/rafamadriz/friendly-snippets
    use({ "rafamadriz/friendly-snippets", commit = "0e516c9d9892d6bf268492136971d315dd704d16" })

    -- Code related plugins
    -- vim-illuminate
    -- Github link: https://github.com/RRethy/vim-illuminate.git
    use { "RRethy/vim-illuminate", commit = "6bfa5dc069bd4aa8513a3640d0b73392094749be" }

    -- Code related plugins

    -- nvim-treesitter
    -- Treesitter configurations and abstraction layer
    -- Github link: https://github.com/nvim-treesitter/nvim-treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        commit = "6f1bf2feec45ff7c9d7844602fe175907b7db633",
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }

    -- Version control & Project manaement

    -- File management 

	-- Automatically set up your configuration after cloning packer.nvim.
	-- Put this at the end after all plugins.
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
