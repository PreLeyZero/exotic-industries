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

