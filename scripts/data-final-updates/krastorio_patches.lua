-- changes to K2 mod

local ei_lib = require("lib.lib")
local ei_data = require("lib.data")
local matter = require("__Krastorio2__.lib.public.data-stages.matter-util")
local variations_util = require("__Krastorio2__.lib.public.data-stages.create-roboport-states")
local _td = table.deepcopy

--====================================================================================================
-- -- CHECK FOR MOD
--====================================================================================================

if not mods["Krastorio2"] then
    return
end

--CONSTANTS
------------------------------------------------------------------------------------------------------
local ei_medium_container, ei_big_container = 200, 1000
local ei_neo_speed = data.raw["transport-belt"]["transport-belt"].speed * 8

local function convertTypePrototype(name, old_type, new_type)
    if data.raw[old_type][name] then
        local new_prototype = table.deepcopy(data.raw[old_type][name])
        new_prototype.type = new_type
        data.raw[old_type][name] = nil
        data:extend({ new_prototype })
    end
end

--====================================================================================================
-- -- NEW PROTOTYPES
--====================================================================================================

--LOADERS
------------------------------------------------------------------------------------------------------

if mods["exotic-industries-loaders"] then

local kr_neo_loader = _td(data.raw["loader-1x1"]["kr-loader"])
kr_neo_loader.name = "kr-neo-loader"
kr_neo_loader.minable.result = kr_neo_loader.name
kr_neo_loader.speed = ei_neo_speed

local ei_loader = _td(data.raw["loader-1x1"]["ei_loader"])
local ei_advanced_loader = _td(ei_loader)
ei_advanced_loader.name = "ei_advanced-loader"
ei_advanced_loader.minable.result = ei_advanced_loader.name
ei_advanced_loader.speed = ei_loader.speed * 4
local ei_superior_loader = _td(ei_loader)
ei_superior_loader.name = "ei_superior-loader"
ei_superior_loader.minable.result = ei_superior_loader.name
ei_superior_loader.speed = ei_loader.speed * 6

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

kr_neo_loader.type = "recipe"
ei_advanced_loader.type = "recipe"
ei_superior_loader.type = "recipe"
kr_neo_loader.result = kr_neo_loader.name
ei_advanced_loader.result = ei_advanced_loader.name
ei_superior_loader.result = ei_superior_loader.name
kr_neo_loader.ingredients = {{"kr-superior-loader", 2}}
ei_advanced_loader.ingredients = {{"ei_express-loader", 2}}
ei_superior_loader.ingredients = {{"ei_advanced-loader", 2}}

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

kr_neo_loader.type = "item"
ei_advanced_loader.type = "item"
ei_superior_loader.type = "item"
kr_neo_loader.place_result = kr_neo_loader.name
ei_advanced_loader.place_result = ei_advanced_loader.name
ei_superior_loader.place_result = ei_superior_loader.name
kr_neo_loader.flags = nil
ei_advanced_loader.flags = nil
ei_superior_loader.flags = nil
kr_neo_loader.stack_size = 50
ei_advanced_loader.stack_size = 50
ei_superior_loader.stack_size = 50
kr_neo_loader.subgroup = "belt"
ei_advanced_loader.subgroup = "belt"
ei_superior_loader.subgroup = "belt"
kr_neo_loader.order = "d[loader]-a6[kr-neo-loader]"
ei_advanced_loader.order = "h[ei_loader]-d[ei_advanced-loader]"
ei_superior_loader.order = "h[ei_loader]-e[ei_superior-loader]"

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

end

--ROBOPORT
------------------------------------------------------------------------------------------------------

if mods["exotic-industries-robots"] then

variations_util.createRoboportVariations("ei_advanced-port")

end

--MATTER
------------------------------------------------------------------------------------------------------
local K2_MATTER =  {
    -- TODO: dirty-water / ei_dirty-water
    {
        item_name = "ei_uranium-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-uranium-processing",
    },
    {
        item_name = "ei_sulfur-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-sulfur-processing",
    },
    {
        item_name = "ei_iron-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-iron-processing",
    },
    {
        item_name = "ei_copper-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-copper-processing",
    },
    {
        item_name = "ei_poor-iron-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-iron-processing",
    },
    {
        item_name = "ei_poor-copper-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-copper-processing",
    },
    {
        item_name = "ei_iron-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-iron-processing",
    },
    {
        item_name = "ei_copper-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-copper-processing",
    },
    {
        item_name = "ei_coal-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-coal-processing",
    },
    {
        item_name = "ei_coal-gas",
        minimum_conversion_quantity = 100,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-coal-gas-processing",
    },
    {
        item_name = "ei_ammonia-gas",
        minimum_conversion_quantity = 100,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-ammonia-gas-processing",
    },
    {
        item_name = "ei_pythogas",
        minimum_conversion_quantity = 100,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-pythogas-processing",
    },
    {
        item_name = "ei_cryoflux",
        minimum_conversion_quantity = 100,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-cryoflux-processing",
    },
    {
        item_name = "ei_neodym-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-neodym-processing",
    },
    {
        item_name = "ei_lead-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-lead-processing",
    },
    {
        item_name = "ei_gold-chunk",
        minimum_conversion_quantity = 10,
        matter_value = 10,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-gold-processing",
    },
}

