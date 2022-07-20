-- Variables
local M = {}

-- Packer options
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

    -- Compile plugin list
    plugins = require("core.utils").merge_plugin_list(plugins)

    -- Initialize packer options
    packer.init(M.options)

    -- Automatically set up your configuration after cloning packer.nvim.
    packer.startup(function(use)
        for _, v in pairs(plugins) do
            use(v)
        end
    end)
end

-- Automatically install packer
-- Make packer manage itself
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

-- Return matrix object
return M
