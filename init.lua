-------------------------------------------------------------
-- Author: Vasile Campeanu                                 -- 
-- Description : Main lua file. All configs are called     --
-- from here.                                              --
-------------------------------------------------------------

-- Core settings
require("core")

-- Plugin management
-- Setup packer + Plugins
require("core.packer").bootstrap()
require("plugins")
