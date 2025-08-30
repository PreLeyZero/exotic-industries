-- vanilla patches like changed entities/prototypes are made here

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--GENERIC CHANGES
--====================================================================================================

-- since there is no iron gear used in EI use iron-mechanical parts instead
for i,v in pairs(data.raw["recipe"]) do
    ei_lib.recipe_swap(i, "iron-gear-wheel", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(i, "iron-stick", "ei_iron-mechanical-parts")
end


--====================================================================================================
--CHANGES
--====================================================================================================

--MINING
------------------------------------------------------------------------------------------------------

-- set output of copper and iron ore to ore chunks
data.raw["resource"]["iron-ore"].minable.result = "ei_poor-iron-chunk"
data.raw["resource"]["copper-ore"].minable.result = "ei_poor-copper-chunk"

-- set furnace result inv to 2, when they have the smelting crafting category
for i,v in pairs(data.raw["furnace"]) do
    if v.crafting_categories[1] == "smelting" then
        data.raw["furnace"][i].result_inventory_size = 2
    end
end

--LABS
------------------------------------------------------------------------------------------------------

data.raw["lab"]["lab"].inputs = ei_data.lab_inputs["lab"]
data.raw["lab"]["lab"].researching_speed = 1.5
data.raw["lab"]["lab"].fast_replaceable_group = "lab"

--RECIPES
------------------------------------------------------------------------------------------------------

-- overwrite table for vanilla recipes
-- index is recipe name, value is table with new recipe data
local new_ingredients_table = {
    ["iron-plate"] = {
        {type="item", name="ei_iron-ingot", amount=1}
    },
    ["copper-plate"] = {
        {type="item", name="ei_copper-ingot", amount=1}
    },
    ["transport-belt"] = {
        {type="item", name="iron-plate", amount=1},
        {type="item", name="ei_iron-mechanical-parts", amount=2}
    },
    ["burner-inserter"] = {
        {type="item", name="iron-plate", amount=1},
        {type="item", name="ei_copper-mechanical-parts", amount=2}
    },
    ["repair-pack"] = {
        {type="item", name="ei_copper-mechanical-parts", amount=3},
        {type="item", name="ei_iron-mechanical-parts", amount=3} 
    },
    ["iron-chest"] = {
        {type="item", name="iron-plate", amount=8},
        {type="item", name="ei_iron-beam", amount=2} 
    },
    ["gun-turret"] = {
        {type="item", name="iron-plate", amount=5},
        {type="item", name="ei_iron-mechanical-parts", amount=5},
        {type="item", name="ei_copper-mechanical-parts", amount=5}
    },
    ["heavy-armor"] = {
        {type="item", name="iron-plate", amount=40},
        {type="item", name="ei_iron-beam", amount=10},
        {type="item", name="ei_copper-beam", amount=10}
    },
    ["stone-wall"] = {
        {type="item", name="stone-brick", amount=3},
        {type="item", name="ei_iron-beam", amount=1} 
    },
    ["offshore-pump"] = {
        {type="item", name="ei_copper-mechanical-parts", amount=4},
        {type="item", name="ei_iron-beam", amount=2},
        {type="item", name="pipe", amount=2}
    },
    ["train-stop"] = {
        {type="item", name="ei_iron-beam", amount=2},
        {type="item", name="ei_iron-mechanical-parts", amount=2},
        {type="item", name="copper-plate", amount=2}
    },
    ["rail-signal"] = {
        {type="item", name="ei_copper-mechanical-parts", amount=1},
        {type="item", name="iron-plate", amount=1}
    },
    ["rail-chain-signal"] = {
        {type="item", name="ei_copper-mechanical-parts", amount=1},
        {type="item", name="iron-plate", amount=1}
    },
    ["steel-furnace"] = {
        {type="item", name="steel-plate", amount=4},
        {type="item", name="stone-brick", amount=10},
        {type="item", name="stone-furnace", amount=1}
    },
    ["gate"] = {
        {type="item", name="stone-wall", amount=1},
        {type="item", name="ei_iron-beam", amount=2},
        {type="item", name="ei_copper-mechanical-parts", amount=4}
    },
    ["oil-refinery"] = {
        {type="item", name="pipe", amount=10},
        {type="item", name="ei_copper-beam", amount=20},
        {type="item", name="steel-plate", amount=15},
        {type="item", name="ei_steel-mechanical-parts", amount=10},
        {type="item", name="stone-brick", amount=10}
    },
    ["engine-unit"] = {
        {type="item", name="ei_steam-engine", amount=1},
        {type="item", name="ei_copper-mechanical-parts", amount=1},
        {type="item", name="ei_iron-mechanical-parts", amount=1}
    },
    ["lab"] = {
        {type="item", name="ei_dark-age-lab", amount=1},
        {type="item", name="ei_copper-mechanical-parts", amount=10},
        {type="item", name="ei_iron-mechanical-parts", amount=10},
        {type="item", name="electronic-circuit", amount=10}
    },
    ["electric-engine-unit"] = {
        {type="item", name="engine-unit", amount=1},
        {type="item", name="copper-cable", amount=4},
        {type="item", name="ei_iron-mechanical-parts", amount=2}
    },
    ["steam-engine"] = {
        {type="item", name="pipe", amount=5},
        {type="item", name="electric-engine-unit", amount=4},
        {type="item", name="ei_steam-engine", amount=4},
        {type="item", name="ei_iron-beam", amount=2}
    },
    ["inserter"] = {
        {type="item", name="electric-engine-unit", amount=1},
        {type="item", name="burner-inserter", amount=1},
        {type="item", name="electronic-circuit", amount=2}
    },
    ["medium-electric-pole"] = {
        {type="item", name="ei_copper-beam", amount=4},
        {type="item", name="ei_iron-mechanical-parts", amount=2},
        {type="item", name="ei_insulated-wire", amount=2}
    },
    ["big-electric-pole"] = {
        {type="item", name="steel-plate", amount=8},
        {type="item", name="ei_iron-mechanical-parts", amount=2},
        {type="item", name="ei_insulated-wire", amount=4}
    },
    ["substation"] = {
        {type="item", name="steel-plate", amount=6},
        {type="item", name="ei_insulated-wire", amount=6},
        {type="item", name="electronic-circuit", amount=6},
        {type="item", name="concrete", amount=25}
    },
    ["concrete"] = {
        {type="item", name="ei_poor-iron-chunk", amount=5},
        {type="item", name="stone-brick", amount=10},
        {type="item", name="ei_sand", amount=4}
    },
    ["assembling-machine-1"] = {
        {type="item", name="electronic-circuit", amount=2},
        {type="item", name="electric-engine-unit", amount=2},
        {type="item", name="ei_iron-beam", amount=2},
        {type="item", name="ei_copper-mechanical-parts", amount=4}
    },
    ["chemical-plant"] = {
        {type="item", name="ei_heat-chemical-plant", amount=1},
        {type="item", name="electronic-circuit", amount=2},
        {type="item", name="electric-engine-unit", amount=2},
    },
    ["roboport"] = {
        {type="item", name="advanced-circuit", amount=45},
        {type="item", name="concrete", amount=50},
        {type="item", name="ei_steel-mechanical-parts", amount=45},
        {type="item", name="steel-plate", amount=45}
    },
    ["logistic-robot"] = {
        {type="item", name="advanced-circuit", amount=4},
        {type="item", name="steel-plate", amount=4},
        {type="item", name="flying-robot-frame", amount=1}
    },
    ["construction-robot"] = {
        {type="item", name="electronic-circuit", amount=4},
        {type="item", name="steel-plate", amount=4},
        {type="item", name="flying-robot-frame", amount=1}
    },
    ["modular-armor"] = {
        {type="item", name="advanced-circuit", amount=25},
        {type="item", name="heavy-armor", amount=1},
        {type="item", name="iron-plate", amount=25},
    },
    ["exoskeleton-equipment"] = {
        {type="item", name="ei_steel-mechanical-parts", amount=10},
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="electric-engine-unit", amount=25},
    },
    ["discharge-defense-equipment"] = {
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="steel-plate", amount=10},
        {type="item", name="ei_insulated-wire", amount=45},
    },
    ["power-armor"] = {
        {type="item", name="modular-armor", amount=1},
        {type="item", name="electric-engine-unit", amount=40},
        {type="item", name="advanced-circuit", amount=40},
        {type="item", name="ei_energy-crystal", amount=100},
    },
    ["energy-shield-equipment"] = {
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="steel-plate", amount=10},
        {type="item", name="ei_energy-crystal", amount=25},
    },
    ["personal-laser-defense-equipment"] = {
        {type="item", name="laser-turret", amount=6},
        {type="item", name="steel-plate", amount=10},
        {type="item", name="ei_energy-crystal", amount=25},
    },
    ["laser-turret"] = {
        {type="item", name="steel-plate", amount=20},
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="battery", amount=12},
        {type="item", name="ei_energy-crystal", amount=10},
    },
    ["solar-panel"] = {
        {type="item", name="ei_semiconductor", amount=1},
        {type="item", name="steel-plate", amount=4},
        {type="item", name="electronic-circuit", amount=8},
    },
    ["electric-furnace"] = {
        {type="item", name="copper-cable", amount=40},
        {type="item", name="ei_steel-mechanical-parts", amount=10},
        {type="item", name="electronic-circuit", amount=10},
        {type="item", name="steel-furnace", amount=1},
    },
    ["radar"] = {
        {type="item", name="electronic-circuit", amount=5},
        {type="item", name="steel-plate", amount=6},
        {type="item", name="ei_iron-mechanical-parts", amount=10},
        {type="item", name="electric-engine-unit", amount=4},
    },
    ["electric-mining-drill"] = {
        {type="item", name="electric-engine-unit", amount=4},
        {type="item", name="electronic-circuit", amount=4},
        {type="item", name="ei_iron-beam", amount=3},
        {type="item", name="ei_iron-mechanical-parts", amount=5},
    },
    ["storage-tank"] = {
        {type="item", name="steel-plate", amount=8},
        {type="item", name="ei_iron-beam", amount=4},
        {type="item", name="pipe", amount=4},
    },
    ["splitter"] = {
        {type="item", name="transport-belt", amount=1},
        {type="item", name="ei_iron-mechanical-parts", amount=5},
    },
    ["underground-belt"] = {
        {type="item", name="transport-belt", amount=5},
        {type="item", name="ei_iron-mechanical-parts", amount=10},
    },
    ["nuclear-reactor"] = {
        {type="item", name="concrete", amount=250},
        {type="item", name="ei_lead-plate", amount=150},
        {type="item", name="advanced-circuit", amount=250},
        {type="item", name="ei_energy-crystal", amount=100},
        {type="item", name="steel-plate", amount=150},
        {type="item", name="ei_fission-tech", amount=100},
    },
    ["heat-pipe"] = {
        {type="item", name="ei_basic-heat-pipe", amount=1},
        {type="item", name="ei_energy-crystal", amount=1},
        {type="item", name="steel-plate", amount=5},
    },
    ["centrifuge"] = {
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="ei_steel-mechanical-parts", amount=20},
        {type="item", name="ei_lead-plate", amount=10},
        {type="item", name="electric-engine-unit", amount=15},
        {type="item", name="ei_energy-crystal", amount=15},
    },
    ["steam-turbine"] = {
        {type="item", name="pipe", amount=10},
        {type="item", name="ei_steam-engine", amount=25},
        {type="item", name="ei_steel-mechanical-parts", amount=50},
        {type="item", name="copper-plate", amount=50},
    },
    ["accumulator"] = {
        {type="item", name="steel-plate", amount=6},
        {type="item", name="battery", amount=5},
        {type="item", name="plastic-bar", amount=2},
    },
    ["bulk-inserter"] = {
        {type="item", name="ei_electronic-parts", amount=5},
        {type="item", name="ei_advanced-motor", amount=4},
        {type="item", name="fast-inserter", amount=1},
        {type="item", name="ei_energy-crystal", amount=4},
    },
    ["efficiency-module"] = {
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="ei_energy-crystal", amount=4},
    },
    ["productivity-module"] = {
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="advanced-circuit", amount=4},
    },
    ["efficiency-module-2"] = {
        {type="item", name="ei_simulation-data", amount=25},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="efficiency-module", amount=2},
    },
    ["productivity-module-2"] = {
        {type="item", name="ei_simulation-data", amount=25},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="productivity-module", amount=2},
    },
    ["speed-module-2"] = {
        {type="item", name="ei_simulation-data", amount=25},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="speed-module", amount=2},
    },
    ["assembling-machine-3"] = {
        {type="item", name="assembling-machine-2", amount=2},
        {type="item", name="ei_advanced-motor", amount=10},
        {type="item", name="ei_electronic-parts", amount=6},
    },
    ["processing-unit"] = {
        {type="item", name="ei_electronic-parts", amount=1},
        {type="item", name="ei_advanced-semiconductor", amount=1},
        {type="item", name="ei_simulation-data", amount=4},
        {type="item", name="ei_crushed-gold", amount=8},
    },
    ["efficiency-module-3"] = {
        {type="item", name="processing-unit", amount=2},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="efficiency-module-2", amount=2},
    },
    ["productivity-module-3"] = {
        {type="item", name="processing-unit", amount=2},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="productivity-module-2", amount=2},
    },
    ["speed-module-3"] = {
        {type="item", name="processing-unit", amount=2},
        {type="item", name="ei_module-base", amount=1},
        {type="item", name="speed-module-2", amount=2},
    },
    ["satellite"] = {
        {type="item", name="rocket-fuel", amount=20},
        {type="item", name="ei_rocket-parts", amount=5},
        {type="item", name="solar-panel", amount=6},
        {type="item", name="ei_high-energy-crystal", amount=10},
        {type="item", name="radar", amount=5},
    },
    ["spidertron"] = {
        {type="item", name="tank", amount=1},
        {type="item", name="ei_steel-mechanical-parts", amount=100},
        {type="item", name="ei_advanced-motor", amount=100},
        {type="item", name="ei_high-energy-crystal", amount=40},
        {type="item", name="ei_electronic-parts", amount=40},
        {type="item", name="ei_simulation-data", amount=100},
    },
    ["spidertron-remote"] = {
        {type="item", name="radar", amount=1},
        {type="item", name="advanced-circuit", amount=1},
    },
    ["power-armor-mk2"] = {
        {type="item", name="power-armor", amount=1},
        {type="item", name="low-density-structure", amount=40},
        {type="item", name="processing-unit", amount=60},
        {type="item", name="ei_high-energy-crystal", amount=40},
    },
    ["express-transport-belt"] = {
        {type="item", name="fast-transport-belt", amount=1},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=15},
    },
    ["express-underground-belt"] = {
        {type="item", name="fast-underground-belt", amount=2},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=35},
    },
    ["express-splitter"] = {
        {type="item", name="fast-splitter", amount=1},
        {type="item", name="advanced-circuit", amount=10},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=55},
    },
    ["firearm-magazine"] = {
        {type="item", name="ei_iron-mechanical-parts", amount=2},
    },
    ["piercing-rounds-magazine"] = {
        {type="item", name="firearm-magazine", amount=1},
        {type="item", name="ei_copper-mechanical-parts", amount=2},
        {type="item", name="ei_steel-mechanical-parts", amount=3},
    },
    ["shotgun-shell"] = {
        {type="item", name="ei_iron-mechanical-parts", amount=1},
        {type="item", name="ei_copper-mechanical-parts", amount=2},
    },
    ["piercing-shotgun-shell"] = {
        {type="item", name="shotgun-shell", amount=1},
        {type="item", name="ei_steel-mechanical-parts", amount=3},
        {type="item", name="ei_copper-mechanical-parts", amount=2},
    },
    ["rocket-silo"] = {
        {type="item", name="processing-unit", amount=200},
        {type="item", name="ei_steel-mechanical-parts", amount=200},
        {type="item", name="steel-plate", amount=200},
        {type="item", name="concrete", amount=1000},
        {type="item", name="ei_advanced-motor", amount=50},
    },
    ["fission-reactor-equipment"] = {
        {type="item", name="nuclear-reactor", amount=1},
        {type="item", name="ei_fission-tech", amount=30},
        {type="item", name="steam-turbine", amount=1},
},
    ["arithmetic-combinator"] = {
        {type="item", name="electronic-circuit", amount=2},
        {type="item", name="copper-cable", amount=3},
    },
    ["decider-combinator"] = {
        {type="item", name="electronic-circuit", amount=2},
        {type="item", name="copper-cable", amount=3},
    },
    ["cannon-shell"] = {
        {type="item", name="ei_iron-beam", amount=1},
        {type="item", name="ei_ceramic", amount=2},
        {type="item", name="plastic-bar", amount=1}
    },
    ["explosive-cannon-shell"] = {
        {type="item", name="cannon-shell", amount=1},
        {type="item", name="explosives", amount=2},
    },
    ["artillery-shell"] = {
        {type="item", name="explosive-cannon-shell", amount=4},
        -- {type="item", name="ei_high-energy-crystal", amount=1},
        {type="item", name="ei_electronic-parts", amount=2},
        {type="item", name="explosives", amount=8},
        {type="item", name="radar", amount=1},
    },
}

