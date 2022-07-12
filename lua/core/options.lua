-- General Options
local options = {
    -- Fileencoding
    fileencoding = "utf-8",

    -- Font style
    guifont = "monospace:h17",

    -- Setting up tab spaces & identation
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,

    -- Searching
    hlsearch = true,
    ignorecase = true,

    -- completion
    completeopt = { "menuone", "noselect" },
    timeoutlen = 500,
    updatetime = 300,

    -- File
    backup = false,
    swapfile = false,
    writebackup = false,
    undofile = true,
    clipboard = "unnamedplus",
    showmode = true,

    -- GUI stuff
    termguicolors = true,
    pumheight = 10,
    cursorline = true,
    numberwidth = 2,
    signcolumn = "yes",
    showtabline = 0,
    cmdheight = 1,

    -- Numbers
    number = true,
    relativenumber = true,

    -- Splits
    splitbelow = true,                      
    splitright = true,

    -- Scroll
    scrolloff = 8,
    sidescrolloff = 8,

    -- Misc
    conceallevel = 0,
    smartcase = true,
    wrap = false
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
