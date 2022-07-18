-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Custom configs will be put here           --
-------------------------------------------------------------

-- Custom GUI styles
-- Remove vim background colore and use the terminal color.
vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]

-- Remove sign bar background colore.
vim.cmd [[highlight SignColumn guibg=NONE]]

-- Make cursor block in insert mode
vim.cmd [[set guicursor=i:block]]

-- Enable cursor blinking
vim.cmd [[set guicursor=a:blinkon1]]