data.raw["recipe"]["iron-plate"].category = "crafting"
data.raw["recipe"]["iron-plate"].energy_required = 1

data.raw["recipe"]["copper-plate"].category = "crafting"
data.raw["recipe"]["copper-plate"].energy_required = 1

data.raw["recipe"]["burner-mining-drill"].ingredients = {
    {type="item", name="iron-plate", amount=3},
    {type="item", name="ei_iron-mechanical-parts", amount=3},
    {type="item", name="stone-furnace", amount=1}
}

data.raw["recipe"]["pipe"].ingredients = {
    {type="item", name="iron-plate", amount=1},
    {type="item", name="ei_iron-mechanical-parts", amount=1}
}

data.raw["recipe"]["electronic-circuit"].ingredients = {
    {type="item", name="ei_electron-tube", amount=1},
    {type="item", name="copper-cable", amount=2},
    {type="item", name="iron-plate", amount=1}
}

data.raw["recipe"]["basic-oil-processing"].ingredients =
{
    {type="fluid", name="crude-oil", amount=50},
    {type="fluid", name="water", amount=20},
}
data.raw["recipe"]["basic-oil-processing"].results = 
{
    {type="fluid", name="ei_residual-oil", amount=55},
    {type="fluid", name="petroleum-gas", amount=55},
}

