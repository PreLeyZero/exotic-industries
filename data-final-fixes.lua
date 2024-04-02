
-- info

ei_mod.stage = "data-final-updates"
local ei_lib = require("lib.lib")


--====================================================================================================
--FINAL FIXES
--====================================================================================================

-- apply mod patches
require("scripts/data-final-updates/krastorio_patches")

-- fix techs
require("scripts/data-final-updates/final-tech-fixes")

-- fix recipes
require("scripts/data-final-updates/final-recipe-fixes")

-- treat main menu simulations
require("scripts/data-final-updates/main-menu-simulations")

-- ei_lib.debug_crafting_categories()