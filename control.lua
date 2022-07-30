--====================================================================================================
--REQUIREMENTS
--====================================================================================================

local ei_tech_scaling = require("scripts/control/tech_scaling")
local ei_global = require("scripts/control/global")
local ei_age_enabler = require("scripts/control/age_enabler")

--====================================================================================================
--EVENTS
--====================================================================================================

--INIT
------------------------------------------------------------------------------------------------------
script.on_init(function()
    -- setup global table
    ei_global.init()
    
    ei_tech_scaling.init()
end)


--ENTITY RELATED
------------------------------------------------------------------------------------------------------


--RESEARCH RELATED
------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_research_finished, function(event)

    -- set new tech costs
    ei_tech_scaling.on_research_finished(event)
    -- check if next age tech can be enabled
    ei_age_enabler.on_research_finished(event)
end)