data.raw["recipe"]["sulfuric-acid"].ingredients = {
    {type="fluid", name="water", amount=25},
    {type="item", name="ei_crushed-iron", amount=1},
    {type="item", name="sulfur", amount=3}

}

-- treat red belts with plastic
data.raw["recipe"]["fast-transport-belt"].ingredients = {
    {type="item", name="transport-belt", amount=1},
    {type="item", name="ei_iron-mechanical-parts", amount=5},
    {type="item", name="plastic-bar", amount=1}
}
data.raw["recipe"]["fast-underground-belt"].ingredients = {
    {type="item", name="underground-belt", amount=2},
    {type="item", name="ei_iron-mechanical-parts", amount=30},
    {type="item", name="plastic-bar", amount=4}
}
data.raw["recipe"]["fast-splitter"].ingredients = {
    {type="item", name="splitter", amount=1},
    {type="item", name="ei_iron-mechanical-parts", amount=12},
    {type="item", name="electronic-circuit", amount=8},
    {type="item", name="plastic-bar", amount=4}
}

-- red circuits need sulfuric acid
ei_lib.recipe_new("advanced-circuit",
{
    {type="item", name="electronic-circuit", amount=2},
    {type="item", name="ei_insulated-wire", amount=4},
    {type="item", name="ei_electron-tube", amount=2},
    {type="fluid", name="sulfuric-acid", amount=5}
})
data.raw["recipe"]["advanced-circuit"].category = "crafting-with-fluid"

-- batteries
ei_lib.recipe_new("battery",
{
    {type="item", name="ei_crushed-iron", amount=4},
    {type="item", name="ei_crushed-copper", amount=4},
    {type="item", name="ei_ceramic", amount=1},
    {type="fluid", name="sulfuric-acid", amount=25}
})

-- robo frames
data.raw["recipe"]["flying-robot-frame"].category = "crafting-with-fluid"
ei_lib.recipe_new("flying-robot-frame",
{
    {type="item", name="electric-engine-unit", amount=4},
    {type="item", name="battery", amount=2},
    {type="item", name="advanced-circuit", amount=5},
    {type="item", name="ei_steel-mechanical-parts", amount=10},
    {type="item", name="ei_energy-crystal", amount=1},
    {type="fluid", name="lubricant", amount=100}
})

-- treat cracking
data.raw["recipe"]["heavy-oil-cracking"].icon = ei_graphics_other_path.."heavy-cracking.png"
data.raw["recipe"]["heavy-oil-cracking"].icon_size = 64
data.raw["recipe"]["heavy-oil-cracking"].results = {
    {type="fluid", name="ei_kerosene", amount=40},
}
ei_lib.recipe_new("heavy-oil-cracking",
{
    {type="fluid", name="heavy-oil", amount=50},
    {type="fluid", name="water", amount=40}
})

-- make engine recipe in recipe-category crafting
data.raw["recipe"]["engine-unit"].category = "crafting"

-- reduce craft time of engines and electric engines
data.raw["recipe"]["engine-unit"].energy_required = 4
data.raw["recipe"]["electric-engine-unit"].energy_required = 6

-- recipes for modules
data.raw["recipe"]["speed-module"].category = "crafting-with-fluid"
ei_lib.recipe_new("speed-module",
{
    {type="item", name="ei_module-base", amount=1},
    {type="fluid", name="ei_liquid-nitrogen", amount=25}
})

-- treat rocket fuel
data.raw["recipe"]["rocket-fuel"].category = "chemistry"
ei_lib.recipe_new("rocket-fuel",
{
    {type="item", name="solid-fuel", amount=10},
    {type="fluid", name="ei_kerosene", amount=15},
    {type="fluid", name="ei_liquid-oxygen", amount=25},
})

--TECHS
------------------------------------------------------------------------------------------------------

local new_prerequisites_table = {}

