-- changes to FMF mod
local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

-- ====================================================================================================
-- CHECK FOR MOD
-- ====================================================================================================

if not mods["Flow Control"] then
    return
end

-- ====================================================================================================
-- CHANGES
-- ====================================================================================================

-- make recipes of junctions disabled and add their unlocks to tech tree

data.raw.recipe["pipe-junction"].enabled = false
data.raw.recipe["pipe-elbow"].enabled = false
data.raw.recipe["pipe-straight"].enabled = false

table.insert(data.raw.technology["ei_tank"].effects, {
    type = "unlock-recipe",
    recipe = "pipe-junction"
})

table.insert(data.raw.technology["ei_tank"].effects, {
    type = "unlock-recipe",
    recipe = "pipe-elbow"
})

table.insert(data.raw.technology["ei_tank"].effects, {
    type = "unlock-recipe",
    recipe = "pipe-straight"
})
