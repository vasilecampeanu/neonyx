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
    -- packer.nvim
    -- Package manager
    -- Github link: https://github.com/wbthomason/packer.nvim.git
	use({ "wbthomason/packer.nvim", commit = "e4c2afb37d31e99b399425e102c58b091fbc16be" })

    -- Language server protocol
    use({ "neovim/nvim-lspconfig", commit = "41a826947eefbc7b59cc80cef405cce9ea6d82b8" })

    -- Code completion plugins

    -- nvim-cmp
    -- A completion plugin for neovim coded in Lua.
    -- This plugin is separated in multiple modules.
    -- Github link: https://github.com/hrsh7th/nvim-cmp.git
    use({ "hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe" })
    use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
    use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" })
    use({ "hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921" })

	-- Automatically set up your configuration after cloning packer.nvim.
	-- Put this at the end after all plugins.
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
