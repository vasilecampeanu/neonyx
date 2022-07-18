-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Function dependencies                     --
-------------------------------------------------------------
local M = {}

local merge_tb = vim.tbl_deep_extend

-- Load keymaps
M.load_mappings = function(mappings, mapping_opt)
    local set_maps
    local whichkey_exists, wk = pcall(require, "which-key")

    if whichkey_exists then
        set_maps = function(keybind, mapping_info, opts)
            wk.register({
                [keybind] = mapping_info
            }, opts)
        end
    else
        set_maps = function(keybind, mapping_info, opts)
            local mode = opts.mode
            opts.mode = nil
            vim.keymap.set(mode, keybind, mapping_info[1], opts)
        end
    end

    local mapping_config = require "core.defaults"
    mappings = mappings or vim.deepcopy(mapping_config.mappings)
    mappings.lspconfig = nil

    for _, section in pairs(mappings) do
        for mode, mode_values in pairs(section) do
            for keybind, mapping_info in pairs(mode_values) do
                -- merge default + user opts
                local default_opts = merge_tb("force", {
                    mode = mode
                }, mapping_opt or {})
                local opts = merge_tb("force", default_opts, mapping_info.opts or {})

                if mapping_info.opts then
                    mapping_info.opts = nil
                end

                set_maps(keybind, mapping_info, opts)
            end
        end
    end
end

-- Merge default/user's plugin tables
M.merge_plugin_list = function(default_plugins)
    local final_table = {}

    for key, _ in pairs(default_plugins) do
        default_plugins[key][1] = key
        final_table[#final_table + 1] = default_plugins[key]
    end

    return final_table
end

return M
