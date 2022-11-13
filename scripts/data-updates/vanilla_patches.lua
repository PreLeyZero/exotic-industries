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

-- set furnace result inv to 2
for i,v in pairs(data.raw["furnace"]) do
    data.raw["furnace"][i].result_inventory_size = 2
end

--LABS
------------------------------------------------------------------------------------------------------

data.raw["lab"]["lab"].inputs = ei_data.lab_inputs["lab"]

--RECIPES
------------------------------------------------------------------------------------------------------

-- overwrite table for vanilla recipes
-- index is recipe name, value is table with new recipe data
local new_ingredients_table = {
    ["iron-plate"] = {
        {"ei_iron-ingot", 1}
    },
    ["copper-plate"] = {
        {"ei_copper-ingot", 1}
    },
    ["transport-belt"] = {
        {"iron-plate", 1},
        {"ei_iron-mechanical-parts", 2}
    },
    ["burner-inserter"] = {
        {"iron-plate", 1},
        {"ei_copper-mechanical-parts", 2}
    },
    ["repair-pack"] = {
        {"ei_copper-mechanical-parts", 3},
        {"ei_iron-mechanical-parts", 3} 
    },
    ["iron-chest"] = {
        {"iron-plate", 8},
        {"ei_iron-beam", 2} 
    },
    ["gun-turret"] = {
        {"iron-plate", 5},
        {"ei_iron-mechanical-parts", 5},
        {"ei_copper-mechanical-parts", 5}
    },
    ["heavy-armor"] = {
        {"iron-plate", 40},
        {"ei_iron-beam", 10},
        {"ei_copper-beam", 10}
    },
    ["stone-wall"] = {
        {"stone-brick", 3},
        {"ei_iron-beam", 1} 
    },
    ["offshore-pump"] = {
        {"ei_copper-mechanical-parts", 4},
        {"ei_iron-beam", 2},
        {"pipe", 2}
    },
    ["train-stop"] = {
        {"ei_iron-beam", 2},
        {"ei_iron-mechanical-parts", 2},
        {"copper-plate", 2}
    },
    ["rail-signal"] = {
        {"ei_copper-mechanical-parts", 1},
        {"iron-plate", 1}
    },
    ["rail-chain-signal"] = {
        {"ei_copper-mechanical-parts", 1},
        {"iron-plate", 1}
    },
    ["steel-furnace"] = {
        {"steel-plate", 4},
        {"stone-brick", 10},
        {"stone-furnace", 1}
    },
    ["gate"] = {
        {"stone-wall", 1},
        {"ei_iron-beam", 2},
        {"ei_copper-mechanical-parts", 4}
    },
    ["oil-refinery"] = {
        {"pipe", 10},
        {"ei_copper-beam", 20},
        {"steel-plate", 15},
        {"ei_steel-mechanical-parts", 10},
        {"stone-brick", 10}
    },
    ["engine-unit"] = {
        {"ei_steam-engine", 1},
        {"ei_copper-mechanical-parts", 1},
        {"ei_iron-mechanical-parts", 1}
    },
    ["lab"] = {
        {"ei_dark-age-lab", 1},
        {"ei_copper-mechanical-parts", 10},
        {"ei_iron-mechanical-parts", 10},
        {"electronic-circuit", 10}
    },
    ["electric-engine-unit"] = {
        {"engine-unit", 1},
        {"copper-cable", 4},
        {"ei_iron-mechanical-parts", 2}
    },
    ["steam-engine"] = {
        {"pipe", 5},
        {"electric-engine-unit", 4},
        {"ei_steam-engine", 4},
        {"ei_iron-beam", 2}
    },
    ["inserter"] = {
        {"electric-engine-unit", 1},
        {"burner-inserter", 1},
        {"electronic-circuit", 2}
    },
    ["medium-electric-pole"] = {
        {"ei_copper-beam", 4},
        {"ei_iron-mechanical-parts", 2},
        {"ei_insulated-wire", 2}
    },
    ["big-electric-pole"] = {
        {"steel-plate", 8},
        {"ei_iron-mechanical-parts", 2},
        {"ei_insulated-wire", 4}
    },
    ["substation"] = {
        {"steel-plate", 6},
        {"ei_insulated-wire", 6},
        {"electronic-circuit", 6},
        {"concrete", 50}
    },
    ["concrete"] = {
        {"ei_poor-iron-chunk", 5},
        {"stone-brick", 10},
        {"ei_sand", 4}
    },
    ["assembling-machine-1"] = {
        {"electronic-circuit", 2},
        {"electric-engine-unit", 2},
        {"ei_iron-beam", 2},
        {"ei_copper-mechanical-parts", 4}
    },
    ["chemical-plant"] = {
        {"ei_heat-chemical-plant", 1},
        {"electronic-circuit", 2},
        {"electric-engine-unit", 2},
    },
    ["roboport"] = {
        {"advanced-circuit", 45},
        {"concrete", 50},
        {"ei_steel-mechanical-parts", 45},
        {"steel-plate", 45}
    },
    ["logistic-robot"] = {
        {"advanced-circuit", 4},
        {"steel-plate", 4},
        {"flying-robot-frame", 1}
    },
    ["construction-robot"] = {
        {"electronic-circuit", 4},
        {"steel-plate", 4},
        {"flying-robot-frame", 1}
    },
    ["modular-armor"] = {
        {"advanced-circuit", 25},
        {"heavy-armor", 10},
        {"iron-plate", 25},
    },
    ["exoskeleton-equipment"] = {
        {"ei_steel-mechanical-parts", 10},
        {"advanced-circuit", 10},
        {"electric-engine-unit", 25},
    },
    ["discharge-defense-equipment"] = {
        {"advanced-circuit", 10},
        {"steel-plate", 10},
        {"ei_insulated-wire", 45},
    },
    ["power-armor"] = {
        {"modular-armor", 2},
        {"electric-engine-unit", 40},
        {"advanced-circuit", 40},
        {"ei_energy-crystal", 100},
    },
    ["energy-shield-equipment"] = {
        {"advanced-circuit", 10},
        {"steel-plate", 10},
        {"ei_energy-crystal", 25},
    },
    ["personal-laser-defense-equipment"] = {
        {"laser-turret", 6},
        {"steel-plate", 10},
        {"ei_energy-crystal", 25},
    },
    ["laser-turret"] = {
        {"steel-plate", 20},
        {"advanced-circuit", 10},
        {"battery", 12},
        {"ei_energy-crystal", 10},
    },
    ["solar-panel"] = {
        {"ei_semiconductor", 1},
        {"steel-plate", 5},
        {"electronic-circuit", 4},
    },
    ["electric-furnace"] = {
        {"concrete", 25},
        {"ei_steel-mechanical-parts", 15},
        {"advanced-circuit", 10},
        {"steel-furnace", 1},
    },
    ["radar"] = {
        {"electronic-circuit", 5},
        {"steel-plate", 6},
        {"ei_iron-mechanical-parts", 10},
        {"electric-engine-unit", 4},
    },
    ["electric-mining-drill"] = {
        {"electric-engine-unit", 4},
        {"electronic-circuit", 4},
        {"ei_iron-beam", 3},
        {"ei_iron-mechanical-parts", 5},
    },
    ["storage-tank"] = {
        {"steel-plate", 8},
        {"ei_iron-beam", 4},
        {"pipe", 4},
    },
    ["splitter"] = {
        {"transport-belt", 1},
        {"ei_iron-mechanical-parts", 5},
    },
    ["underground-belt"] = {
        {"transport-belt", 5},
        {"ei_iron-mechanical-parts", 10},
    },
    ["nuclear-reactor"] = {
        {"concrete", 250},
        {"ei_lead-plate", 150},
        {"advanced-circuit", 250},
        {"ei_energy-crystal", 100},
        {"steel-plate", 150},
        {"ei_fission-tech", 100},
    },
    ["heat-pipe"] = {
        {"ei_basic-heat-pipe", 1},
        {"ei_energy-crystal", 1},
        {"steel-plate", 5},
    },
    ["centrifuge"] = {
        {"advanced-circuit", 100},
        {"ei_steel-mechanical-parts", 50},
        {"ei_lead-plate", 50},
        {"electric-engine-unit", 50},
        {"ei_energy-crystal", 25},
    },
    ["steam-turbine"] = {
        {"pipe", 10},
        {"ei_steam-engine", 25},
        {"ei_steel-mechanical-parts", 50},
        {"copper-plate", 50},
    },
    ["accumulator"] = {
        {"steel-plate", 6},
        {"battery", 5},
        {"plastic-bar", 2},
    },
    ["stack-inserter"] = {
        {"ei_electronic-parts", 5},
        {"ei_steel-mechanical-parts", 20},
        {"fast-inserter", 1},
        {"ei_energy-crystal", 4},
    },
    ["effectivity-module"] = {
        {"ei_module-base", 1},
        {"ei_energy-crystal", 4},
    },
    ["productivity-module"] = {
        {"ei_module-base", 1},
        {"advanced-circuit", 4},
    },
    ["effectivity-module-2"] = {
        {"ei_simulation-data", 25},
        {"ei_module-base", 1},
        {"effectivity-module", 2},
    },
    ["productivity-module-2"] = {
        {"ei_simulation-data", 25},
        {"ei_module-base", 1},
        {"productivity-module", 2},
    },
    ["speed-module-2"] = {
        {"ei_simulation-data", 25},
        {"ei_module-base", 1},
        {"speed-module", 2},
    },
    ["assembling-machine-3"] = {
        {"assembling-machine-2", 2},
        {"electric-engine-unit", 20},
        {"ei_electronic-parts", 6},
    },
    ["processing-unit"] = {
        {"ei_cpu", 3},
        {"advanced-circuit", 20},
        {"ei_insulated-wire", 4},
        {"ei_simulation-data", 10},
    },
    ["effectivity-module-3"] = {
        {"processing-unit", 5},
        {"ei_module-base", 1},
        {"effectivity-module-2", 2},
    },
    ["productivity-module-3"] = {
        {"processing-unit", 5},
        {"ei_module-base", 1},
        {"productivity-module", 2},
    },
    ["speed-module-3"] = {
        {"processing-unit", 5},
        {"ei_module-base", 1},
        {"speed-module", 2},
    },
}

