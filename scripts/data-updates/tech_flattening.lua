-- Set cost of every technology to startPrice from settings
-- used with scaling tech costs in control stage

-- also set prerequisite of all techs to "ei_temp" tech

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--TECH FLATTENING
--====================================================================================================

local startPrice = ei_lib.config("tech-scaling__startPrice")

-- loop over all technologies
for i,v in pairs(data.raw.technology) do
    
    --convert triggered technologies to science-packs
     if data.raw.technology[i]["research_trigger"] then
        data.raw.technology[i]["research_trigger"] = nil
        data.raw.technology[i].unit = {ingredients = {}, time=20, count=100}
     end

    -- treat science cost:
    -- if non multiple tech .count is accessible
    if data.raw.technology[i].unit.count then
        data.raw.technology[i].unit.count = startPrice
    end

    -- if multiple tech .count_formula is accessible
    if data.raw.technology[i].unit.count_formula then
        data.raw.technology[i].unit.count_formula = "2^((L-1)*0.5)*"..tostring(startPrice)
    end

    -- treat prerequisites:
    -- only if this is no Exotic-Industries tech
    --[[
    if not (string.sub(data.raw.technology[i].name, 1, 3) == "ei_") then
        data.raw.technology[i].prerequisites = {"ei_temp"}
    end
    ]]

    -- every tech in ei_data.tech_structure[] gets its prerequisites set to "ei_temp"
    -- aswell as all techs from ei_data.tech_exclude_list
    for i,v in pairs(ei_data.tech_structure) do
        for x,y in ipairs(ei_data.tech_structure[i]) do
            data.raw.technology[y].prerequisites = {"ei_temp"}
        end
    end

    for i,v in ipairs(ei_data.tech_exclude_list) do
        data.raw.technology[v].prerequisites = {"ei_temp"}
    end
end