-- first index is tech second is prerequisite
new_prerequisites_table["steam-age"] = {
    {"refined-flammables-1", "flammables"},
    {"refined-flammables-2", "refined-flammables-1"},
    {"flamethrower", "flammables"},
    {"flammables", "ei_steam-oil-processing"},
    {"physical-projectile-damage-2", "military-2"},
    {"weapon-shooting-speed-2", "military-2"},
    {"automated-rail-transportation", "ei_steam-basic-train"},
    -- {"railway", "ei_steam-power"},
    -- {"fluid-wagon", "railway"},
    {"rail-signals", "ei_steam-basic-train"},
    {"braking-force-1", "ei_steam-basic-train"},
    {"braking-force-2", "braking-force-1"},
    -- {"fluid-wagon", "fluid-handling"},
    {"stronger-explosives-1", "military-2"},
    {"gate", "military-2"},
    {"automobilism", "military-2"},
    {"automobilism", "engine"},
    {"flammables", "military-2"},
    {"flamethrower", "steel-processing"},
    {"flamethrower", "engine"},
    {"inserter-capacity-bonus-1", "ei_steam-inserter"},
    {"steel-processing", "ei_steam-crusher"},
    {"advanced-material-processing", "steel-processing"},
    -- {"fluid-handling", "steel-processing"},
    {"military-2", "steel-processing"},
    {"steel-axe", "steel-processing"},
    {"engine", "ei_steam-oil-processing"},
    {"electronics", "ei_glass"},
}

new_prerequisites_table["electricity-age"] = {
    {"electric-energy-distribution-1", "plastics"},
    {"electric-energy-distribution-2", "plastics"},
    {"electric-energy-distribution-2", "concrete"},
    {"automation", "ei_electricity-power"},
    {"automation-2", "automation"},
    {"fast-inserter", "ei_electricity-power"},
    {"circuit-network", "ei_electricity-power"},
    {"lamp", "ei_electricity-power"},
    {"laser", "lamp"},
    {"laser-turret", "laser"},
    {"laser-weapons-damage-1", "laser"},
    {"laser-weapons-damage-2", "laser-weapons-damage-1"},
    {"laser-shooting-speed-1", "laser"},
    {"laser-shooting-speed-2", "laser-shooting-speed-1"},
    {"laser-shooting-speed-3", "laser-shooting-speed-2"},
    {"laser", "military-3"},
    {"tank", "military-3"},
    {"physical-projectile-damage-3", "military-3"},
    {"land-mine", "military-3"},
    {"stronger-explosives-2", "military-3"},
    {"refined-flammables-3", "military-3"},
    {"refined-flammables-4", "refined-flammables-3"},
    {"physical-projectile-damage-4", "physical-projectile-damage-3"},
    {"cliff-explosives", "explosives"},
    {"worker-robots-speed-2", "worker-robots-speed-1"},
    {"robotics", "lubricant"},
    {"robotics", "advanced-circuit"},
    {"robotics", "battery"},
    {"robotics", "ei_grower"},
    {"logistic-robotics", "robotics"},
    {"construction-robotics", "robotics"},
    {"worker-robots-speed-1", "robotics"},
    {"personal-roboport-equipment", "robotics"},
    -- {"logistic-system", "logistic-robotics"},
    -- {"logistic-system", "construction-robotics"},
    {"defender", "robotics"},
    {"distractor", "defender"},
    {"destroyer", "distractor"},
    {"follower-robot-count-1", "defender"},
    {"follower-robot-count-2", "follower-robot-count-1"},
    {"modular-armor", "military-3"},
    {"power-armor", "modular-armor"},
    {"braking-force-3", "railway"},
    {"fluid-wagon", "railway"},
    {"lubricant", "ei_destill-tower"},
    {"railway", "fluid-handling"},
    {"railway", "sulfur-processing"},
    {"braking-force-4", "braking-force-3"},
    {"braking-force-5", "braking-force-4"},
    {"energy-shield-equipment", "power-armor"},
    {"night-vision-equipment", "modular-armor"},
    {"belt-immunity-equipment", "modular-armor"},
    {"exoskeleton-equipment", "modular-armor"},
    {"battery-equipment", "modular-armor"},
    {"solar-panel-equipment", "modular-armor"},
    {"personal-laser-defense-equipment", "power-armor"},
    {"discharge-defense-equipment", "modular-armor"},
    {"inserter-capacity-bonus-2", "fast-inserter"},
    {"sulfur-processing", "ei_destill-tower"},
    {"oil-processing", "plastics"},
    {"coal-liquefaction", "ei_benzol"},
    {"coal-liquefaction", "sulfur-processing"},
    {"advanced-oil-processing", "ei_destill-tower"},
    {"battery", "sulfur-processing"},
    {"electric-energy-accumulators", "battery"},
    {"lubricant", "automation-2"},
    {"logistics-2", "plastics"},
    {"advanced-circuit", "sulfur-processing"},
    {"advanced-circuit", "automation-2"},
    {"inserter-capacity-bonus-2", "lubricant"},
    {"construction-robotics", "concrete"},
    {"logistic-robotics", "concrete"},
    {"explosives", "sulfur-processing"},
    {"military-3", "explosives"},
    {"modular-armor", "advanced-circuit"},
    {"battery-equipment", "battery"},
    {"solar-panel-equipment", "solar-energy"},
    {"personal-laser-defense-equipment", "laser-turret"},
    {"laser", "ei_grower"},
    {"laser", "advanced-circuit"},
    {"personal-roboport-equipment", "modular-armor"},
    {"power-armor", "ei_grower"},
    {"solar-energy", "ei_waver-factory"},
    -- {"advanced-material-processing-2", "advanced-circuit"},
    {"advanced-material-processing-2", "ei_electricity-power"},
    {"uranium-processing", "ei_deep-mining"},
    {"uranium-processing", "advanced-circuit"},
    {"uranium-processing", "ei_grower"},
    {"nuclear-power", "uranium-processing"},
    -- {"nuclear-fuel-processing", "nuclear-power"},
    {"uranium-ammo", "uranium-processing"},
    {"uranium-ammo", "tank"},
    
}

new_prerequisites_table["computer-age"] = {
    {"inserter-capacity-bonus-3", "bulk-inserter"},
    {"speed-module", "modules"},
    {"speed-module-2", "speed-module"},
    {"speed-module-3", "speed-module-2"},
    {"speed-module-2", "ei_computer-core"},
    {"speed-module-3", "processing-unit"},
    {"productivity-module", "modules"},
    {"productivity-module-2", "productivity-module"},
    {"productivity-module-2", "ei_computer-core"},
    {"productivity-module-3", "productivity-module-2"},
    {"productivity-module-3", "processing-unit"},
    {"efficiency-module", "modules"},
    {"efficiency-module-2", "efficiency-module"},
    {"efficiency-module-3", "efficiency-module-2"},
    {"efficiency-module-2", "ei_computer-core"},
    {"efficiency-module-3", "processing-unit"},
    -- {"processing-unit", "ei_computer-core"},
    {"processing-unit", "ei_nitric-acid"},
    {"braking-force-6", "logistics-3"},
    {"automation-3", "ei_cryodust"},
    -- {"automation-3", "ei_bio-reactor"},
    {"rocket-silo", "automation-3"},
    {"logistics-3", "automation-3"},
    {"mining-productivity-2", "ei_advanced-computer-age-tech"},
    {"bulk-inserter", "logistics-3"},
    {"logistic-system", "ei_computer-core"},
    {"personal-roboport-mk2-equipment", "logistic-system"},
    {"worker-robots-speed-3", "processing-unit"},
    {"personal-roboport-mk2-equipment", "processing-unit"},
    {"worker-robots-speed-3", "logistic-system"},
    {"worker-robots-storage-1", "processing-unit"},
    {"worker-robots-storage-1", "logistic-system"},
    {"research-speed-3", "ei_advanced-computer-age-tech"},
    {"artillery", "rocketry"},
    {"artillery", "ei_high-energy-crystal"},
    {"artillery", "ei_advanced-computer-age-tech"},
    {"spidertron", "rocketry"},
    {"spidertron", "ei_computer-core"},
    {"spidertron", "ei_high-energy-crystal"},
    {"spidertron", "automation-3"},
    {"rocketry", "military-4"},
    {"explosive-rocketry", "rocketry"},
    {"laser-weapons-damage-3", "power-armor-mk2"},
    -- {"stronger-explosives-3", "military-4"},
    {"weapon-shooting-speed-3", "rocketry"},
    {"refined-flammables-5", "military-4"},
    {"stronger-explosives-3", "refined-flammables-5"},
    {"laser-shooting-speed-4", "power-armor-mk2"},
    {"follower-robot-count-3", "power-armor-mk2"},
    {"follower-robot-count-3", "personal-roboport-mk2-equipment"},
    {"power-armor-mk2", "processing-unit"},
    {"power-armor-mk2", "low-density-structure"},
    {"power-armor-mk2", "ei_high-energy-crystal"},
    {"energy-shield-mk2-equipment", "power-armor-mk2"},
    {"battery-mk2-equipment", "power-armor-mk2"},
    {"physical-projectile-damage-5", "rocketry"},
    {"physical-projectile-damage-6", "physical-projectile-damage-5"},
    {"low-density-structure", "ei_advanced-steel"},
    {"rocket-fuel", "refined-flammables-6"},
    {"rocket-fuel", "ei_oxygen-gas"},
    {"ei_rocket-parts", "rocket-fuel"},
    {"rocket-silo", "ei_rocket-parts"},
    {"processing-unit", "ei_advanced-computer-age-tech"},
    {"fission-reactor-equipment", "ei_high-temperature-reactor"},
    
}

