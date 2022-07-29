-- age techs will get researchable, if a certain percentage of techs from the previous age is researched

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

local age_enabler = {}

--====================================================================================================
--AGE ENABLER
--====================================================================================================

local function age_enabler.on_research_finished()
    -- loop over ages, since age tech names are same as age names
    -- check for every tech if X% of techs from previous age are researched
    -- if so, enable tech for research

    for i,v in ipairs(ei_data.ages) do
        -- chech if tech is 

        -- check if age tech is already researched or enabled

        -- TODO
    end
end