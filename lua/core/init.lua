-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Used to initialize all core configs       --
-------------------------------------------------------------

-- Core configurations
require("core.options")

-- Hotkeys initialization
require("core.keympas")

vim.defer_fn(function()
    require("core.utils").load_mappings()
 end, 0)

---

-- Custom settings
require("core.custom")