new_prerequisites_table["quantum-age"] = {
    {"mining-productivity-4", "ei_deep-exploration"},
    {"research-speed-6", "ei_deep-exploration"},
    {"inserter-capacity-bonus-7", "ei_deep-exploration"},
    {"worker-robots-speed-6", "ei_deep-exploration"},
    {"worker-robots-speed-5", "ei_fusion-data"},
    {"worker-robots-storage-3", "ei_fusion-data"},
    {"laser-weapons-damage-6", "ei_fusion-data"},
    {"laser-weapons-damage-7", "ei_deep-exploration"},
    {"stronger-explosives-7", "ei_deep-exploration"},
    {"physical-projectile-damage-7", "ei_deep-exploration"},
    {"refined-flammables-7", "ei_deep-exploration"},
    {"artillery-shell-range-1", "artillery"},
    {"artillery-shell-speed-1", "artillery"},
    {"artillery-shell-range-1", "ei_deep-exploration"},
    {"artillery-shell-speed-1", "ei_deep-exploration"},
}

if mods['space-exploration'] then 
  log("SE detected, removing conflicting tech prerequisites") 
  for index,record in ipairs(new_prerequisites_table["quantum-age"]) do 
    if record[1] == "research-speed-6" then new_prerequisites_table["quantum-age"][index]=nil end
    if record[1] == "inserter-capacity-bonus-7" then new_prerequisites_table["quantum-age"][index]=nil end
    if record[1] == "worker-robots-speed-6" then new_prerequisites_table["quantum-age"][index]=nil end
  end
  new_prerequisites_table["quantum-age"] = ei_lib.clean_nils(new_prerequisites_table["quantum-age"])
end

numbered_buffs = {
    "stronger-explosives-7",
    "mining-productivity-4",
    "research-speed-6",
    "worker-robots-speed-6",
    "worker-robots-storage-3",
    "laser-weapons-damage-7",
    "physical-projectile-damage-7",
    "refined-flammables-7",
    "inserter-capacity-bonus-7",
    "braking-force-7",
    "laser-shooting-speed-7",
    "weapon-shooting-speed-6",
    "follower-robot-count-5"
}

local prereqs_to_remove = {}

function make_numbered_buff_prerequisite(tech)

    -- get last char of tech name as number
    local tech_number = tonumber(string.sub(tech, -1))

    if tech_number == 1 then
        return 
    end

    -- get previous tech name by removing last char
    local pre = tonumber(tech_number - 1)
    local previous_tech = string.sub(tech, 1, -2)..tostring(pre)

    if not data.raw["technology"][previous_tech] then
        return
    end

    -- add previous tech to prerequisites, if it not already is there
    if not ei_lib.table_contains_value(data.raw["technology"][tech].prerequisites, previous_tech) then
        table.insert(data.raw["technology"][tech].prerequisites, previous_tech)
    end

    -- remove the age tech prerequisite if the previous tech and this tech share the same age
    if data.raw["technology"][tech].age and data.raw["technology"][previous_tech].age then

        if data.raw["technology"][tech].age == data.raw["technology"][previous_tech].age then

            -- check if this tech has the age tech as prerequisite
            local age_tech = ei_data.tech_ages_with_sub_reverse[data.raw["technology"][tech].age]

            if ei_lib.table_contains_value(data.raw["technology"][tech].prerequisites, age_tech) then
                table.insert(prereqs_to_remove, {tech, age_tech})
            end

            -- also check if the main age tech is in the previous techs prerequisites
            if ei_data.sub_age[data.raw["technology"][tech].age] then

                local main_age_tech = ei_data.tech_ages_with_sub_reverse[ei_data.sub_age[data.raw["technology"][tech].age]]

                if ei_lib.table_contains_value(data.raw["technology"][previous_tech].prerequisites, main_age_tech) then
                    table.insert(prereqs_to_remove, {previous_tech, main_age_tech})
                end

            end

        end

    end

    make_numbered_buff_prerequisite(previous_tech)

end

data.raw["technology"]["steel-processing"].icon = ei_graphics_tech_path.."steel-processing.png"
data.raw["technology"]["fluid-handling"].icon = ei_graphics_tech_path.."barreling.png"
data.raw["technology"]["fluid-handling"].icon_size = 256

table.insert(data.raw["technology"]["engine"].effects, {
    type = "unlock-recipe",
    recipe = "pump"
})

table.insert(data.raw["technology"]["lamp"].effects, {
    type = "unlock-recipe",
    recipe = "radar"
})

table.insert(data.raw["technology"]["automation-2"].effects, {
    type = "unlock-recipe",
    recipe = "ei_ceramic"
})

ei_lib.remove_unlock_recipe("rocket-silo", "rocket-part")

table.insert(data.raw["technology"]["rocket-silo"].effects, {
    type = "unlock-recipe",
    recipe = "ei_rocket__nauvis-orbit"
})

data.raw["technology"]["electronics"].effects = {
    {
        type = "unlock-recipe",
        recipe = "ei_electron-tube"
    },
    {
        type = "unlock-recipe",
        recipe = "electronic-circuit"
    },
    {
        type = "unlock-recipe",
        recipe = "copper-cable"
    },
    {
        type = "unlock-recipe",
        recipe = "ei_ceramic__steam-assembler"
    },
}

-- remove vanilla steel recipe from tech effects
ei_lib.remove_unlock_recipe("steel-processing", "steel-plate")
ei_lib.remove_unlock_recipe("fluid-handling", "storage-tank")
ei_lib.remove_unlock_recipe("fluid-handling", "pump")
ei_lib.remove_unlock_recipe("automation", "long-handed-inserter")
ei_lib.remove_unlock_recipe("oil-processing", "oil-refinery")
ei_lib.remove_unlock_recipe("oil-processing", "basic-oil-processing")
ei_lib.remove_unlock_recipe("oil-processing", "solid-fuel-from-petroleum-gas")
ei_lib.remove_unlock_recipe("advanced-oil-processing", "advanced-oil-processing")

-- edit electric enigne tech to use only steam age science for progression
data.raw["technology"]["electric-engine"].unit.ingredients = ei_data.science["steam-age"]

-- make inserter-capaity-bonus-1 buff normal inserters
data.raw["technology"]["inserter-capacity-bonus-1"].effects = {
    {
        type = "inserter-stack-size-bonus",
        modifier = 1
    }
}

