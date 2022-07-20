-- Variables
local presence, lsp_installer = pcall(require, "nvim-lsp-installer")

-- Check presence
if not presence then
    return
end

-- List of severs
local servers = { "sumneko_lua", "pyright", "tsserver", "eslint", "html" }

-- Lsp settings
local options = {
    ensure_installed = servers,
    ui = {
        icons = {
            server_installed = " ",
            server_pending = " ",
            server_uninstalled = " ﮊ",
        },
        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
        },
    },
    max_concurrent_installers = 10
}

lsp_installer.setup(options)

local lspconfig_presence, lspconfig = pcall(require, "lspconfig")

-- Check presence
if not lspconfig_presence then
    return
end

local opts = {}

-- Attach configs
for _, server in pairs(servers) do
    opts = {
        on_attach = require("plugins.configs.lsp.handlers").on_attach,
        capabilities = require("plugins.configs.lsp.handlers").capabilities,
    }

    if server == "sumneko_lua" then
        local sumneko_opts = require "plugins.configs.lsp.settings.sumneko_lua"
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require "plugins.configs.lsp.settings.pyright"
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "tsserver" then
        local tsserver_opts = require "plugins.configs.lsp.settings.tsserver"
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    lspconfig[server].setup(opts)
end
