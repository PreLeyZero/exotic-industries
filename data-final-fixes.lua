
-- info

ei_mod.stage = "data-final-updates"


--====================================================================================================
--FINAL FIXES
--====================================================================================================

-- fix techs
require("scripts/data-final-updates/final-tech-fixes")
-- fix recipes
require("scripts/data-final-updates/final-recipe-fixes")

-- treat main menu simulations
require("scripts/data-final-updates/main-menu-simulations")

-- apply mod patches
require("scripts/data-final-updates/krastorio_patches")