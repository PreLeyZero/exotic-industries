
local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["extra-storage-tank"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

data.raw.technology["steel-storage-tank"].age = "steam-age"
data.raw.technology["steel-storage-tank"].prerequisites = {"ei_tank"}

ei_lib.recipe_new("steel-storage-tank", {
    {type="item", name="storage-tank", amount=3},
    {type="item", name="steel-plate", amount=15},
    {type="item", name="ei_iron-mechanical-parts", amount=20}
})

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["extra-storage-tank-minibuffer"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

data.raw.technology["minibuffer"].age = "steam-age"
data.raw.technology["minibuffer"].prerequisites = {"ei_tank"}