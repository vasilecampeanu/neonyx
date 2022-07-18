-- Basic Options
local options = {
    -- Fileencoding
    fileencoding = "utf-8",

    -- Backups files
    backup = false,
    swapfile = false,
    writebackup = false,
    undofile = true,

    -- Font style
    guifont = "monospace:h17",

    -- GUI stuff
    termguicolors = true,
    number = true,
    relativenumber = true,
    numberwidth = 2,
    signcolumn = "yes",
    cursorline = true,
    cmdheight = 1,
    showtabline = 0,
    pumheight = 10,

    -- Identation settings
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,

    -- Scroll offset
    scrolloff = 8,
    sidescrolloff = 8,

    -- Searching
    hlsearch = true,
    ignorecase = true,

    -- Completion
    completeopt = { "menuone", "noselect" },
    timeoutlen = 500,
    updatetime = 300,

    -- Splits
    splitbelow = true,                      
    splitright = true,

    -- Misc
    showmode = true,
    clipboard = "unnamedplus",
    conceallevel = 0,
    smartcase = true,
    wrap = false
}

-- Apply options
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- Disable some builtin vim plugins
local default_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "syntax",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}
 
for _, plugin in pairs(default_plugins) do
    vim.g["loaded_" .. plugin] = 1
end