data.raw["recipe"]["iron-plate"].category = "crafting"
data.raw["recipe"]["iron-plate"].energy_required = 1

data.raw["recipe"]["copper-plate"].category = "crafting"
data.raw["recipe"]["copper-plate"].energy_required = 1

data.raw["recipe"]["burner-mining-drill"].normal.ingredients = {
    {"iron-plate", 3},
    {"ei_iron-mechanical-parts", 3},
    {"stone-furnace", 1}
}

data.raw["recipe"]["burner-mining-drill"].expensive.ingredients = {
    {"iron-plate", 3},
    {"ei_iron-mechanical-parts", 3},
    {"stone-furnace", 1}
}

data.raw["recipe"]["pipe"].normal.ingredients = {
    {"iron-plate", 1},
    {"ei_iron-beam", 1}
}

data.raw["recipe"]["pipe"].expensive.ingredients = {
    {"iron-plate", 2},
    {"ei_iron-beam", 2}
}

data.raw["recipe"]["electronic-circuit"].normal.ingredients = {
    {"ei_electron-tube", 1},
    {"copper-cable", 2},
    {"iron-plate", 1}
}

data.raw["recipe"]["electronic-circuit"].expensive.ingredients = {
    {"ei_electron-tube", 1},
    {"copper-cable", 2},
    {"iron-plate", 1}
}

