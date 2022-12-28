-- fix recipes that are broken due to patches

local ei_data = require("lib/data")
local ei_lib = require("lib/lib")

--====================================================================================================
--FINAL RECIPE FIXES
--====================================================================================================

-- loop over all recipes and apply fix_recipe
for i,v in pairs(data.raw.recipe) do
    -- get mode of recipe
    if data.raw.recipe[i].normal then
        ei_lib.fix_recipe(i, "normal")
        ei_lib.fix_recipe(i, "expensive")
    else
        ei_lib.fix_recipe(i, nil)
    end

end


-- hide all barrel rcipes that were added by autobarreling from player
-- check if recipe is in fill-barrel or empty-barrel subgroup

for i,v in pairs(data.raw.recipe) do
    if data.raw.recipe[i].subgroup == "fill-barrel" or data.raw.recipe[i].subgroup == "empty-barrel" then
        data.raw.recipe[i].hide_from_player_crafting = true
    end
end