--HIDE FOR LATER USE
------------------------------------------------------------------------------------------------------

-- logistic
data.raw["recipe"]["inserter"].enabled = false
data.raw["recipe"]["small-electric-pole"].enabled = false

data.raw["recipe"]["pipe-to-ground"].enabled = false

-- machines
data.raw["recipe"]["boiler"].enabled = false
data.raw["recipe"]["offshore-pump"].enabled = false
data.raw["recipe"]["lab"].enabled = false

-- intermediates
data.raw["recipe"]["copper-cable"].enabled = false
data.raw["recipe"]["iron-stick"].hidden = true
data.raw["recipe"]["automation-science-pack"].hidden = true
data.raw["recipe"]["steel-plate"].hidden = true

-- military
data.raw["recipe"]["radar"].enabled = false


data.raw["recipe"]["pipe"].enabled = false
data.raw["recipe"]["steam-engine"].enabled = false
data.raw["recipe"]["electric-mining-drill"].enabled = false
data.raw["recipe"]["iron-gear-wheel"].enabled = false
data.raw["recipe"]["electronic-circuit"].enabled = false
data.raw["recipe"]["repair-pack"].enabled = false

--FUEL CATEGORIES
------------------------------------------------------------------------------------------------------

-- introduce diesel and rocket fuels
data.raw["item"]["rocket-fuel"].fuel_categories = {"ei_rocket-fuel"}
-- data.raw["item"]["nuclear-fuel"].fuel_categories = {"ei_rocket-fuel"}

--ITEM SUBGROUPS
------------------------------------------------------------------------------------------------------

-- move iron and copper plates to plates subgroup
data.raw["item"]["iron-plate"].subgroup = "ei_refining-plate"
data.raw["item"]["iron-plate"].order = "a1"
data.raw["item"]["copper-plate"].subgroup = "ei_refining-plate"
data.raw["item"]["copper-plate"].order = "a2"

-- set train, cargo wagon, fluid wagon and artillery wagon to new ei_trains subgroup
data.raw["item-with-entity-data"]["locomotive"].subgroup = "ei_trains"
data.raw["item-with-entity-data"]["locomotive"].order = "c1"
data.raw["item-with-entity-data"]["cargo-wagon"].subgroup = "ei_trains"
data.raw["item-with-entity-data"]["cargo-wagon"].order = "c2"
data.raw["item-with-entity-data"]["fluid-wagon"].subgroup = "ei_trains"
data.raw["item-with-entity-data"]["fluid-wagon"].order = "c3"
data.raw["item-with-entity-data"]["artillery-wagon"].subgroup = "ei_trains"
data.raw["item-with-entity-data"]["artillery-wagon"].order = "c4"

data.raw["item"]["steel-plate"].subgroup = "ei_refining-beam"
data.raw["item"]["steel-plate"].order = "a3"

data.raw["item"]["lab"].subgroup = "ei_labs"
data.raw["item"]["lab"].order = "a2"

data.raw["fluid"]["lubricant"].order = "a[fluid]-d[lubricant]"

--OTHER
------------------------------------------------------------------------------------------------------

-- set new steel-plate icon
data.raw["item"]["steel-plate"].icon = ei_graphics_item_path.."steel-plate.png"

-- set fluid burn values for crude, light, heavy - oil and petrol
data.raw["fluid"]["crude-oil"].fuel_value = "150kJ"
data.raw["fluid"]["heavy-oil"].fuel_value = "100kJ"
data.raw["fluid"]["light-oil"].fuel_value = "100kJ"
data.raw["fluid"]["petroleum-gas"].fuel_value = "400kJ"


-- make locomotive use diesel and rocket fuel
-- add burnt fuel slot
data.raw["locomotive"]["locomotive"].energy_source.fuel_categories = {
    "ei_diesel-fuel",
    "ei_rocket-fuel"
}

data.raw["locomotive"]["locomotive"].localised_name = {"entity-name.ei_locomotive"}
-- data.raw["locomotive"]["locomotive"].burner.burnt_inventory_size = 1

-- make oil-refinery heat based
data.raw["assembling-machine"]["oil-refinery"].energy_source = {
    type = 'heat',
    max_temperature = 275,
    min_working_temperature = 185,
    specific_heat = ei_data.specific_heat,
    max_transfer = '10MW',
    connections = {
        {position = {-2.3, 0}, direction = defines.direction.west},
        {position = {-2.3, 1}, direction = defines.direction.west},
        {position = {-2.3, -1}, direction = defines.direction.west},
        -- {position = {0,1.4}, direction = defines.direction.south},
        {position = {2.3, 0}, direction = defines.direction.east},
        {position = {2.3, 1}, direction = defines.direction.east},
        {position = {2.3, -1}, direction = defines.direction.east},
        -- {position = {-1.5,0}, direction = defines.direction.west}
    }
}

-- make pump not use energy
data.raw["pump"]["pump"].energy_source = {
    type = 'void'
}

-- make burner inserter be able to fuel leech
data.raw["inserter"]["burner-inserter"].allow_burner_leech = true

-- make electric engine unit craft category be crafting
data.raw["recipe"]["electric-engine-unit"].category = "crafting"

-- make underground pipes longer, read from setting
data.raw["pipe-to-ground"]["pipe-to-ground"].fluid_box.pipe_connections = {
    {
        direction=defines.direction.north,
        position = {
            0,
            0
        }
    },
    {
        connection_type = "underground",
        max_underground_distance = ei_lib.config("pipe-to-ground__length"),
        direction=defines.direction.south,
        position = {
            0,
            0
        }
    }
}

-- add handcrafting crafting category to player
table.insert(data.raw["character"]["character"].crafting_categories, "ei_handcrafting")

-- swap vanilla hr and normal reactor sprites with ei ones
-- also swap reactor lights
data.raw["reactor"]["nuclear-reactor"].picture.layers[1].filename = ei_graphics_entity_path.."hr-reactor.png"
data.raw["reactor"]["nuclear-reactor"].working_light_picture.filename = ei_graphics_entity_path.."hr-reactor-lights-color.png"

-- add fluidbox to centrifuge
data.raw["assembling-machine"]["centrifuge"].fluid_boxes_off_when_no_fluid_recipe = true
data.raw["assembling-machine"]["centrifuge"].fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = ei_pipe_centrifuge,
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections = {
            {flow_direction = "input", direction = defines.direction.east, position = {1, 0}}
        },
        secondary_draw_orders = {north = -1}
    },
    {
        production_type = "output",
        pipe_picture = ei_pipe_centrifuge,
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections = {
            {flow_direction = "output", direction = defines.direction.west, position = {-1, 0}}
        },
        secondary_draw_orders = {north = -1}
    }
}
data.raw["assembling-machine"]["centrifuge"].fluid_boxes_off_when_no_fluid_recipe = true

-- remove neighbour bonus from nuclear reactor and set fuel category to ei_nuclear_fuel
-- also set energy output to 100MW (setting)

data.raw["reactor"]["nuclear-reactor"].energy_source.fuel_categories = {"ei_nuclear-fuel"}
data.raw["reactor"]["nuclear-reactor"].energy_source.effectivity = 2
if ei_lib.config("nuclear-reactor__remove-bonus") then
    data.raw["reactor"]["nuclear-reactor"].neighbour_bonus = 0
end
data.raw["reactor"]["nuclear-reactor"].consumption = ei_lib.config("nuclear-reactor__energy-output")

-- buff solar panel power output and set fast_replaceable_group/next_upgrade
data.raw["solar-panel"]["solar-panel"].production = "80kW"
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "solar-panel"
data.raw["solar-panel"]["solar-panel"].next_upgrade = "ei_solar-panel-2"

-- buff accumulator capacity, max in and output
data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "7.5MJ"