data.raw["recipe"]["basic-oil-processing"].ingredients =
{
    {type="fluid", name="crude-oil", amount=100},
    {type="fluid", name="water", amount=20},
}
data.raw["recipe"]["basic-oil-processing"].results = 
{
    {type="fluid", name="ei_residual-oil", amount=55},
    {type="fluid", name="petroleum-gas", amount=45},
}

data.raw["recipe"]["sulfuric-acid"].ingredients = {
    {type="fluid", name="water", amount=100},
    {type="item", name="ei_crushed-iron", amount=2},
    {type="item", name="sulfur", amount=5}

}

-- treat red belts with plastic
data.raw["recipe"]["fast-transport-belt"].ingredients = {
    {type="item", name="transport-belt", amount=1},
    {type="item", name="ei_iron-mechanical-parts", amount=5},
    {type="item", name="plastic-bar", amount=2}
}
data.raw["recipe"]["fast-underground-belt"].ingredients = {
    {type="item", name="underground-belt", amount=2},
    {type="item", name="ei_iron-mechanical-parts", amount=30},
    {type="item", name="plastic-bar", amount=6}
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
    {type="fluid", name="sulfuric-acid", amount=25}
})
data.raw["recipe"]["advanced-circuit"].category = "crafting-with-fluid"

-- batteries
ei_lib.recipe_new("battery",
{
    {type="item", name="ei_crushed-iron", amount=6},
    {type="item", name="ei_crushed-copper", amount=6},
    {type="item", name="ei_ceramic", amount=2},
    {type="fluid", name="sulfuric-acid", amount=45}
})

