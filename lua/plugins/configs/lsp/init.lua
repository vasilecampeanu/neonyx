-- Variables
local presence, _ = pcall(require, "lspconfig")

-- Check presence
if not presence then
    return
end

require("plugins.configs.lsp.lsp-installer")
require("plugins.configs.lsp.handlers").setup()
