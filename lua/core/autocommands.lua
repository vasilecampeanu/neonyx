-- Define autocmd
local autocmd = vim.api.nvim_create_autocmd

-- Wrap the PackerSync command to warn people before using it
autocmd("VimEnter", {
    callback = function()
        vim.cmd "command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('core.utils').packer_sync(<f-args>)"
    end
})