-- robo frames
data.raw["recipe"]["flying-robot-frame"].category = "crafting-with-fluid"
ei_lib.recipe_new("flying-robot-frame",
{
    {"electric-engine-unit", 4},
    {"battery", 2},
    {"advanced-circuit", 5},
    {"ei_steel-mechanical-parts", 10},
    {"ei_energy-crystal", 1},
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

-- recipes for modules
data.raw["recipe"]["speed-module"].category = "crafting-with-fluid"
ei_lib.recipe_new("speed-module",
{
    {"ei_module-base", 1},
    {type="fluid", name="ei_liquid-nitrogen", amount=25}
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
    {"flammethrower", "steel-processing"},
    {"flammethrower", "engine"},
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
    {"optics", "ei_electricity-power"},
    {"laser", "optics"},
    {"laser-turret", "laser"},
    {"energy-weapons-damage-1", "laser"},
    {"energy-weapons-damage-2", "energy-weapons-damage-1"},
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
    {"robotics", "advanced-electronics"},
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
    {"advanced-electronics", "sulfur-processing"},
    {"advanced-electronics", "automation-2"},
    {"inserter-capacity-bonus-2", "lubricant"},
    {"construction-robotics", "concrete"},
    {"logistic-robotics", "concrete"},
    {"explosives", "sulfur-processing"},
    {"military-3", "explosives"},
    {"modular-armor", "advanced-electronics"},
    {"battery-equipment", "battery"},
    {"solar-panel-equipment", "solar-energy"},
    {"personal-laser-defense-equipment", "laser-turret"},
    {"laser", "ei_grower"},
    {"laser", "advanced-electronics"},
    {"personal-roboport-equipment", "modular-armor"},
    {"power-armor", "ei_grower"},
    {"solar-energy", "ei_waver-factory"},
    {"advanced-material-processing-2", "advanced-electronics"},
    {"advanced-material-processing-2", "concrete"},
    {"uranium-processing", "ei_deep-mining"},
    {"uranium-processing", "advanced-electronics"},
    {"uranium-processing", "ei_grower"},
    {"nuclear-power", "uranium-processing"},
    -- {"nuclear-fuel-processing", "nuclear-power"},
    {"uranium-ammo", "uranium-processing"},
    {"uranium-ammo", "tank"},
    
}

new_prerequisites_table["computer-age"] = {
    {"inserter-capacity-bonus-3", "stack-inserter"},
    {"inserter-capacity-bonus-4", "inserter-capacity-bonus-3"},
    {"speed-module", "modules"},
    {"speed-module-2", "speed-module"},
    {"speed-module-3", "speed-module-2"},
    {"speed-module-2", "ei_computer-core"},
    {"speed-module-3", "advanced-electronics-2"},
    {"productivity-module", "modules"},
    {"productivity-module-2", "productivity-module"},
    {"productivity-module-2", "ei_computer-core"},
    {"productivity-module-3", "productivity-module-2"},
    {"productivity-module-3", "advanced-electronics-2"},
    {"effectivity-module", "modules"},
    {"effectivity-module-2", "effectivity-module"},
    {"effectivity-module-3", "effectivity-module-2"},
    {"effectivity-module-2", "ei_computer-core"},
    {"effectivity-module-3", "advanced-electronics-2"},
    {"advanced-electronics-2", "ei_computer-core"},
    {"braking-force-7", "braking-force-6"},
    {"braking-force-6", "automation-3"},
    {"logistics-3", "automation-3"},
    {"mining-productivity-2", "automation-3"},
    {"stack-inserter", "automation-3"},
    {"logistic-system", "ei_computer-core"},
    {"personal-roboport-mk2-equipment", "logistic-system"},
    {"worker-robots-speed-3", "logistic-system"},
    {"worker-robots-speed-4", "worker-robots-speed-3"},
    {"worker-robots-storage-1", "logistic-system"},
    {"worker-robots-storage-2", "worker-robots-storage-1"},
    {"research-speed-3", "ei_big-lab"},
    {"research-speed-4", "research-speed-3"},
    {"artillery", "military-4"},
    {"spidertron", "military-4"},
    {"rocketry", "military-4"},
    {"explosive-rocketry", "rocketry"},
    {"artillery-shell-range-1", "artillery"},
    {"artillery-shell-speed-1", "artillery"},
    {"energy-weapons-damage-3", "military-4"},
    {"energy-weapons-damage-4", "energy-weapons-damage-3"},
    {"stronger-explosives-3", "military-4"},
    {"stronger-explosives-4", "stronger-explosives-3"},
    {"stronger-explosives-5", "stronger-explosives-4"},
    {"weapon-shooting-speed-3", "military-4"},
    {"weapon-shooting-speed-4", "weapon-shooting-speed-3"},
    {"weapon-shooting-speed-5", "weapon-shooting-speed-4"},
    {"weapon-shooting-speed-6", "weapon-shooting-speed-5"},
    {"refined-flammables-6", "refined-flammables-5"},
    {"stronger-explosives-3", "refined-flammables-5"},
    {"laser-shooting-speed-4", "military-4"},
    {"laser-shooting-speed-5", "laser-shooting-speed-4"},
    {"laser-shooting-speed-6", "laser-shooting-speed-5"},
    {"laser-shooting-speed-7", "laser-shooting-speed-6"},
    {"follower-robot-count-3", "military-4"},
    {"follower-robot-count-4", "follower-robot-count-3"},
    {"follower-robot-count-3", "logistic-system"},
    {"power-armor-mk2", "military-4"},
    {"energy-shield-mk2-equipment", "military-4"},
    {"battery-mk2-equipment", "military-4"},
    {"physical-projectile-damage-5", "military-4"},
    {"physical-projectile-damage-6", "physical-projectile-damage-5"},
    
}

data.raw["technology"]["steel-processing"].icon = ei_graphics_tech_path.."steel-processing.png"
data.raw["technology"]["fluid-handling"].icon = ei_graphics_tech_path.."barreling.png"
data.raw["technology"]["fluid-handling"].icon_size = 256

table.insert(data.raw["technology"]["engine"].effects, {
    type = "unlock-recipe",
    recipe = "pump"
})

table.insert(data.raw["technology"]["optics"].effects, {
    type = "unlock-recipe",
    recipe = "radar"
})

table.insert(data.raw["technology"]["automation-2"].effects, {
    type = "unlock-recipe",
    recipe = "ei_ceramic"
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
        recipe = "ei_ceramic:steam-assembler"
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
data.raw["recipe"]["steel-plate"].normal.hidden = true
data.raw["recipe"]["steel-plate"].expensive.hidden = true

-- military
data.raw["recipe"]["radar"].enabled = false

-- expensive/normal variants
data.raw["recipe"]["pipe"].normal.enabled = false
data.raw["recipe"]["pipe"].expensive.enabled = false
data.raw["recipe"]["steam-engine"].normal.enabled = false
data.raw["recipe"]["steam-engine"].expensive.enabled = false
data.raw["recipe"]["electric-mining-drill"].normal.enabled = false
data.raw["recipe"]["electric-mining-drill"].expensive.enabled = false
data.raw["recipe"]["iron-gear-wheel"].normal.enabled = false
data.raw["recipe"]["iron-gear-wheel"].expensive.enabled = false
data.raw["recipe"]["electronic-circuit"].normal.enabled = false
data.raw["recipe"]["electronic-circuit"].expensive.enabled = false

--FUEL CATEGORIES
------------------------------------------------------------------------------------------------------

-- introduce diesel and rocket fuels
data.raw["item"]["rocket-fuel"].fuel_category = "ei_rocket-fuel"
data.raw["item"]["nuclear-fuel"].fuel_category = "ei_rocket-fuel"

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

-- make diesel barrel a fuel
data.raw["item"]["ei_diesel-barrel"].fuel_category = "ei_diesel-fuel"
data.raw["item"]["ei_diesel-barrel"].fuel_value = "20MJ"
data.raw["item"]["ei_diesel-barrel"].burnt_result = "empty-barrel"

-- make locomotive use diesel and rocket fuel
-- add burnt fuel slot
data.raw["locomotive"]["locomotive"].burner.fuel_categories = {
    "ei_diesel-fuel",
    "ei_rocket-fuel"
}
data.raw["locomotive"]["locomotive"].burner.burnt_inventory_size = 1

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
        position = {
            0,
            -1
        }
    },
    {
        max_underground_distance = ei_lib.config("pipe-to-ground:length"),
        position = {
            0,
            1
        }
    }
}

-- add handcrafting crafting category to player
table.insert(data.raw["character"]["character"].crafting_categories, "ei_handcrafting")

-- swap vanilla hr and normal reactor sprites with ei ones
-- also swap reactor lights
data.raw["reactor"]["nuclear-reactor"].picture.layers[1].hr_version.filename = ei_graphics_entity_path.."hr-reactor.png"
data.raw["reactor"]["nuclear-reactor"].working_light_picture.hr_version.filename = ei_graphics_entity_path.."hr-reactor-lights-color.png"
-- non hr version
data.raw["reactor"]["nuclear-reactor"].picture.layers[1].filename = ei_graphics_entity_path.."reactor.png"
data.raw["reactor"]["nuclear-reactor"].working_light_picture.filename = ei_graphics_entity_path.."reactor-lights-color.png"

-- add fluidbox to centrifuge
data.raw["assembling-machine"]["centrifuge"].fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = ei_pipe_centrifuge,
        pipe_covers = pipecoverspictures(),
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_connections = {
            {position = {2, 0}}
        },
        secondary_draw_orders = {north = -1}
    },
    {
        production_type = "output",
        pipe_picture = ei_pipe_centrifuge,
        pipe_covers = pipecoverspictures(),
        base_area = 1,
        base_level = 1,
        height = 2,
        pipe_connections = {
            {position = {-2, 0}}
        },
        secondary_draw_orders = {north = -1}
    },
    off_when_no_fluid_recipe = true
}

-- remove neighbour bonus from nuclear reactor and set fuel category to ei_nuclear_fuel
-- also set energy output to 100MW (setting)

data.raw["reactor"]["nuclear-reactor"].energy_source.fuel_category = "ei_nuclear-fuel"
if ei_lib.config("nuclear-reactor:remove-bonus") then
    data.raw["reactor"]["nuclear-reactor"].neighbour_bonus = 0
end
data.raw["reactor"]["nuclear-reactor"].consumption = ei_lib.config("nuclear-reactor:energy-output")

-- buff solar panel power output and set fast_replaceable_group/next_upgrade
data.raw["solar-panel"]["solar-panel"].production = "150kW"
data.raw["solar-panel"]["solar-panel"].fast_replaceable_group = "ei_solar"
data.raw["solar-panel"]["solar-panel"].next_upgrade = "ei_solar-panel-2"

-- buff accumulator capacity, max in and output
data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "20MJ"
data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "3MW"
data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "3MW"


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