-- sort fission reactor into nuclear tab
data.raw["item"]["nuclear-reactor"].subgroup = "ei_nuclear-buildings"
data.raw["item"]["nuclear-reactor"].order = "b-a"

-- increase size of rocket reulst inventory
data.raw["rocket-silo"]["rocket-silo"].rocket_result_inventory_size = 10
-- data.raw["item"]["satellite"].rocket_launch_product = {"ei_space-data", 500}

-- change rocket silo description
data.raw["item"]["rocket-silo"].localised_description = {"item-description.ei_rocket-silo"}

-- set fast replaceable group for chem plant
data.raw["assembling-machine"]["chemical-plant"].fast_replaceable_group = "chemical-plant"

-- make mining radius of burner mining drill 
data.raw["mining-drill"]["burner-mining-drill"].radius_visualisation_picture = data.raw["mining-drill"]["electric-mining-drill"].radius_visualisation_picture
data.raw["mining-drill"]["burner-mining-drill"].resource_searching_radius = 2
data.raw["mining-drill"]["electric-mining-drill"].resource_searching_radius = 3.5
data.raw["mining-drill"]["electric-mining-drill"].fast_replaceable_group = "electric-mining-drill"
data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = "ei_advanced-electric-mining-drill"

-- turn spidertron into a burner vehicle
for _, spider in pairs(data.raw["spider-vehicle"]) do
    spider.energy_source = {
        type = "burner",
        fuel_categories = {"chemical", "ei_nuclear-fuel", "ei_fusion-fuel"},
        effectivity = 1,
        fuel_inventory_size = 3,
        burnt_inventory_size = 3,
    }
    spider.movement_energy_consumption = "1.0MW"
end

-- get all of EIs items with ei_nuclear-fuel as fuel category
local nuclear_fuel_items = {}
for _,item in pairs(data.raw["item"]) do
    if item.fuel_category == "ei_nuclear-fuel" then
        table.insert(nuclear_fuel_items, item.name)
    end
end

-- add a movement and acceleration bonus
for _, item in ipairs(nuclear_fuel_items) do
    data.raw["item"][item].fuel_acceleration_multiplier = 1.5
    data.raw["item"][item].fuel_top_speed_multiplier = 1.5
end

-- improve movement speed bonus on stone-bricks, concrete and refined-concrete

data.raw["tile"]["stone-path"].walking_speed_modifier = 1.6
data.raw["tile"]["concrete"].walking_speed_modifier = 1.8
data.raw["tile"]["hazard-concrete-left"].walking_speed_modifier = 1.8
data.raw["tile"]["refined-concrete"].walking_speed_modifier = 2.2
data.raw["tile"]["refined-hazard-concrete-left"].walking_speed_modifier = 2.2

-- improve damage per bullet of firearm-magazine and piercing-rounds-magazine

data.raw["ammo"]["firearm-magazine"].ammo_type = {
    action = {
      {
        action_delivery = {
          {
            source_effects = {
              {
                entity_name = "explosion-gunshot",
                type = "create-explosion"
              }
            },
            target_effects = {
              {
                entity_name = "explosion-hit",
                offset_deviation = {
                  {
                    -0.5,
                    -0.5
                  },
                  {
                    0.5,
                    0.5
                  }
                },
                offsets = {
                  {
                    0,
                    1
                  }
                },
                type = "create-entity"
              },
              {
                damage = {
                  amount = 8,
                  type = "physical"
                },
                type = "damage"
              }
            },
            type = "instant"
          }
        },
        type = "direct"
      }
    },
}

data.raw["ammo"]["piercing-rounds-magazine"].ammo_type = {
    action = {
      action_delivery = {
        source_effects = {
          entity_name = "explosion-gunshot",
          type = "create-explosion"
        },
        target_effects = {
          {
            entity_name = "explosion-hit",
            offset_deviation = {
              {
                -0.5,
                -0.5
              },
              {
                0.5,
                0.5
              }
            },
            offsets = {
              {
                0,
                1
              }
            },
            type = "create-entity"
          },
          {
            damage = {
              amount = 13,
              type = "physical"
            },
            type = "damage"
          }
        },
        type = "instant"
      },
      type = "direct"
    },
}

-- alter all projectiles with the cannon-shell category to only collide with enemies

local cannon_shell_projectiles = {
    "cannon-projectile",
    "explosive-cannon-projectile",
    "explosive-uranium-cannon-projectile",
    "uranium-cannon-projectile",
}

-- make walls resist explosive damage so explosive cannon shells can't destroy them
table.insert(data.raw["wall"]["stone-wall"].resistances,
{
    type = "explosion",
    decrease = 0,
    percent = 100
}
)

-- change name of rocket silo
data.raw["rocket-silo"]["rocket-silo"].localised_name = {"entity-name.ei_rocket-silo"}
data.raw["item"]["rocket-silo"].localised_name = {"entity-name.ei_rocket-silo"}

for _,projectile in ipairs(cannon_shell_projectiles) do
    data.raw["projectile"][projectile].force_condition = "not-same"

    -- add the force condition to the action delivery
    if data.raw["projectile"][projectile].action then
        if data.raw["projectile"][projectile].action.action_delivery then
            
            -- loop over all trigger items and if contains damage set force
            for _,triggeritem in ipairs(data.raw["projectile"][projectile].action.action_delivery.target_effects) do
                if triggeritem.type == "damage" then
                    triggeritem.force = "not-same"
                end
            end

        end
    end

    -- do the same for final_action
    if data.raw["projectile"][projectile].final_action then
        if data.raw["projectile"][projectile].final_action.action_delivery then
            
            -- loop over all trigger items and if contains damage set force
            for _,triggeritem in ipairs(data.raw["projectile"][projectile].final_action.action_delivery.target_effects) do
                if triggeritem.type == "damage" then
                    triggeritem.force = "not-same"
                end

                if triggeritem.type == "nested-result" then
                    for _,nestedtriggeritem in ipairs(triggeritem.action.action_delivery.target_effects) do
                        if nestedtriggeritem.type == "damage" then
                            nestedtriggeritem.force = "not-same"
                        end
                    end
                end

            end

        end
    end

end

-- increase power output of fusion reactor equipment

data.raw["generator-equipment"]["fission-reactor-equipment"].power = "1MW"
data.raw["generator-equipment"]["fission-reactor-equipment"].burner = {
    type = "burner",
    fuel_categories = {"ei_nuclear-fuel"},
    effectivity = 0.05,
    fuel_inventory_size = 3,
    burnt_inventory_size = 3,
}
data.raw["generator-equipment"]["fission-reactor-equipment"].energy_source.usage_priority = "secondary-output"
data.raw["item"]["fission-reactor-equipment"].order = "a[energy-source]-g[fission-reactor-equipment]"


-- hide unused items
local unused_items = {
    "iron-ore",
    "copper-ore",
    "uranium-ore",
    "automation-science-pack",
    "logistic-science-pack",
    "military-science-pack",
    "chemical-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    --"uranium-235",
    --"uranium-238",
    "nuclear-fuel",
    "uranium-fuel-cell",
    "used-up-uranium-fuel-cell",
    "iron-stick",
    "iron-gear-wheel",
    "beacon",
}

if mods['space-exploration'] then 
  log("SE detected, items unused by EI will not be hidden") 
  unused_items = {}
end

for _,item in ipairs(unused_items) do
    if data.raw["item"][item] then
        data.raw["item"][item].hidden = true
    elseif data.raw["tool"][item] then
        data.raw["tool"][item].hidden = true
    else
        log("item "..item.." not found for hidding")
    end
end

-- sort uranium 235/238 in the nuclear tab
data.raw["item"]["uranium-235"].subgroup = "ei_nuclear-processing"
data.raw["item"]["uranium-235"].order = "a-a-a"

