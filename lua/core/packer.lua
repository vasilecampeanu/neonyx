-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Plugin Management                         --
-------------------------------------------------------------
local M = {}

-- Automatically install packer
M.bootstrap = function()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

    -- Make packer installer to float and set a more readable background color
    vim.api.nvim_set_hl(0, "NormalFloat", {
        bg = "#1e222a"
    })

    if fn.empty(fn.glob(install_path)) > 0 then
        print "Cloning packer .."

        fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}

        -- Install plugins + compile their configs
        vim.cmd "packadd packer.nvim"
        require "plugins"
        vim.cmd "PackerSync"
    end
end

M.options = {
    auto_clean = true,
    compile_on_sync = true,
    git = {
        clone_timeout = 6000
    },
    display = {
        working_sym = "ﲊ",
        error_sym = "✗ ",
        done_sym = " ",
        removed_sym = " ",
        moved_sym = "",
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

-- Manage plugins
M.run = function(plugins)
    -- Use a protected call so we don't error out on first use
    local present, packer = pcall(require, "packer")

    -- Check presence
    if not present then
        return
    end

    -- Overrides
    plugins = require("core.utils").remove_default_plugins(plugins)
    plugins = require("core.utils").merge_plugins(plugins)

    -- Initialize packer options
    packer.init(M.options)

    -- Automatically set up your configuration after cloning packer.nvim.
    packer.startup(function(use)
        for _, v in pairs(plugins) do
            use(v)
        end
    end)
end

return M
