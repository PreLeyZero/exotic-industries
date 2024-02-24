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
})

--====================================================================================================
--PROPERTIES CHANGES
--====================================================================================================

table.insert(data.raw["character"]["character"].crafting_categories, "ei_neo-assembling")
table.insert(data.raw["assembling-machine"]["ei_neo-assembler"].crafting_categories, "ei_neo-assembling")

convertTypePrototype("ei_arc-furnace", "furnace", "assembling-machine")
convertTypePrototype("kr-crusher", "furnace", "assembling-machine")

--[[
convertTypePrototype("basic-tech-card", "tool", "item")
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
]]

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
        ["blank-tech-card"] = {subgroup = "ei_science-tech-card"},
        ["basic-tech-card"] = {subgroup = "ei_science-tech-card"},
        ["automation-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["logistic-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["military-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["chemical-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["production-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["utility-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["space-science-pack"] = {subgroup = "ei_science-tech-card"},
        ["matter-tech-card"] = {subgroup = "ei_science-tech-card"},
        ["advanced-tech-card"] = {subgroup = "ei_science-tech-card"},
        ["singularity-tech-card"] = {subgroup = "ei_science-tech-card"},
        ["ei_simulation-data"] = {subgroup = "ei_science-data"},
        ["ei_space-data"] = {subgroup = "ei_science-data"},
        ["ei_superior-data"] = {subgroup = "ei_science-data"},
        ["ei_plasma-data"] = {subgroup = "ei_science-data"},
        ["ei_magnet-data"] = {subgroup = "ei_science-data"},
        ["ei_fusion-data"] = {subgroup = "ei_science-data"},
        ["ei_sun-data"] = {subgroup = "ei_science-data"},
        ["ei_gas-giant-data"] = {subgroup = "ei_science-data"},
        ["ei_black-hole-data"] = {subgroup = "ei_science-data", order = "a-d-a"},
        ["ei_fission-tech"] = {subgroup = "ei_science-data"},
        ["biters-research-data"] = {subgroup = "ei_science-data"},
        ["matter-research-data"] = {subgroup = "ei_science-data"},
        ["space-research-data"] = {subgroup = "ei_science-data"},
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
        ["express-splitter"] = {category = "crafting-with-fluid"},
        ["express-transport-belt"] = {category = "crafting-with-fluid"},
        ["express-underground-belt"] = {category = "crafting-with-fluid"},
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
        subgroup = "science-pack",
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
        subgroup = "science-pack",
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
        ["kr-advanced-lab"] = {{"advanced-electronics"},{"ei_computer-age"},true},
        ["kr-steel-fluid-handling"] = {{"fluid-handling", "electric-engine"},{},true},
        ["kr-steel-fluid-tanks"] = {{"kr-steel-fluid-handling"},{},false},
        ["kr-advanced-radar"] = {{"kr-radar", "ei_electronic-parts"},{},false},
        ["advanced-electronics"] = {{"kr-silicon-processing", "sulfur-processing"},{},false},
        ["kr-research-server"] = {{"advanced-electronics"},{"ei_computer-age"},true},
        ["kr-air-purification"] = {{"advanced-electronics"},{},true},
        ["kr-fuel"] = {{"ei_destill-tower"},{},false},
    },
    ["computer-age"] = {
        ["kr-fluids-chemistry"] = {{"ei_computer-age"},{"kr-atmosphere-condensation", "kr-fluid-excess-handling", "kr-mineral-water-gathering"},true},
        ["ei_nitric-acid"] = {{"ei_dinitrogen-tetroxide", "kr-mineral-water-gathering"},{},false},
        ["kr-singularity-lab"] = {{"ei_computer-core"},{"ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech"},true},
    },
    ["advanced-computer-age"] = {
        ["kr-enriched-ores"] = {{"ei_silicon"},{},false},
        ["kr-improved-pollution-filter"] = {{"advanced-electronics-2", "kr-air-purification"},{},true},
        ["kr-advanced-exoskeleton-equipment"] = {{"exoskeleton-equipment"},{},true},
        ["kr-quantum-computer"] = {{"advanced-electronics-2"},{"ei_quantum-age"},true},
    },
    ["knowledge-computer-age"] = {
        ["kr-atmosphere-condensation"] = {{"automation-3", "ei_oxygen-gas"},{},false},
        ["kr-advanced-chemistry"] = {{"kr-atmosphere-condensation"},{},true},
        ["kr-bio-processing"] = {{"ei_bio-reactor"},{},true},
        ["kr-bio-fuel"] = {{"kr-advanced-chemistry"},{},false},
    },
    ["quantum-age"] = {
        ["kr-quarry-minerals-extraction"] = {{"ei_quantum-age"},{},false},
        ["ei_big-lab"] = {{"ei_quantum-age"},{"ei_fusion-data", "ei_moon-exploration", "kr-imersium-processing", "kr-energy-control-unit"},true},
        ["kr-ai-core"] = {{"kr-quarry-minerals-extraction"},{"ei_quantum-computer"},true},
        ["kr-battery-mk3-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersite-night-vision-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersium-processing"] = {{"kr-quarry-minerals-extraction", "ei_nano-factory", "ei_oxygen-difluoride"},{"kr-energy-control-unit"},true},
        ["kr-lithium-processing"] = {{"ei_oxygen-difluoride"},{"ei_lithium-processing"},true},
    },
    ["fusion-quantum-age"] = {
        ["kr-lithium-sulfur-battery"] = {{"kr-lithium-processing", "ei_odd-plating"},{},false},
        ["kr-energy-control-unit"] = {{"kr-lithium-sulfur-battery", "ei_clean-plating"},{},false},
    },
    ["imersite-quantum-age"] = {
        ["kr-superior-exoskeleton-equipment"] = {{"kr-advanced-exoskeleton-equipment", "kr-imersium-processing"},{},true},
        ["kr-advanced-solar-panel"] = {{"ei_solar-panel-3", "kr-imersium-processing"},{},true},
        ["kr-imersite-solar-panel-equipment"] = {{"ei_personal-solar-3", "kr-imersium-processing"},{},true},
        ["kr-crusher"] = {{"ei_advanced-crusher", "ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-advanced-furnace"] = {{"ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-power-armor-mk3"] = {{"kr-imersium-processing"},{"ei_bio-armor"},true}, -- mk4 must depend on bio armor
        ["kr-automation"] = {{"kr-imersium-processing", "ei_neo-assembler"},{},true},
        ["kr-energy-storage"] = {{"kr-imersium-processing"},{"ei_superior-induction-matrix"},true},
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