data.raw["item"]["uranium-238"].subgroup = "ei_nuclear-processing"
data.raw["item"]["uranium-238"].order = "a-a-b"

-- let vanilla modules use new textures (prod, speed and effectivity modules)
data.raw.module["productivity-module"].icon = ei_graphics_item_path .. "productivity-module.png"
data.raw.module["productivity-module-2"].icon = ei_graphics_item_path .. "productivity-module-2.png"
data.raw.module["productivity-module-3"].icon = ei_graphics_item_path .. "productivity-module-3.png"

data.raw.module["speed-module"].icon = ei_graphics_item_path .. "speed-module.png"
data.raw.module["speed-module-2"].icon = ei_graphics_item_path .. "speed-module-2.png"
data.raw.module["speed-module-3"].icon = ei_graphics_item_path .. "speed-module-3.png"

data.raw.module["efficiency-module"].icon = ei_graphics_item_path .. "effectivity-module.png"
data.raw.module["efficiency-module-2"].icon = ei_graphics_item_path .. "effectivity-module-2.png"
data.raw.module["efficiency-module-3"].icon = ei_graphics_item_path .. "effectivity-module-3.png"

-- nerf vanilla modules a bit
data.raw.module["productivity-module"].effect = {
    productivity = 0.03,
    --consumption = 0.3,
    pollution = 0.05,
    speed = -0.05
}
data.raw.module["productivity-module-2"].effect = {
    productivity = 0.05,
    consumption = 0.2,
    pollution = 0.07,
    speed = -0.1
}
data.raw.module["productivity-module-3"].effect = {
    productivity = 0.07,
    consumption = 0.4,
    pollution = 0.15,
    speed = -0.2
}

data.raw.module["speed-module"].effect = {
    consumption = 0.1,
    speed = 0.3
}

data.raw.module["speed-module-2"].effect = {
    consumption = 0.2,
    speed = 0.4
}

data.raw.module["speed-module-3"].effect = {
    consumption = 0.3,
    speed = 0.5
}

-- remove the ignore_tech_multiplier from all techs
-- increase bot speed buff in speed techs by 15 percent each
for _,tech in pairs(data.raw.technology) do
    tech.ignore_tech_cost_multiplier = false

    if tech.effects then
        for _,effect in ipairs(tech.effects) do
            if effect.type == "worker-robot-speed" then
                effect.modifier = effect.modifier + 0.1
            end
        end
    end

end

-- add sim data to requester, buffer and active provider chests
if mods["exotic-industries-containers"] then
    ei_lib.recipe_add("ei_1x1-container_blue", "ei_simulation-data", 10)
    ei_lib.recipe_add("ei_1x1-container_green", "ei_simulation-data", 10)
    ei_lib.recipe_add("ei_1x1-container_pink", "ei_simulation-data", 10)

    ei_lib.recipe_add("ei_2x2-container_blue", "ei_simulation-data", 20)
    ei_lib.recipe_add("ei_2x2-container_green", "ei_simulation-data", 20)
    ei_lib.recipe_add("ei_2x2-container_pink", "ei_simulation-data", 20)

    ei_lib.recipe_add("ei_6x6-container_blue", "ei_simulation-data", 40)
    ei_lib.recipe_add("ei_6x6-container_green", "ei_simulation-data", 40)
    ei_lib.recipe_add("ei_6x6-container_pink", "ei_simulation-data", 40)
else
    ei_lib.recipe_add("requester-chest", "ei_simulation-data", 10)
    ei_lib.recipe_add("buffer-chest", "ei_simulation-data", 10)
    ei_lib.recipe_add("active-provider-chest", "ei_simulation-data", 10)
end

-- change description of rocket-silo tech and steel-plate
data.raw.technology["rocket-silo"].localised_description = {"technology-description.ei_rocket-silo"}
data.raw.item["steel-plate"].localised_name = {"item-name.ei_steel-plate"}

-- add 2 more module slots to rocket silo
data.raw["rocket-silo"]["rocket-silo"].module_slots = 8

data.raw["recipe"]["heavy-oil-cracking"].localised_name = {"recipe-name.ei_heavy-oil-cracking"}


-- use mk2 armor sprite for bio armor
for _, animation in ipairs(data.raw["character"]["character"]["animations"]) do
    if animation.armors then
        for _, armor in ipairs(animation.armors) do
            if armor == "power-armor-mk2" then
                animation.armors[#animation.armors + 1] = "ei_bio-armor"
                break
            end
            --[[
            if armor == "light-armor" then
                animation.armors[#animation.armors + 1] = "pamk3-lvest"
                break
            end
            if armor == "heavy-armor" then
                animation.armors[#animation.armors + 1] = "pamk3-hvest"
                break
            end
            ]]
        end
    end
end


-- set next upgrade of express belt, splitter and underground to ei_neo-belt
data.raw["transport-belt"]["express-transport-belt"].next_upgrade = "ei_neo-belt"
data.raw["splitter"]["express-splitter"].next_upgrade = "ei_neo-splitter"
data.raw["underground-belt"]["express-underground-belt"].next_upgrade = "ei_neo-underground-belt"


-- set localised descriptions
data.raw["item"]["burner-inserter"].localised_description = {"item-description.ei_burner-inserter"}
data.raw["item"]["oil-refinery"].localised_description = {"item-description.ei_oil-refinery"}

-- set localised name of ores to ei ones
data.raw["resource"]["iron-ore"].localised_name = {"item-name.ei_poor-iron-chunk"}
data.raw["resource"]["copper-ore"].localised_name = {"item-name.ei_poor-copper-chunk"}


-- change barrels to stack only to 1 but hold 10xsettings multiplicator more
for i,item in pairs(data.raw["item"]) do
    -- if item name ends on -barrel
    if string.sub(item.name, -7) == "-barrel" then
        item.stack_size = 1
    
        local fluid = string.sub(item.name, 1, -8)

        -- find barreling and unbarreling recipes and change fluid in/out
        for _,recipe in pairs(data.raw["recipe"]) do

            if recipe.name == item.name then
                recipe.ingredients = {
                    {type = "fluid", name = fluid, amount = 500*ei_lib.config("barrel__multiplier")},
                    {type = "item", name = "barrel", amount = 1}
                }
            end

            if recipe.name == "empty-"..item.name then
                recipe.results = {
                    {type = "fluid", name = fluid, amount = 500*ei_lib.config("barrel__multiplier")},
                    {type = "item", name = "barrel", amount = 1}
                }
            end

        end
    end

end


--====================================================================================================
--FUNCTION STUFF
--====================================================================================================

-- loop over new_ingredients_table and set new ingredients for indexed recipes
for i,v in pairs(new_ingredients_table) do
    ei_lib.recipe_new(i, v)
end

-- loop over new_prerequisites_table and add new prerequisites for indexed technologies
-- if so remove the age tech as prerequisiter
for age,table_in in pairs(new_prerequisites_table) do
    for i,v in pairs(table_in) do
        ei_lib.add_prerequisite(v[1], v[2])
        ei_lib.remove_prerequisite(v[1], "ei_"..age)
    end
end

for _, tech in ipairs(numbered_buffs) do
    make_numbered_buff_prerequisite(tech)
end

for i,v in ipairs(prereqs_to_remove) do
    ei_lib.remove_prerequisite(v[1], v[2])
end

--HIDE VANILLA TECHNOLOGIES

for _, tech in ipairs(ei_data.technologies_to_remove) do
    ei_lib.remove_tech(tech)
end

ei_lib.add_unlock_recipe("oil-processing", "pumpjack")
data.raw["recipe"]["repair-pack"].enabled = true;
