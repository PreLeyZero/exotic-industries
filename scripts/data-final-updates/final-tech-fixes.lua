-- treat tech mainly added by other mods
-- swap vanilla science packs with ei_science packs
-- TODO: add recursive age inclusion

local ei_data = require("lib/data")

--====================================================================================================
--FINAL TECH FIXES
--====================================================================================================

-- loop over all techs and check if they still contain a vanilla science pack
-- as cost, if so replace with ei_science pack from ei_data.science_dict

for i,v in pairs(data.raw.technology) do
    if data.raw.technology[i].unit.ingredients then
        
        -- check if tech contains vanilla science pack
        for x,y in ipairs(data.raw.technology[i].unit.ingredients) do
            if ei_data.science_dict[y[1]] then
                -- check if ei_science pack is already in tech
                local found = false
                for z,w in ipairs(data.raw.technology[i].unit.ingredients) do
                    if w[1] == ei_data.science_dict[y[1]] then
                        found = true
                    end
                end

                -- if ei_science pack is not in tech, swap vanilla science pack with ei_science pack
                if not found then
                    data.raw.technology[i].unit.ingredients[x][1] = ei_data.science_dict[y[1]]
                else
                    -- if ei_science pack is in tech, remove vanilla science pack
                    table.remove(data.raw.technology[i].unit.ingredients, x)
                end 
            end
        end
    end
end