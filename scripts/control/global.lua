-- Init global variables for Exotic Industries

local ei_global = {}

--====================================================================================================
--GLOBAL VARIABLES
--====================================================================================================

function ei_global.init()
    global.ei = {}

    global.ei["tech_scaling"] = {}
    global.ei["tech_scaling"].maxCost = 0
    global.ei["tech_scaling"].startPrice = 0
    global.ei["tech_scaling"].techCount = 0

    global.ei.spaced_updates = 0
end

return ei_global