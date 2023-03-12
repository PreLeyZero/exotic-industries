-- init stuff

local ei_register = require("scripts/control/register_util")
local ei_victory_disabler = require("scripts/control/victory_disabler")

-- init stuff
ei_register.init({"copper_beacon"}, true)
ei_register.init({"fluid_entity"}, false)

-- disable vanilla victory condition by rocket launch
ei_victory_disabler.init()