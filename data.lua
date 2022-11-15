--====================================================================================================
--PRE INIT
--====================================================================================================

-- info

ei_mod = {}
ei_mod.stage = "data"

ei_mod.dev_mode = false
ei_mod.show_temp = false

-- lib and paths

require("lib/paths")

--====================================================================================================
--MAIN CONTENT CODE
--====================================================================================================

-- add new categories, entities, items, techs, recipes fluids, resources

-- setup pipe covers
require("prototypes/pipe-covers")
-- add other
require("prototypes/other")
-- add fluids
require("prototypes/fluids")
-- add age-techs
require("prototypes/age_techs")
-- add dark age prototypes
require("prototypes/dark_age/dark_age")
-- add steam age prototypes
require("prototypes/steam_age/steam_age")
-- add electricity age prototypes
require("prototypes/electricity_age/electricity_age")
-- add computer age prototypes
require("prototypes/computer_age/computer_age")

--====================================================================================================
--COMPATIBILITY CODE
--====================================================================================================