for _, matter_args in pairs(K2_MATTER) do
    if not data.raw.technology[matter_args.unlocked_by_technology] then
        local item = data.raw.item[matter_args.item_name] or data.raw.fluid[matter_args.item_name]
        local tech = table.deepcopy(data.raw.technology["kr-matter-iron-processing"])
        tech.name = matter_args.unlocked_by_technology
        tech.effects = {}
        tech.icon = nil
        tech.icons = {
            {
                icon = "__Krastorio2Assets__/technologies/backgrounds/matter.png",
                icon_size = 256,
            },
        }
        krastorio.icons.addOverlayIcons(tech, krastorio.icons.getIconsForOverlay(item), 64, 2, {0, 0})
        data:extend({ tech })
    end
    krastorio.matter_func.createMatterRecipe(matter_args)
end

--CATEGORIES, GROUPS, SUBGROUPS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_science-data",
        type = "item-subgroup",
        group = "intermediate-products",
    },
    {
        name = "ei_science-tech-card",
        type = "item-subgroup",
        group = "intermediate-products",
    },
    {
        name = "ei_neo-assembling",
        type = "recipe-category",
    },
    {
        name = "ei_science",
        type = "item-group",
        icon = ei_graphics_other_path.."science.png",
        icon_size = 128,
        inventory_order = "d-a",
        order = "d-a",
    },
    {
        name = "ei_science-other",
        type = "item-subgroup",
        group = "ei_science",
        order = "a",
    },
    {
        name = "ei_science-kr-cards",
        type = "item-subgroup",
        group = "ei_science",
        order = "b",
    },
    {
        name = "ei_science-ei-cards",
        type = "item-subgroup",
        group = "ei_science",
        order = "c",
    },
    {
        name = "ei_science-science",
        type = "item-subgroup",
        group = "ei_science",
        order = "d",
    },
})

--====================================================================================================
--PROPERTIES CHANGES
--====================================================================================================

table.insert(data.raw["character"]["character"].crafting_categories, "ei_neo-assembling")
table.insert(data.raw["assembling-machine"]["ei_neo-assembler"].crafting_categories, "ei_neo-assembling")

convertTypePrototype("ei_arc-furnace", "furnace", "assembling-machine")
convertTypePrototype("kr-crusher", "furnace", "assembling-machine")

--convertTypePrototype("basic-tech-card", "tool", "item")
convertTypePrototype("automation-science-pack", "tool", "item")
convertTypePrototype("logistic-science-pack", "tool", "item")
convertTypePrototype("military-science-pack", "tool", "item")
convertTypePrototype("chemical-science-pack", "tool", "item")
convertTypePrototype("production-science-pack", "tool", "item")
convertTypePrototype("utility-science-pack", "tool", "item")
convertTypePrototype("space-science-pack", "tool", "item")
convertTypePrototype("matter-tech-card", "tool", "item")
convertTypePrototype("advanced-tech-card", "tool", "item")
convertTypePrototype("singularity-tech-card", "tool", "item")

ei_lib.add_item_level("kr-superior-filter-inserter", "filter")
ei_lib.add_item_level("kr-superior-long-filter-inserter", "filter")
ei_lib.add_item_level("kr-crusher", "3")
ei_lib.add_item_level("kr-advanced-solar-panel", "4")
ei_lib.add_item_level("accumulator", "1")
ei_lib.add_item_level("kr-energy-storage", "2")
ei_lib.add_item_level("stone-furnace", "1")
ei_lib.add_item_level("steel-furnace", "2")
ei_lib.add_item_level("electric-furnace", "3")
ei_lib.add_item_level("kr-advanced-furnace", "4")
ei_lib.add_item_level("kr-advanced-chemical-plant", "4")
ei_lib.add_item_level("ei_dark-age-lab", "1")
ei_lib.add_item_level("biusart-lab", "2")
ei_lib.add_item_level("kr-singularity-lab", "3")
ei_lib.add_item_level("ei_big-lab", "4")
ei_lib.add_item_level("ei_purifier", "1")
ei_lib.add_item_level("kr-filtration-plant", "2")
ei_lib.add_item_level("kr-research-server", "1")
ei_lib.add_item_level("kr-quantum-computer", "2")
ei_lib.add_item_level("ei_quantum-computer", "3")
ei_lib.add_item_level("ei_lufter", "1")
ei_lib.add_item_level("kr-atmospheric-condenser", "2")

data.raw.lab["lab"].inputs = nil
data.raw.lab["biusart-lab"].inputs = nil
data.raw.lab["kr-singularity-lab"].inputs = nil
data.raw.resource["imersite"].autoplace = nil
data.raw["assembling-machine"]["kr-crusher"].crafting_categories = nil
data.raw["assembling-machine"]["ei_arc-furnace"].source_inventory_size = nil
data.raw["assembling-machine"]["kr-crusher"].source_inventory_size = nil

