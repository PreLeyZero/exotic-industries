-- changes to K2 mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["Krastorio2"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

-- set crafting categories of express splitter, belt, underground belt to crafting with fluid
data.raw.recipe["express-splitter"].category = "crafting-with-fluid"
data.raw.recipe["express-transport-belt"].category = "crafting-with-fluid"
data.raw.recipe["express-underground-belt"].category = "crafting-with-fluid"