-- Viariables
local M = {}
local presence, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

-- Check presence
if not presence then
    return
end

-- Capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

-- Settings
M.setup = function()
    local signs = {
        {
            name = "DiagnosticSignError",
            text = ""
        },
        {
            name = "DiagnosticSignWarn",
            text = ""
        },
        {
            name = "DiagnosticSignHint",
            text = ""
        },
        {
            name = "DiagnosticSignInfo",
            text = ""
        }
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_text = false,
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

-- Lsp keybids
local function lsp_keymaps(bufnr)
    -- ... configs
end

-- Attach function
M.on_attach = function(client, bufnr)
    -- Set LSP hotkeys
    lsp_keymaps(bufnr)

    local status_ok, illuminate = pcall(require, "illuminate")
    
    if not status_ok then
        return
    end
    
    illuminate.on_attach(client)
end

-- Return matrix object
return M
