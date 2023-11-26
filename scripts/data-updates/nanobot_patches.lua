
local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["Nanobots"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================

data.raw.technology["nanobots"].prerequisites = {"electronics"}

local tech_table = {
    ["steam-age"] = {
        "nanobots",
        "nanobots-cliff",
        "nano-speed-1",
        "nano-speed-2",
        "nano-range-1",
        "nano-range-2"
    },
    ["electricity-age"] = {
        "nano-speed-3",
        "nano-speed-4",
        "nano-range-3",
        "nano-range-4",
    }
}

for age,techs in pairs(tech_table) do
    for _,tech in pairs(techs) do
        data.raw.technology[tech].age = age
    end
end

ei_lib.recipe_swap("equipment-bot-chip-items", "processing-unit", "advanced-circuit")
ei_lib.recipe_swap("equipment-bot-chip-launcher", "processing-unit", "advanced-circuit")
ei_lib.recipe_swap("equipment-bot-chip-trees", "processing-unit", "advanced-circuit")
ei_lib.recipe_swap("equipment-bot-chip-feeder", "processing-unit", "advanced-circuit")
ei_lib.recipe_swap("equipment-bot-chip-nanointerface", "processing-unit", "advanced-circuit")