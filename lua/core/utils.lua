local M = {}

-- Remove custom defined plugins
M.remove_default_plugins = function(plugins)
    local removals = {}

    if not vim.tbl_isempty(removals) then
        for _, plugin in pairs(removals) do
            plugins[plugin] = nil
        end
    end

    return plugins
end

-- Merge default/user plugin tables
M.merge_plugins = function(default_plugins)
    local user_plugins = {}

    default_plugins = vim.tbl_deep_extend("force", default_plugins, user_plugins)

    local final_table = {}

    for key, _ in pairs(default_plugins) do
        default_plugins[key][1] = key
        final_table[#final_table + 1] = default_plugins[key]
    end

    return final_table
end

M.packer_sync = function(...)
    local packer_exists, packer = pcall(require, "packer")
    if packer_exists then
        packer.sync(...)
    else
        error "Packer could not be loaded!"
    end
end

return M
