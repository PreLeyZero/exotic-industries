-- Set cost of every technology to startPrice from settings
-- used with scaling tech costs in control stage

-- also set prerequisite of all techs to "ei_temp" tech

local ei_lib = require("lib/lib")

--====================================================================================================
--TECH FLATTENING
--====================================================================================================

local startPrice = ei_lib.config("tech-scaling:startPrice")

-- loop over all technologies
for i,v in pairs(data.raw.technology) do
    
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
    if not (string.sub(data.raw.technology[i].name, 1, 3) == "ei_") then
        data.raw.technology[i].prerequisites = {"ei_temp"}
    end
end