local K2_CHANGES = {
    ["item-subgroup"] = {
        ["ei_science-data"] = {order = "h1"},
        ["ei_science-tech-card"] = {order = "h2"},
        ["science-pack"] = {order = "h3"},
    },
    ["storage-tank"] = {
        ["ei_tank-1"] = {fluid_box = { base_area = 1200 }},
        ["ei_tank-2"] = {fluid_box = { base_area = 4000 }},
        ["ei_tank-3"] = {fluid_box = { base_area = 1200 }},
    },
    ["container"] = {
        ["kr-medium-container"] = {inventory_size = ei_medium_container},
        ["kr-big-container"] = {inventory_size = ei_big_container},
    },
    ["logistic-container"] = {
        ["kr-big-active-provider-container"] = {inventory_size = ei_big_container},
        ["kr-big-buffer-container"] = {inventory_size = ei_big_container},
        ["kr-big-passive-provider-container"] = {inventory_size = ei_big_container},
        ["kr-big-requester-container"] = {inventory_size = ei_big_container},
        ["kr-big-storage-container"] = {inventory_size = ei_big_container},
        ["kr-medium-active-provider-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-buffer-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-passive-provider-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-requester-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-storage-container"] = {inventory_size = ei_medium_container},
    },
    ["loader-1x1"] = {
        ["ei_loader"] = {filter_count = 5},
        ["ei_fast-loader"] = {filter_count = 5},
        ["ei_express-loader"] = {filter_count = 5},
        ["ei_advanced-loader"] = {filter_count = 5},
        ["ei_superior-loader"] = {filter_count = 5},
        ["ei_neo-loader"] = {filter_count = 5, speed = ei_neo_speed},
    },
    ["transport-belt"] = {
        ["ei_neo-belt"] = {speed = ei_neo_speed},
    },
    ["underground-belt"] = {
        ["ei_neo-underground-belt"] = {speed = ei_neo_speed, max_distance = 50},
    },
    ["splitter"] = {
        ["ei_neo-splitter"] = {speed = ei_neo_speed},
    },
    ["beacon"] = {
        ["kr-singularity-beacon"] = {module_specification = {module_slots = 1}, distribution_effectivity = 0.25},
    },
    ["assembling-machine"] = {
        ["kr-advanced-chemical-plant"] = {crafting_categories = {"ei_advanced-chem-plant"}},
        ["kr-crusher"] = {crafting_categories = {"ei_crushing"}, crafting_speed = 6},
        ["kr-quantum-computer"] = {crafting_speed = 2},
        ["ei_quantum-computer"] = {crafting_categories = {"ei_quantum-computer", "research-data", "t2-tech-cards", "t3-tech-cards"}, crafting_speed = 3}, -- from 1x
    },
    ["lab"] = {
        ["lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech"}},
        ["biusart-lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech", "ei_computer-age-tech"}},
        ["kr-singularity-lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech", "ei_computer-age-tech", "ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech", "ei_quantum-age-tech"}},
        ["ei_big-lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech", "ei_computer-age-tech", "ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech", "ei_quantum-age-tech", "ei_space-quantum-age-tech", "ei_fusion-quantum-age-tech", "ei_matter-quantum-age-tech", "ei_imersite-quantum-age-tech", "ei_exotic-age-tech", "ei_black-hole-exotic-age-tech"}},
    },
    ["tool"] = {
        ["ei_dark-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_steam-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_electricity-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_computer-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_knowledge-computer-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_advanced-computer-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_space-quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_fusion-quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_imersite-quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_matter-quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_exotic-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_black-hole-exotic-age-tech"] = {subgroup = "ei_science-science"},
    },
    ["item"] = {
        ["ei_express-loader"] = {order = "h[ei_loader]-c[ei_express-loader]"},
        ["ei_fast-loader"] = {order = "h[ei_loader]-b[ei_fast-loader]"},
        ["ei_insulated-tank"] = {order = "z-b[fluid]-g[ei_insulated-tank]"},
        ["ei_loader"] = {order = "h[ei_loader]-a[ei_loader]"},
        ["ei_neo-belt"] = {order = "a[transport-belt]-f[ei_neo-belt]"},
        ["ei_neo-loader"] = {order = "h[ei_loader]-f[ei_neo-loader]"},
        ["ei_neo-splitter"] = {order = "c[splitter]-f[ei_neo-splitter]"},
        ["ei_neo-underground-belt"] = {order = "b[underground-belt]-f[ei_neo-underground-belt]"},
        ["ei_tank-1"] = {order = "z-b[fluid]-c[ei_tank-1]"}, -- if not loaded set properties handles this
        ["ei_tank-2"] = {order = "z-b[fluid]-f[ei_tank-2]"},
        ["ei_tank-3"] = {order = "z-b[fluid]-d[ei_tank-3]"},
        ["kr-big-active-provider-container"] = {order = "g"},
        ["kr-big-buffer-container"] = {order = "f"},
        ["kr-big-container"] = {order = "a"},
        ["kr-big-passive-provider-container"] = {order = "c"},
        ["kr-big-requester-container"] = {order = "e"},
        ["kr-big-storage-container"] = {order = "d"},
        ["kr-fluid-storage-1"] = {order = "z-b[fluid]-b[kr-fluid-storage-1]"},
        ["kr-fluid-storage-2"] = {order = "z-b[fluid]-e[kr-fluid-storage-2]"},
        ["kr-medium-active-provider-container"] = {order = "g"},
        ["kr-medium-buffer-container"] = {order = "f"},
        ["kr-medium-container"] = {order = "a"},
        ["kr-medium-passive-provider-container"] = {order = "c"},
        ["kr-medium-requester-container"] = {order = "e"},
        ["kr-medium-storage-container"] = {order = "d"},
        ["storage-tank"] = {order = "z-b[fluid]-a[storage-tank]"},
        ["blank-tech-card"] = {subgroup = "ei_science-other"},
        ["basic-tech-card"] = {subgroup = "ei_science-other"},
        ["automation-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["logistic-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["military-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["chemical-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["production-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["utility-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["space-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["matter-tech-card"] = {subgroup = "ei_science-kr-cards"},
        ["advanced-tech-card"] = {subgroup = "ei_science-kr-cards"},
        ["singularity-tech-card"] = {subgroup = "ei_science-kr-cards"},
        ["ei_simulation-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_space-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_superior-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_plasma-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_magnet-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_fusion-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_sun-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_gas-giant-data"] = {subgroup = "ei_science-ei-cards"},
        ["ei_black-hole-data"] = {subgroup = "ei_science-ei-cards", order = "a-d-a"},
        ["ei_fission-tech"] = {subgroup = "ei_science-ei-cards"},
        ["biters-research-data"] = {subgroup = "ei_science-kr-cards"},
        ["matter-research-data"] = {subgroup = "ei_science-kr-cards"},
        ["space-research-data"] = {subgroup = "ei_science-kr-cards"},
        ["ei_neo-assembler"] = {order = "c1[assembling-machine-3]-a"},
        ["ei_advanced-port"] = {order = "c[signal]-[roboport]-2"},
        ["pipe-to-ground"] = {order = "a[pipe]-a[pipe-to-ground]"},
        ["kr-steel-pipe"] = {order = "a[pipe]-b[pipe]"},
        ["kr-steel-pipe-to-ground"] = {order = "a[pipe]-b[pipe-to-ground]"},
        ["kr-advanced-solar-panel"] = {order = "d[solar-panel]-b[ei_solar-panel-4]"},
        ["kr-crusher"] = {order = "d-a-a-3"},
        ["biusart-lab"] = {order = "a3", subgroup = "ei_labs"},
        ["kr-singularity-lab"] = {order = "a4", subgroup = "ei_labs"},
        ["ei_big-lab"] = {order = "a5"},
        ["ei_purifier"] = {order = "e-b1[ei_purifier]"},
        ["kr-filtration-plant"] = {order = "e-b2[filtration-plant]"},
        ["ei_quantum-computer"] = {order = "f3[research-server]-c1[ei_quantum-computer]", subgroup = "production-machine"},
        ["ei_lufter"] = {order = "e-c1[ei_lufter]"},
        ["kr-atmospheric-condenser"] = {order = "e-c2[atmospheric-condenser]"},
        ["ei_heat-chemical-plant"] = {order = "e[chemical-plant]-1"},
        ["chemical-plant"] = {order = "e[chemical-plant]-2"},
        ["ei_advanced-chemical-plant"] = {order = "e[chemical-plant]-3"},
        ["kr-advanced-chemical-plant"] = {order = "e[chemical-plant]-4"},
    },
    ["resource"] = {
        ["imersite"] = {autoplace = ei_autoplace("imersite", "gaia")}
    },
    ["recipe"] = {
        ["express-splitter"] = {category = "crafting-with-fluid", ingredients = {
            {type = "item", name = "fast-splitter", amount = 1},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 4},
            {type = "item", name = "ei_electronic-parts", amount = 2},
        },},
        ["express-transport-belt"] = {category = "crafting-with-fluid", ingredients = {
            {type = "item", name = "fast-transport-belt", amount = 1},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 1},
        }},
        ["express-underground-belt"] = {category = "crafting-with-fluid", ingredients = {
            {type = "item", name = "fast-underground-belt", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 4},
        }},


        ["kr-big-active-provider-container"] = {order = "g"},
        ["kr-big-buffer-container"] = {order = "f"},
        ["kr-big-container"] = {order = "a", subgroup = "kr-logistics-3"},
        ["kr-big-passive-provider-container"] = {order = "c"},
        ["kr-big-requester-container"] = {order = "e"},
        ["kr-big-storage-container"] = {order = "d"},
        ["kr-medium-active-provider-container"] = {order = "g"},
        ["kr-medium-buffer-container"] = {order = "f"},
        ["kr-medium-container"] = {order = "a", subgroup = "kr-logistics-2"},
        ["kr-medium-passive-provider-container"] = {order = "c"},
        ["kr-medium-requester-container"] = {order = "e"},
        ["kr-medium-storage-container"] = {order = "d"},
        --transport
        ["kr-advanced-transport-belt"] = {category = "crafting-with-fluid"},
        ["kr-advanced-underground-belt"] = {category = "crafting-with-fluid"},
        ["kr-advanced-splitter"] = {category = "crafting-with-fluid"},
        ["kr-advanced-laoder"] = {category = "crafting-with-fluid"},
        -- fuel refining
        ["rocket-fuel"] = {category = "fuel-refinery"},
        ["ei_diesel-fuel-unit"] = {category = "fuel-refinery"},
        ["ei_drill-fluid"] = {category = "fuel-refinery"},
        ["ei_kerosene:heavy-oil"] = {category = "fuel-refinery"},
        -- crushing
        ["sand"] = {category = "ei_crushing"},
        ["imersite-powder"] = {category = "ei_crushing"},
        ["imersite-crystal-to-dust"] = {category = "ei_crushing"},
        -- inserters to parts
        ["inserter-to-parts"] = {category = "ei_crushing"},
        ["fast-inserter-to-parts"] = {category = "ei_crushing"},
        ["long-handed-inserter-to-parts"] = {category = "ei_crushing"},
        ["burner-inserter-to-parts"] = {category = "ei_crushing"},
        ["stack-inserter-to-parts"] = {category = "ei_crushing"},
        ["stack-filter-inserter-to-parts"] = {category = "ei_crushing"},
        ["filter-inserter-to-parts"] = {category = "ei_crushing"},
        ["superior-inserter-to-parts"] = {category = "ei_crushing"},
        ["superior-long-inserter-to-parts"] = {category = "ei_crushing"},
        ["superior-filter-inserter-to-parts"] = {category = "ei_crushing"},
        ["superior-long-filter-inserter-to-parts"] = {category = "ei_crushing"},
        -- neo-assembling
        ["ei_bio-chamber"] = {category = "ei_neo-assembling"},
        ["ei_bio-reactor"] = {category = "ei_neo-assembling"},
        ["ei_knowledge-console"] = {category = "ei_neo-assembling"},
        ["ei_gate"] = {category = "ei_neo-assembling"},
        ["ei_drone-port"] = {category = "ei_neo-assembling"},
        ["ei_farstation"] = {category = "ei_neo-assembling"},
        ["ei_crystal-accumulator"] = {category = "ei_neo-assembling"},
        ["ei_gaia-pump"] = {category = "ei_neo-assembling"},
        ["ei_odd-plating"] = {category = "ei_neo-assembling"},
        ["ei_bio_insulated-wire"] = {category = "ei_neo-assembling"},
        ["ei_bio_electronic-parts"] = {category = "ei_neo-assembling"},
        ["ei_bio_magnet"] = {category = "ei_neo-assembling"},
        ["ei_black-hole"] = {category = "ei_neo-assembling"},
        ["ei_energy-extractor-pylon"] = {category = "ei_neo-assembling"},
        ["ei_energy-injector-pylon"] = {category = "ei_neo-assembling"},
        ["ei_scanner"] = {category = "ei_neo-assembling"},
        ["ei_crystal-accumulator-repair"] = {category = "ei_neo-assembling"},
        ["ei_farstation-repair"] = {category = "ei_neo-assembling"},
        ["ei_alien-beacon-repair"] = {category = "ei_neo-assembling"},

        ["automation-science-pack"] = {enabled = true},
        ["basic-tech-card"] = {enabled = true},
    },
    ["technology"] = {},
}

for source, group in pairs(K2_CHANGES) do
    for name, object in pairs(group) do
        object.name = name
        object.type = source
        ei_lib.set_properties(object)
    end
end

--table.insert(data.raw["lab"]["ei_big-lab"].inputs, "ei_matter-quantum-age-tech")
--table.insert(data.raw["lab"]["ei_big-lab"].inputs, "ei_imersite-quantum-age-tech")


--====================================================================================================
--TECH FIXES
--====================================================================================================

data:extend({
    {
        name = "ei_matter-quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."matter-quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "ei_science-science",
        order = "a5-4",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."matter-quantum-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_imersite-quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."imersite-quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "ei_science-science",
        order = "a5-3",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."imersite-quantum-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
})

local to_remove = {
    "kr-basic-fluid-handling",
    "kr-steam-engine",
    "kr-electric-mining-drill",
    "kr-electric-mining-drill-mk2",
    "kr-electric-mining-drill-mk3",
    "kr-stone-processing",
    "kr-advanced-tech-card",
    "kr-matter-tech-card",
    "kr-singularity-tech-card",
    "automation-science-pack",
}

-- turn K2 fusion into something crystal energy powered

local new_prerequisites = {
    ["dark-age"] = {
        ["automation-science-pack"] = {{},{"ei_dark-age"},true},
    },
    ["steam-age"] = {
        ["kr-automation-core"] = {{"ei_steam-age"},{"ei_steam-assembler"},true},
    },
    ["electricity-age"] = {
        ["kr-greenhouse"] = {{"ei_electricity-age"},{},false},
        ["logistics-2"] = {{"plastics", "logistics", "fast-inserter"},{},false},
        ["kr-advanced-lab"] = {{"advanced-electronics"},{"ei_computer-age"},true},
        ["kr-steel-fluid-handling"] = {{"fluid-handling", "electric-engine"},{},true},
        ["kr-steel-fluid-tanks"] = {{"kr-steel-fluid-handling"},{},false},
        ["advanced-radar"] = {{"kr-radar", "ei_electronic-parts"},{},false},
        ["advanced-electronics"] = {{"kr-silicon-processing", "sulfur-processing"},{},false},
        ["kr-research-server"] = {{"advanced-electronics"},{"ei_computer-age"},true},
        ["kr-air-purification"] = {{"advanced-electronics"},{},true},
        ["kr-fuel"] = {{"ei_destill-tower"},{},false},
    },
    ["computer-age"] = {
        ["logistics-3"] = {{"kr-fluids-chemistry", "logistics-2"},{},false},
        ["kr-fluids-chemistry"] = {{"ei_computer-age"},{"kr-atmosphere-condensation", "kr-mineral-water-gathering"},true},
        ["kr-fluid-excess-handling"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_nitric-acid"] = {{"ei_dinitrogen-tetroxide", "kr-mineral-water-gathering"},{},false},
        ["stack-inserter"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_deep-pumpjack"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_cooler"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_high-energy-crystal"] = {{"kr-fluids-chemistry"},{},false},
        ["kr-singularity-lab"] = {{"ei_computer-core"},{"ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech"},true},
    },
    ["advanced-computer-age"] = {
        ["kr-enriched-ores"] = {{"ei_silicon"},{},false},
        ["kr-improved-pollution-filter"] = {{"advanced-electronics-2", "kr-air-purification"},{},true},
        ["kr-advanced-exoskeleton-equipment"] = {{"exoskeleton-equipment"},{},true},
        ["kr-quantum-computer"] = {{"advanced-electronics-2"},{"ei_quantum-age"},true},
    },
    ["knowledge-computer-age"] = {
        ["kr-logistic-4"] = {{"ei_computer-core", "logistics-3"},{},false},
        ["kr-atmosphere-condensation"] = {{"automation-3", "ei_oxygen-gas"},{},false},
        ["kr-advanced-chemistry"] = {{"kr-atmosphere-condensation"},{},true},
        ["kr-bio-processing"] = {{"ei_bio-reactor"},{},true},
        ["kr-bio-fuel"] = {{"kr-advanced-chemistry"},{},false},
        ["kr-nuclear-locomotive"] = {{"automation-3"},{},false},
    },
    ["quantum-age"] = {
        ["kr-quarry-minerals-extraction"] = {{"ei_quantum-age"},{},false},
        ["kr-logistic-5"] = {{"kr-imersium-processing", "kr-logistic-4"},{},false},
        ["ei_big-lab"] = {{"ei_quantum-age"},{"ei_fusion-data", "ei_moon-exploration"},true},
        ["kr-ai-core"] = {{"kr-quarry-minerals-extraction"},{"ei_quantum-computer"},true},
        ["kr-battery-mk3-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersite-night-vision-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersium-processing"] = {{"kr-quarry-minerals-extraction", "ei_nano-factory", "ei_oxygen-difluoride", "ei_big-lab"},{"kr-energy-control-unit"},true},
        ["kr-lithium-processing"] = {{"ei_oxygen-difluoride"},{"ei_lithium-processing"},true},
    },
    ["fusion-quantum-age"] = {
        ["kr-lithium-sulfur-battery"] = {{"kr-lithium-processing", "ei_odd-plating"},{},false},
        ["kr-energy-control-unit"] = {{"kr-lithium-sulfur-battery", "ei_clean-plating", "ei_big-lab"},{},false},
    },
    ["imersite-quantum-age"] = {
        ["kr-superior-exoskeleton-equipment"] = {{"kr-advanced-exoskeleton-equipment", "kr-imersium-processing"},{},true},
        ["kr-advanced-solar-panel"] = {{"ei_solar-panel-3", "kr-imersium-processing"},{},true},
        ["kr-advanced-chemical-plant"] = {{"ei_fish-growing", "kr-imersium-processing"},{},true},
        ["kr-advanced-roboports"] = {{"kr-imersium-processing"},{},true}, --
        ["kr-imersite-solar-panel-equipment"] = {{"ei_personal-solar-3", "kr-imersium-processing"},{},true},
        ["kr-crusher"] = {{"ei_advanced-crusher", "ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-advanced-furnace"] = {{"ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-power-armor-mk3"] = {{"kr-imersium-processing"},{"ei_bio-armor"},true}, -- mk4 must depend on bio armor
        ["kr-automation"] = {{"kr-imersium-processing", "ei_neo-assembler"},{},true},
        ["kr-superior-inserters"] = {{"kr-imersium-processing", "stack-inserter"},{},true},
        ["kr-logistics-5"] = {{"kr-imersium-processing", "stack-inserter"},{},true},
        ["kr-energy-storage"] = {{"kr-imersium-processing"},{"ei_superior-induction-matrix"},true},
    },
    ["four-quantum-age"] = {
        ["ei_high-tech-parts"] = {{"kr-matter-processing", "ei_asteroid-mining", "ei_eu-circuit", "kr-imersium-processing"},{},false},
        ["ei_neo-logistics"] = {{"kr-logistic-5"},{},false},
    }
}

for _, tech in ipairs(to_remove) do
    ei_lib.remove_tech(tech)
end

-- potentially overrite thr old prereqs
local overwrite_prereqs = {}
for age, dat in pairs(new_prerequisites) do
    for tech, info in pairs(dat) do
        if info[3] == true then
            -- remove this tech from all other prereqs
            overwrite_prereqs[tech] = true
        end
    end
end

for tech,_ in pairs(data.raw.technology) do
    for _,prereq in ipairs(data.raw.technology[tech].prerequisites or {}) do
        if overwrite_prereqs[prereq] then
            ei_lib.remove_prerequisite(tech, prereq)
        end
    end
end

for age, dat in pairs(new_prerequisites) do
    
    -- first index is new prereq for this tech, second which techs should get this added
    for tech, info in pairs(dat) do
       
        if not data.raw.technology[tech] then
            log("Tech " .. tech .. " does not exist")
            goto continue
        end

        -- set age first
        data.raw.technology[tech].age = age
        ei_lib.set_prerequisites(tech, info[1])

        for _, some_tech in ipairs(info[2]) do
            ei_lib.add_prerequisite(some_tech, tech)
        end

        ::continue::
    end

end

-- fixup age graphs
-- as new techs have set an age property we need to include them aswell

-- prepare list of all altered techs first
local foo = {}
for age, dat in pairs(new_prerequisites) do
    for tech, _ in pairs(dat) do
        foo[tech] = true
    end
end

local function make_dummy_techs(foo, ages_dummy_dict)
    -- loop over all techs in the game
    -- if they have the age attribute
    -- look up the next age in the ages_dummy_dict
    -- and set them as prerequisite for the dummy tech

    for i,_ in pairs(foo) do
        if not data.raw["technology"][i] then
            log("Tech " .. i .. " does not exist")
            goto continue
        end

        if data.raw["technology"][i].age then

            age = data.raw["technology"][i].age

            if ei_data.sub_age[age] then
                age = ei_data.sub_age[age]
            end

            local next_age = "ei_"..ages_dummy_dict[age]..":dummy"
            
            if next_age then
                --set_prerequisites(next_age, i)
                --table.insert(data.raw["technology"][tech].prerequisites, prerequisite)
                ei_lib.add_prerequisite(next_age, i)
            end

            -- find out if the tech already has the age count effect
            for _, effect in pairs(data.raw.technology[i].effects) do
                if effect.type == "nothing" and effect.effect_description == {"description.tech-counts-for-age-progression"} then
                    goto continue
                end
            end

            table.insert(data.raw.technology[i].effects, {
                type = "nothing",
                effect_description = {"description.tech-counts-for-age-progression"},
                infer_icon = false,
                icon_size = 64,
                icon = ei_graphics_other_path.."tech_overlay.png",
            })
        end

        ::continue::
    end

end
local ages_dummy_dict = ei_data.ages_dummy_dict
make_dummy_techs(foo, ages_dummy_dict)


-- overwrite icons from new sub age techs
data.raw.technology["kr-imersium-processing"].icon = ei_graphics_tech_path.."kr-imersite.png"
data.raw.technology["kr-imersium-processing"].icon_size = 256
data.raw.technology["kr-imersium-processing"].icon_mipmaps = 1

data.raw.technology["kr-energy-control-unit"].icon = ei_graphics_tech_path.."kr-matter.png"
data.raw.technology["kr-energy-control-unit"].icon_size = 256
data.raw.technology["kr-energy-control-unit"].icon_mipmaps = 1

--ITEMS AND RECIPES
------------------------------------------------------------------------------------------------------

--index is target, info is stuff that gets absorbed into it
local items_to_merge = {
    ["ei_iron-beam"] = { item = "iron-beam", use_icon = true },
    ["steel-plate"] = { item = "steel-beam", use_icon = true },
    ["ei_steel-mechanical-parts"] = { item = "steel-gear-wheel", use_icon = false },
    ["ei_coke"] = { item = "coke", use_icon = false },
    ["ei_sand"] = { item = "sand", use_icon = true },
    
}

local fluids_to_merge = {
    ["ei_nitric-acid"] = { fluid = "nitric-acid", use_icon = true },
    ["ei_dirty-water"] = { fluid = "dirty-water", use_icon = true },
    ["ei_nitrogen-gas"] = { fluid = "nitrogen", use_icon = false },
    ["ei_oxygen-gas"] = { fluid = "oxygen", use_icon = false },
    ["ei_hydrogen-gas"] = { fluid = "hydrogen", use_icon = true },
    ["ei_ammonia-gas"] = { fluid = "ammonia", use_icon = true },
    ["ei_dirty-water"] = { fluid = "dirty-water", use_icon = true },
}

local recipe_to_hide = {
    "iron-beam",
    "steel-beam",
    "steel-gear-wheel",
    "dirty-water-filtration-1",
    "dirty-water-filtration-2",
    "dirty-water-filtration-3",
    "coal-filtration", -- balance this and unhide?
    "basic-tech-card",
}

local recipe_overwrite = {
    ["inserter-parts"] = {
        {type = "item", name = "ei_iron-mechanical-parts", amount = 1},
        {type = "item", name = "ei_copper-mechanical-parts", amount = 1},
    },
    ["inserter"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "automation-core", amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 1},
    },
    ["long-handed-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "automation-core", amount = 1},
        {type = "item", name = "electric-engine-unit", amount = 1},
        {type = "item", name = "ei_iron-mechanical-parts", amount = 2},
    },
    ["fast-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "inserter", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 2},
    },
    ["filter-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "inserter", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 6},
    },
    ["stack-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 2},
        {type = "item", name = "fast-inserter", amount = 1},
        {type = "item", name = "ei_electronic-parts", amount = 1},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
    },
    ["stack-filter-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 2},
        {type = "item", name = "fast-inserter", amount = 1},
        {type = "item", name = "ei_electronic-parts", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
    },
    -- belts and stuff
    ["kr-advanced-transport-belt"] = {
        {"express-transport-belt", 1},
        {"ei_steel-mechanical-parts", 5},
        {"ei_condensed-cryodust", 1},
        {type="fluid", name="lubricant", amount=15},
    },
    ["kr-advanced-underground-belt"] = {
        {"express-underground-belt", 2},
        {"ei_steel-mechanical-parts", 5},
        {"ei_condensed-cryodust", 1},
        {type="fluid", name="lubricant", amount=35},
    },
    ["kr-advanced-splitter"] = {
        {"express-splitter", 1},
        {"ei_steel-mechanical-parts", 5},
        {"ei_condensed-cryodust", 1},
        {type="fluid", name="lubricant", amount=55},
    },
    ["kr-advanced-laoder"] = {
        {"kr-express-loader", 2},
        {"ei_steel-mechanical-parts", 5},
        {"ei_condensed-cryodust", 1},
        {type="fluid", name="lubricant", amount=55},
    },

    ["ei_neo-belt"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
        {type = "item", name = "kr-superior-transport-belt", amount = 2},
        {type = "item", name = "ei_neodym-plate", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
    },
    ["ei_neo-splitter"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
        {type = "item", name = "kr-superior-splitter", amount = 2},
        {type = "item", name = "ei_neodym-plate", amount = 2},
        {type = "item", name = "processing-unit", amount = 5},
    },
    ["ei_neo-underground-belt"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
        {type = "item", name = "kr-superior-underground-belt", amount = 4},
        {type = "item", name = "ei_neodym-plate", amount = 20},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 30},
    },

    -- science packs and their tech cards
    ["blank-tech-card"] = {
        {type = "item", name = "wood", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
    },

    ["automation-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 5},
        {type = "item", name = "ei_iron-mechanical-parts", amount = 1},
    },
    ["ei_dark-age-tech"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "automation-science-pack", amount = 1},
    },

    ["logistic-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 5},
        {type = "item", name = "ei_copper-mechanical-parts", amount = 1},
    },
    ["ei_steam-age-tech"] = {
        {type = "item", name = "ei_steam-engine", amount = 1},
        {type = "item", name = "logistic-science-pack", amount = 1},
    },

    ["chemical-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 5},
        {type = "item", name = "electronic-circuit", amount = 3},
    },
    ["ei_electricity-age-tech"] = {
        {type = "item", name = "engine-unit", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 3},
        {type = "item", name = "chemical-science-pack", amount = 5},
    },

    ["utility-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 10},
        {type = "item", name = "ei_electronic-parts", amount = 3},
        {type = "item", name = "decider-combinator", amount = 2},
    },
    ["ei_computer-age-tech"] = {
        {type = "fluid", name = "lubricant", amount = 25},
        {type = "item", name = "ei_energy-crystal", amount = 3},
        {type = "item", name = "utility-science-pack", amount = 5},
    },
    ["ei_knowledge-computer-age-tech"] = {
        {type = "fluid", name = "ei_cryoflux", amount = 100},
        {type = "item", name = "ei_alien-resin", amount = 10},
        {type = "item", name = "ei_alien-seed", amount = 1},
        {type = "item", name = "utility-science-pack", amount = 5},
    },
    ["ei_advanced-computer-age-tech"] = {
        {type = "fluid", name = "ei_ammonia-gas", amount = 100},
        {type = "item", name = "ei_simulation-data", amount = 12},
        {type = "item", name = "utility-science-pack", amount = 5},
    },
}

-- ressouces
data.raw.recipe["iron-plate"].icon = nil
data.raw.recipe["iron-plate"].icon_size = nil

data.raw.recipe["copper-plate"].icon = nil
data.raw.recipe["copper-plate"].icon_size = nil

-- inserters
ei_lib.recipe_add("ei_steam-inserter", "inserter-parts", 1)
ei_lib.recipe_add("ei_steam-long-inserter", "inserter-parts", 1)
ei_lib.recipe_add("ei_small-inserter-normal", "inserter-parts", 4)
ei_lib.recipe_add("ei_big-inserter-normal", "inserter-parts", 4)
ei_lib.remove_unlock_recipe("logistics", "inserter")
ei_lib.remove_unlock_recipe("logistics", "long-handed-inserter")
ei_lib.remove_unlock_recipe("logistics", "kr-loader")
ei_lib.add_unlock_recipe("fast-inserter", "kr-loader")

-- science
data.raw.recipe["automation-science-pack"].enabled = true
data.raw.recipe["blank-tech-card"].enabled = true

data:extend({
    {
        name = "ei_blank-tech-card",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {"ei_ceramic", 3},
            {"iron-plate", 4},
            {"ei_glass", 2},
        },
        result = "blank-tech-card",
        result_count = 14,
        enabled = false,
    },
})

ei_lib.add_unlock_recipe("electronics", "ei_blank-tech-card")
ei_lib.add_unlock_recipe("ei_steam-age", "logistic-science-pack")
ei_lib.add_unlock_recipe("ei_electricity-age", "chemical-science-pack")
ei_lib.add_unlock_recipe("ei_computer-age", "utility-science-pack")


for target, info in pairs(items_to_merge) do
    ei_lib.merge_item(target, info.item, info.use_icon)
end

for _, recipe in pairs(recipe_to_hide) do
    data.raw.recipe[recipe].hidden = true
end

for target, info in pairs(fluids_to_merge) do
    ei_lib.merge_fluid(target, info.fluid, info.use_icon)
end

for recipe, info in pairs(recipe_overwrite) do
    if not data.raw.recipe[recipe] then
        log("Recipe " .. recipe .. " does not exist")
        goto continue
    end

    data.raw.recipe[recipe].ingredients = info
    ::continue::
end