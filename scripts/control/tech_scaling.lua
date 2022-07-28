-- Read cost of last technology in the game (exclude infinite technologies)
-- Calculate reasearch cost of each technology and set technology_price_multiplier accordingly

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

ei_tech_scaling = {}

--====================================================================================================
--TECH SCALING
--====================================================================================================

function ei_tech_scaling.init()

    -- switch for max Cost
    local maxCost = ei_lib.switch_string(
        ei_data["tech_scaling"].switch_table,
        ei_lib.config("tech-scaling:maxCost")
    )

    -- set max Cost and start price
    global.ei["tech_scaling"].maxCost = maxCost
    global.ei["tech_scaling"].startPrice = ei_lib.config("tech-scaling:startPrice")

    -- count total number of technologies
    global.ei["tech_scaling"].techCount = ei_lib.getn(game.technology_prototypes)
end

function ei_tech_scaling.on_research_finished()
    maxCost = global.ei["tech_scaling"].maxCost
    startPrice = global.ei["tech_scaling"].startPrice
    techCount = global.ei["tech_scaling"].techCount

    -- do this for player force -> no support for multiple forces yet
    force = game.forces[1]

    local currentTechs = 0
    -- do this for each technology
    for _,tech in pairs(force.technologies) do
        if tech.enabled then
            if tech.prototype.research_unit_count_formula == nil then
                if tech.researched then
                    currentTechs = currentTechs + 1
                end
            end
        end
    end
    
    -- Multiplier follows from the formula:
    -- y <-> mx + n
    -- cost = [(maxCost - startPrice)/(techCount)] * currentTechs + startPrice =!= f(...) * startPrice
    local multiplier = (maxCost - startPrice)/(techCount*startPrice) * currentTechs + 1

    -- set multiplier
    game.difficulty_settings.technology_price_multiplier = multiplier
end

return ei_tech_scaling