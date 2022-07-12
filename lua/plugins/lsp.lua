-- Include LSP Intsaller config
require("plugins.lsp-installer")

local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
    return
end

local on_attach = function(client, bufnr)
    --- your config here
end

for _, lsp in ipairs(Servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach
    }
end
