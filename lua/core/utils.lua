-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Function dependencies                     --
-------------------------------------------------------------

local M = {}

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
