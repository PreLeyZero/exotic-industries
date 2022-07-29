-- change prerequisites of vanilla techs for IE
-- at first sort them into their respective ages
-- more detailed structure will get added later on

ei_data = require("lib/data")

--====================================================================================================
--FUNCTIONS
--====================================================================================================

local function set_prerequisites(tech, prerequisite)

    -- test if both in data.raw
    if not data.raw["technology"][tech] then
        ei_lib.log("Error: "..tech.." not found in data.raw")
        return
    end

    if not data.raw["technology"][prerequisite] then
        ei_lib.log("Error: "..prerequisite.." not found in data.raw")
        return
    end

    -- set prerequisites:

    -- if the only current prerequisite is "ei_temp" then simply setting is fine
    -- otherwise add the new prerequisite to the list of prerequisites
    if data.raw["technology"][tech].prerequisites[1] == "ei_temp" then
        data.raw["technology"][tech].prerequisites = {prerequisite}
    else
       table.insert(data.raw["technology"][tech].prerequisites, prerequisite)
    end

end

local function set_prerequisites_for_ages(table_in)
    -- use tech_structure table where keys correspond to "ei_KEY" tech

    for i,v in pairs(table_in) do
        local prerequisite = "ei_"..i

        -- set prerequisite for every tech in sub-table
        for x,y in ipairs(table_in[i]) do
            set_prerequisites(y, prerequisite)
        end
    end

end

local function set_packs(tech, ingredients)
    -- test if tech is in data.raw
    if not data.raw["technology"][tech] then
        ei_lib.log("Error: "..tech.." not found in data.raw")
        return
    end

    -- set pack for tech
    data.raw["technology"][tech].unit.ingredients = ingredients

end

local function set_packs_for_ages(tech_structure, science_packs)
    -- use tech_structure where keys is age
    -- science packs are keyed by age

    for i,v in pairs(tech_structure) do
        local age = i

        -- loop over all techs for age and set pack to their corresponding pack
        for x,y in ipairs(tech_structure[i]) do
            set_packs(y, science_packs[i])
        end
    end

end

--====================================================================================================
--DO IT
--====================================================================================================

local science_packs = ei_data.science
local tech_structure = ei_data.tech_structure
-- structure of tech_structure is:
-- tech_structure["dark-age"] ...

set_prerequisites_for_ages(tech_structure)
set_packs_for_ages(tech_structure, science_packs)