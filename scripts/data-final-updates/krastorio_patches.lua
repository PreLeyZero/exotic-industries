--====================================================================================================
-- -- CHECK FOR MOD
--====================================================================================================

if not mods["Krastorio2"] then
    return
end

-- changes to K2 mod

local ei_lib = require("lib.lib")
local ei_data = require("lib.data")
local matter = require("__Krastorio2__.lib.public.data-stages.matter-util")
local variations_util = require("__Krastorio2__.lib.public.data-stages.create-roboport-states")
local _td = table.deepcopy

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
        minimum_conversion_quantity = 5,
        matter_value = 5,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-iron-processing",
    },
    {
        item_name = "ei_poor-copper-chunk",
        minimum_conversion_quantity = 5,
        matter_value = 5,
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
        matter_value = 4,
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
        matter_value = 20,
        energy_required = 1,
        unlocked_by_technology = "kr-matter-pythogas-processing",
    },
    {
        item_name = "ei_cryoflux",
        minimum_conversion_quantity = 100,
        matter_value = 20,
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
    {
        item_name = "ei_bio-matter",
        minimum_conversion_quantity = 1,
        matter_value = 80,
        energy_required = 20,
        unlocked_by_technology = "kr-matter-bio-matter-processing",
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
        name = "t4-tech-cards",
        type = "recipe-category",
    },
    {
        name = "ei_atmosphere-condensation",
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
    {
        name = "underground-belt",
        type = "item-subgroup",
        group = "logistics",
        order = "b-a",
    },
    {
        name = "splitter-belt",
        type = "item-subgroup",
        group = "logistics",
        order = "b-b",
    },
    {
        name = "loader-belt",
        type = "item-subgroup",
        group = "logistics",
        order = "b-c",
    },
})

--====================================================================================================
--PROPERTIES CHANGES
--====================================================================================================

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
ei_lib.add_item_level("lab", "2")
ei_lib.add_item_level("biusart-lab", "3")
ei_lib.add_item_level("kr-singularity-lab", "4")
ei_lib.add_item_level("ei_big-lab", "5")
ei_lib.add_item_level("kr-advanced-assembling-machine", "5")
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
        ["kr-singularity-beacon"] = {module_slots = 1, distribution_effectivity = 0.25},
    },
    ["burner-generator"] = {
        ["kr-antimatter-reactor"] = {max_power_output = "10GW"},
    },
    ["assembling-machine"] = {
        ["kr-advanced-chemical-plant"] = {crafting_categories = {"ei_advanced-chem-plant", "chemistry"}, localised_name = {"item-name.kr-advanced-chemical-plant"}},
        ["kr-crusher"] = {crafting_categories = {"ei_crushing"}, crafting_speed = 12, localised_name = {"item-name.kr-crusher"}},
        ["kr-filtration-plant"] = {crafting_categories = {"ei_purifier", "fluid-filtration"}, crafting_speed = 3, module_slots = 6},
        ["kr-quantum-computer"] = {crafting_speed = 2},
        ["kr-advanced-assembling-machine"] = {crafting_speed = 8, crafting_categories = {"crafting", "basic-crafting", "advanced-crafting", "crafting-with-fluid"}, module_slots = 6, energy_usage = "10MW",},
        ["ei_quantum-computer"] = {crafting_categories = {"ei_quantum-computer", "t4-tech-cards", "t3-tech-cards", "t2-tech-cards"}, crafting_speed = 10, localised_name = {"item-name.kr-ai-core"}}, -- from 1x
        ["kr-atmospheric-condenser"] = {crafting_categories = {"ei_atmosphere-condensation", "ei_lufter"}, crafting_speed = 4},
    },
    ["lab"] = {
        ["kr-crash-site-lab-repaired"] = {inputs = {"ei_dark-age-tech"}},
        ["lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech"}},
        ["biusart-lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech", "ei_computer-age-tech"}, researching_speed = 2},
        ["kr-singularity-lab"] = {inputs = {"ei_dark-age-tech", "ei_steam-age-tech", "ei_electricity-age-tech", "ei_computer-age-tech", "ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech", "ei_quantum-age-tech"}, researching_speed = 4},
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
        --["ei_imersite-quantum-age-tech"] = {subgroup = "ei_science-science"},
        --["ei_matter-quantum-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_exotic-age-tech"] = {subgroup = "ei_science-science"},
        ["ei_black-hole-exotic-age-tech"] = {subgroup = "ei_science-science"},
    },
    ["item"] = {
        ["underground-belt"] = {subgroup = "underground-belt"},
        ["fast-underground-belt"] = {subgroup = "underground-belt"},
        ["express-underground-belt"] = {subgroup = "underground-belt"},
        ["kr-advanced-underground-belt"] = {subgroup = "underground-belt"},
        ["kr-superior-underground-belt"] = {subgroup = "underground-belt"},
        --["ei_neo-underground-belt"] = {subgroup = "underground-belt"},

        ["splitter"] = {subgroup = "splitter-belt"},
        ["fast-splitter"] = {subgroup = "splitter-belt"},
        ["express-splitter"] = {subgroup = "splitter-belt"},
        ["kr-advanced-splitter"] = {subgroup = "splitter-belt"},
        ["kr-superior-splitter"] = {subgroup = "splitter-belt"},
        --["ei_neo-splitter"] = {subgroup = "splitter-belt"},

        ["kr-loader"] = {subgroup = "loader-belt"},
        ["kr-fast-loader"] = {subgroup = "loader-belt"},
        ["kr-express-loader"] = {subgroup = "loader-belt"},
        ["kr-advanced-loader"] = {subgroup = "loader-belt"},
        ["kr-superior-loader"] = {subgroup = "loader-belt"},

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
        --["basic-tech-card"] = {subgroup = "ei_science-other"},
        ["automation-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["logistic-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["military-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["chemical-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["production-science-pack"] = {subgroup = "ei_science-kr-cards", order = "b07[utility-tech-card]-a"},
        ["utility-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["space-science-pack"] = {subgroup = "ei_science-kr-cards"},
        ["matter-tech-card"] = {subgroup = "ei_science-kr-cards", order = "b07[utility-tech-card]-b"},
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

        --energy
        ["kr-wind-turbine"] = {order = "d[solar-panel]-a"},
        ["kr-antimatter-reactor"] = {order = "c-g", subgroup = "ei_nuclear-buildings"},
        ["steam-turbine"] = {order = "b[steam-power]-b[steam-engine]-a"},
        ["heat-exchanger"] = {order = "b[steam-power]-a[fluid-boiler]-a"},
        ["charged-antimatter-fuel-cell"] = {fuel_value = "1TJ"},

        --machinery
        ["kr-quarry-drill"] = {order = "a[items]-a[stone-quarry]-c"},
        ["kr-advanced-assembling-machine"] = {order = "c[assembling-machine-3]-d"},
        ["kr-crusher"] = {order = "d-a-a-3"},
        ["kr-atmospheric-condenser"] = {order = "d-a-c-"},
        ["kr-filtration-plant"] = {order = "d-a-c-2-a"},
        ["kr-greenhouse"] = {order = "d-a-c-7"},
        ["kr-bio-lab"] = {order = "d-a-c-8"},
        ["kr-electrolysis-plant"] = {order = "d-a-c-9"},
        ["kr-fluid-burner"] = {order = "d-a-c-9-1"},

        ["ei_advanced-port"] = {order = "c[signal]-[roboport]-2"},
        ["pipe-to-ground"] = {order = "a[pipe]-a[pipe-to-ground]"},
        ["kr-steel-pipe"] = {order = "a[pipe]-b[pipe]"},
        ["kr-steel-pipe-to-ground"] = {order = "a[pipe]-b[pipe-to-ground]"},
        ["kr-advanced-solar-panel"] = {order = "d[solar-panel]-b[ei_solar-panel-4]"},
        ["ei_quantum-computer"] = {order = "f3[research-servers]-b2", subgroup = "production-machine", localised_name = {"item-name.kr-ai-core"}},
        ["kr-crusher"] = {localised_name = {"item-name.kr-crusher"}},

        ["biusart-lab"] = {order = "a3", subgroup = "ei_labs"},
        ["kr-singularity-lab"] = {order = "a4", subgroup = "ei_labs"},
        ["ei_big-lab"] = {order = "a5", subgroup = "ei_labs"},
        ["kr-advanced-chemical-plant"] = {localised_name = {"item-name.kr-advanced-chemical-plant"}},

        --intermediates
        ["quartz"] = {subgroup = "ei_refining-secondary", order = "c-a"}, --
        ["silicon"] = {subgroup = "ei_refining-secondary", order = "c-b", localised_name = {"item-name.kr-silicon"}}, 
        ["rare-metals"] = {subgroup = "ei_refining-ingot", order = "a7"}, -- 2 recipes
        ["imersium-plate"] = {subgroup = "ei_refining-plate", order = "a7"},
        ["enriched-iron"] = {subgroup = "ei_refining-secondary", order = "c-d"}, --
        ["enriched-copper"] = {subgroup = "ei_refining-secondary", order = "c-e"}, -- 
        ["enriched-rare-metals"] = {subgroup = "ei_refining-secondary", order = "c-d"}, -- 
        ["lithium-chloride"] = {subgroup = "ei_refining-secondary", order = "c-f"}, --
        ["lithium"] = {subgroup = "ei_refining-secondary", order = "c-g", localised_name = {"item-name.kr-lithium"}}, --
        ["imersite-powder"] = {subgroup = "ei_refining-crushed", order = "c2"},
        ["imersium-beam"] = {subgroup = "ei_refining-beam", order = "a4"},
        ["imersium-gear-wheel"] = {subgroup = "ei_refining-parts", order = "a4"},
    },
    ["mining-drill"] = {
        ["electric-mining-drill"] = {next_upgrade = "ei_advanced-electric-mining-drill"},
        ["ei_steam-oil-pumpjack"] = {resource_categories = {"oil"}},
        ["ei_deep-pumpjack"] = {resource_categories = {"ei_pumping", "basic-fluid", "oil"}},
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
        }},
        --[[ -- why does this not work? manually overwrite below
        ["express-transport-belt"] = {category = "crafting-with-fluid", ingredients = {
            {type = "item", name = "fast-transport-belt", amount = 1},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 1},
        }},
        ]]
        ["express-underground-belt"] = {category = "crafting-with-fluid", ingredients = {
            {type = "item", name = "fast-underground-belt", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 4},
        }},
        -- intermediates
        ["quartz"] = {subgroup = "ei_refining-secondary", order = "c-a", category = "advanced-crafting"},
        ["rare-metals"] = {subgroup = "ei_refining-ingot", order = "a7"}, -- 2 recipes
        ["rare-metals-2"] = {subgroup = "ei_refining-ingot", order = "a7"}, -- 2 recipes
        ["enriched-iron"] = {subgroup = "ei_refining-secondary", order = "c-d"},
        ["enriched-copper"] = {subgroup = "ei_refining-secondary", order = "c-e"},
        ["enriched-rare-metals"] = {subgroup = "ei_refining-secondary", order = "c-d"},
        ["lithium-chloride"] = {subgroup = "ei_refining-secondary", order = "c-f"},
        ["lithium"] = {subgroup = "ei_refining-secondary", order = "c-g"},

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
        ["kr-advanced-loader"] = {category = "crafting-with-fluid"},
        -- fuel refining
        ["rocket-fuel"] = {category = "fuel-refinery"},
        ["ei_diesel-fuel-unit"] = {category = "fuel-refinery"},
        ["ei_drill-fluid"] = {category = "fuel-refinery"},
        ["ei_kerosene__heavy-oil"] = {category = "fuel-refinery"},
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
        -- k2 science cards + multiplication of ei times
        ["utility-science-pack"] = {category = "t2-tech-cards"},
        ["production-science-pack"] = {category = "t3-tech-cards"},
        ["space-science-pack"] = {category = "t4-tech-cards"},
        ["matter-tech-card"] = {category = "t4-tech-cards"},
        ["advanced-tech-card"] = {category = "t4-tech-cards"},
        ["ei_superior-data"] = {energy_required = 50},
        ["ei_plasma-data__deuterium"] = {energy_required = 50},
        ["ei_plasma-data__protium"] = {energy_required = 50},
        ["ei_plasma-data__tritium"] = {energy_required = 50},
        ["ei_magnet-data"] = {energy_required = 50},
        ["ei_fusion-data"] = {energy_required = 50},
    },
    ["armor"] = {
        ["ei_bio-armor"] = {order = "h"},  
    },
    ["equipment-grid"] = {
        ["ei_bio-armor"] = {equipment_categories = {"armor", "universal-equipment", "robot-interaction-equipment"}},
    },
    ["solar-panel-equipment"] = {
        ["imersite-solar-panel-equipment"] = {power = "300kW"},
        ["big-imersite-solar-panel-equipment"] = {power = "1400kW"},
    },
    ["energy-shield-equipment"] = {
        ["ei_personal-shield"] = {max_shield_value = 1500, energy_per_shield = "50kJ"},
    },
    ["generator-equipment"] = {
        ["nuclear-reactor-equipment"] = {
            burner = {
                type = "burner", fuel_categories = {"ei_nuclear-fuel"},
                effectivity = 0.25, fuel_inventory_size = 3, burnt_inventory_size = 3
            },
        },
        ["ei_personal-reactor"] = {
            burner = {
                type = "burner", fuel_categories = {"ei_fusion-fuel"},
                effectivity = 1, fuel_inventory_size = 1, burnt_inventory_size = 1
            },
        },
    },
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
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.5
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
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.5
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
    "kr-fusion-energy",
    "kr-singularity-tech-card",
    "automation-science-pack",
}

-- turn K2 fusion into something crystal energy powered

local new_prerequisites = {
    ["steam-age"] = {
        ["kr-automation-core"] = {{"ei_steam-age"},{"ei_steam-assembler"},true},
    },
    ["electricity-age"] = {
        ["kr-gas-power-station"] = {{"ei_fluid-boiler", "advanced-circuit"},{},false},
        ["kr-greenhouse"] = {{"ei_electricity-age"},{},false},
        ["logistics-2"] = {{"plastics", "logistics", "fast-inserter"},{},false},
        ["kr-advanced-lab"] = {{"advanced-circuit"},{"ei_computer-age"},true},
        ["kr-steel-fluid-handling"] = {{"fluid-handling", "electric-engine"},{},true},
        ["kr-steel-fluid-tanks"] = {{"kr-steel-fluid-handling"},{},false},
        ["advanced-radar"] = {{"kr-radar", "ei_electronic-parts"},{},false},
        ["advanced-circuit"] = {{"kr-silicon-processing", "sulfur-processing"},{},false},
        ["kr-research-server"] = {{"advanced-circuit", "ei_grower"},{"ei_computer-age"},true},
        ["kr-air-purification"] = {{"advanced-circuit"},{},true},
        ["kr-fuel"] = {{"ei_destill-tower"},{},false},
        ["ei_grower"] = {{"sulfur-processing", "kr-silicon-processing"},{},false},
        ["railway"] = {{"sulfur-processing", "kr-fuel"},{},false},
    },
    ["computer-age"] = {
        ["logistics-3"] = {{"kr-fluids-chemistry", "logistics-2"},{},false},
        ["kr-fluids-chemistry"] = {{"ei_computer-age"},{"kr-atmosphere-condensation", "kr-mineral-water-gathering"},true},
        ["kr-fluid-excess-handling"] = {{"kr-fluids-chemistry"},{},false},
        ["kr-railgun-turret"] = {{"military-4", "kr-fluids-chemistry", "ei_cannon-turret"},{},false},
        ["ei_nitric-acid"] = {{"ei_dinitrogen-tetroxide"},{},false},
        ["bulk-inserter"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_deep-pumpjack"] = {{"kr-fluids-chemistry"},{},false},
        ["ei_cooler"] = {{"kr-fluids-chemistry"},{},false},
        ["kr-nuclear-reactor-equipment"] = {{"fission-reactor-equipment"},{},false},
        ["ei_high-energy-crystal"] = {{"kr-fluids-chemistry"},{},false},
        ["kr-singularity-lab"] = {{"ei_computer-core"},{"ei_advanced-computer-age-tech", "ei_knowledge-computer-age-tech"},true},
    },
    ["advanced-computer-age"] = {
        ["kr-enriched-ores"] = {{"ei_silicon"},{},false},
        ["kr-improved-pollution-filter"] = {{"processing-unit", "kr-air-purification"},{},true},
        ["kr-advanced-exoskeleton-equipment"] = {{"exoskeleton-equipment"},{},true},
        ["kr-quantum-computer"] = {{"processing-unit"},{"ei_quantum-age"},true},
    },
    ["knowledge-computer-age"] = {
        ["kr-logistic-4"] = {{"ei_computer-core", "logistics-3"},{},false},
        ["kr-atmosphere-condensation"] = {{"automation-3", "ei_oxygen-gas"},{},false},
        ["kr-advanced-chemistry"] = {{"kr-atmosphere-condensation", "kr-mineral-water-gathering", "ei_advanced-chem-plant"},{},true},
        ["kr-bio-processing"] = {{"ei_sus-plating"},{},true},
        ["kr-bio-fuel"] = {{"kr-advanced-chemistry"},{},false},
        ["kr-nuclear-locomotive"] = {{"automation-3", "nuclear-power"},{},false},
    },
    ["quantum-age"] = {
        ["kr-quarry-minerals-extraction"] = {{"ei_quantum-age", "ei_excavator"},{},false},
        ["kr-logistic-5"] = {{"kr-imersium-processing", "kr-logistic-4"},{},false},
        ["ei_odd-plating"] = {{"ei_nano-factory", "ei_oxygen-difluoride", "kr-quarry-minerals-extraction"},{},false},
        ["ei_big-lab"] = {{"ei_quantum-age"},{"ei_fusion-data", "ei_moon-exploration"},true},
        ["kr-ai-core"] = {{"kr-quarry-minerals-extraction"},{"ei_quantum-computer"},true},
        ["kr-battery-mk3-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersite-night-vision-equipment"] = {{"ei_quantum-computer"},{},false},
        ["kr-imersium-processing"] = {{"kr-quarry-minerals-extraction", "ei_nano-factory", "ei_oxygen-difluoride", "ei_big-lab", "ei_quantum-computer"},{"kr-energy-control-unit"},true},
        ["kr-lithium-processing"] = {{"ei_oxygen-difluoride"},{"ei_fusion-data"},false},
    },
    ["fusion-quantum-age"] = {
        ["kr-battery-mk3-equipment"] = {{"kr-lithium-sulfur-battery"},{},false},
        ["kr-battery-mk3-equipment"] = {{"kr-lithium-sulfur-battery"},{},false},
        ["kr-lithium-sulfur-battery"] = {{"kr-lithium-processing", "ei_odd-plating"},{},false},
        ["kr-energy-control-unit"] = {{"kr-lithium-sulfur-battery", "ei_clean-plating", "ei_big-lab", "kr-imersium-processing"},{},false},
    },
    ["imersite-quantum-age"] = {
        ["kr-superior-exoskeleton-equipment"] = {{"kr-advanced-exoskeleton-equipment", "kr-imersium-processing"},{},true},
        ["kr-advanced-solar-panel"] = {{"ei_solar-panel-3", "kr-imersium-processing"},{},true},
        ["kr-advanced-chemical-plant"] = {{"ei_fish-growing", "kr-imersium-processing", "ei_advanced-chem-plant"},{},true},
        ["kr-advanced-roboports"] = {{"kr-imersium-processing"},{},true}, --
        ["kr-imersite-solar-panel-equipment"] = {{"ei_personal-solar-3", "kr-imersium-processing"},{},true},
        ["kr-crusher"] = {{"ei_advanced-crusher", "ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-advanced-furnace"] = {{"ei_nano-factory", "kr-imersium-processing"},{},true},
        ["kr-power-armor-mk3"] = {{"kr-imersium-processing"},{},false},
        ["kr-automation"] = {{"kr-imersium-processing", "ei_neo-assembler"},{},true},
        ["kr-superior-inserters"] = {{"kr-imersium-processing", "bulk-inserter"},{},true},
        ["kr-logistic-5"] = {{"kr-imersium-processing", "bulk-inserter"},{},true},
        ["kr-energy-storage"] = {{"kr-imersium-processing"},{"ei_superior-induction-matrix"},true},
        ["kr-personal-laser-defense-mk4-equipment"] = {{"kr-personal-laser-defense-mk3-equipment"},{},false},
    },
    ["matter-quantum-age"] = {
        ["kr-advanced-pickaxe"] = {{"kr-energy-control-unit"},{},false},
        ["kr-singularity-beacon"] = {{"kr-energy-control-unit", "ei_iron-beacon"},{},false},
        ["kr-matter-cube"] = {{"kr-energy-control-unit"},{},false},
        ["kr-matter-processing"] = {{"kr-energy-control-unit"},{},false},
        ["kr-laser-artillery-turret"] = {{"kr-energy-control-unit", "kr-military-5"},{},false},
        ["kr-power-armor-mk4"] = {{"kr-power-armor-mk3", "kr-energy-control-unit"},{},false},
        ["kr-creep-virus"] = {{"kr-military-5", "kr-energy-control-unit"},{},false},
        ["kr-biter-virus"] = {{"kr-creep-virus"},{},false},
    },
    ["four-quantum-age"] = {
        ["ei_high-tech-parts"] = {{"kr-matter-processing", "ei_asteroid-mining", "ei_eu-circuit", "kr-matter-cube"},{},false},
        ["ei_neo-logistics"] = {{"kr-logistic-5"},{},false},
        ["kr-planetary-teleporter"] = {{"ei_high-tech-parts"},{},false},
        ["ei_bio-armor"] = {{"kr-power-armor-mk4", "ei_high-tech-parts"},{},false},
        ["ei_plasma-turret"] = {{"ei_high-tech-parts", "kr-laser-artillery-turret"},{},false},
        ["kr-antimatter-reactor"] = {{"ei_antimatter-cube"},{},false},
        ["kr-antimatter-ammo"] = {{"kr-antimatter-reactor", "kr-laser-artillery-turret", "kr-rocket-turret"},{},false},
        ["kr-antimatter-reactor-equipment"] = {{"kr-antimatter-reactor", "ei_personal-reactor"},{},false},
        ["ei_personal-shield"] = {{"kr-energy-shield-mk4-equipment", "ei_high-tech-parts"},{},false},
    },
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

            local next_age = "ei_"..ages_dummy_dict[age].."__dummy"
            
            if next_age then
                --set_prerequisites(next_age, i)
                --table.insert(data.raw["technology"][tech].prerequisites, prerequisite)
                ei_lib.add_prerequisite(next_age, i)
            end

            -- find out if the tech already has the age count effect
            for _, effect in pairs(data.raw.technology[i].effects) do
                if ((effect.type == "nothing") and (effect.effect_description == {"description.tech-counts-for-age-progression"})) then
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
    --["ei_pure-iron"] = { item = "iron-ore", use_icon = false },
    --["ei_pure-copper"] = { item = "copper-ore", use_icon = false },
    ["ei_steel-mechanical-parts"] = { item = "steel-gear-wheel", use_icon = false },
    ["ei_coke"] = { item = "coke", use_icon = false },
    ["ei_sand"] = { item = "sand", use_icon = false },
    ["ei_electronic-parts"] = { item = "electronic-components", use_icon = false },
    ["ei_glass"] = {item = "glass", use_icon = true},
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

local entites_to_hide = {
    {"generator", "kr-fusion-reactor"},
    {"mining-drill", "kr-electric-mining-drill-mk2"},
    {"mining-drill", "kr-electric-mining-drill-mk3"},
    {"beacon", "beacon"},
}

-- hide entities
for _, foo in ipairs(entites_to_hide) do
    local entity_type = foo[1]
    local entity_name = foo[2]

    if data.raw[entity_type][entity_name] then
        data.raw[entity_type][entity_name].hidden = true

        -- also remove next upgrade
        data.raw[entity_type][entity_name].next_upgrade = nil
    end
end


local items_to_hide = {
    "kr-fusion-reactor",
    "kr-electric-mining-drill-mk2",
    "kr-electric-mining-drill-mk3",
    "beacon",
    "coke",
    "tritium",
    "iron-stick",
    "iron-gear-wheel",
    "iron-beam",
    "steel-beam",
    "steel-gear-wheel",
    "empty-dt-fuel",
    "dt-fuel",
    "biters-research-data",
    "matter-research-data",
    "space-research-data",
    "singularity-tech-card",
}

-- hide items
for _, item in ipairs(items_to_hide) do
    if data.raw.item[item] then
        data.raw.item[item].hidden = true

        -- also remove the place result
        data.raw.item[item].place_result = nil
    end
end

local recipe_to_hide = {
    "iron-beam",
    "steel-beam",
    "steel-gear-wheel",
    "dirty-water-filtration-1",
    "dirty-water-filtration-2",
    "dirty-water-filtration-3",
    "coal-filtration", -- balance this and unhide?
    "basic-tech-card",
    "matter-to-copper-ore",
    "matter-to-iron-ore",
    "copper-ore-to-matter",
    "iron-ore-to-matter",
    "glass",

    -- advanced assembler stuff
    "kr-s-c-iron-beam",
    "kr-s-c-iron-beam-enriched",
    "kr-s-c-steel-beam",
    "kr-s-c-steel-gear-wheel",
    "kr-s-c-imersium-beam",
    "kr-s-c-imersium-gear-wheel",
    "kr-s-c-copper-cable-enriched",
    "kr-s-c-copper-cable",
    "kr-s-c-electronic-components",
    "kr-s-c-iron-stick",
    "kr-s-c-iron-stick-enriched",
    "kr-s-c-iron-gear-wheel",
    "kr-s-c-iron-gear-wheel-enriched",
}

local hard_recipe_overwrite = {
    ["automation-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 2},
        {type = "item", name = "ei_iron-mechanical-parts", amount = 1},
    },
    ["logistic-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 2},
        {type = "item", name = "ei_copper-mechanical-parts", amount = 1},
    },
    ["chemical-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 4},
        {type = "item", name = "electronic-circuit", amount = 3},
        {type = "item", name = "automation-core", amount = 1},
    },
    ["utility-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 6},
        {type = "item", name = "ei_electronic-parts", amount = 3},
        {type = "item", name = "decider-combinator", amount = 2},
    },
    ["production-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 6},
        {type = "item", name = "ei_space-data", amount = 2},
        {type = "item", name = "ei_simulation-data", amount = 20},
    },
    ["space-science-pack"] = {
        {type = "item", name = "blank-tech-card", amount = 10},
        {type = "item", name = "ei_space-data", amount = 4},
        {type = "item", name = "ei_moon-fish", amount = 1},
    },
    ["matter-tech-card"] = {
        {type = "item", name = "blank-tech-card", amount = 10},
        {type = "item", name = "ei_crushed-iron", amount = 1},
        {type = "item", name = "ei_crushed-copper", amount = 1},
        {type = "item", name = "ei_crushed-gold", amount = 1},
        {type = "item", name = "ei_crushed-sulfur", amount = 1},
        {type = "item", name = "ei_crushed-coal", amount = 1},
        {type = "item", name = "ei_sand", amount = 1},
        {type = "item", name = "ei_crushed-uranium", amount = 1},
        {type = "item", name = "ei_crushed-neodym", amount = 1},
        --{type = "item", name = "ei_fluorite", amount = 1},
        --{type = "item", name = "ei_lithium-crystal", amount = 1},
        {type = "item", name = "imersite-crystal", amount = 1},
        {type = "item", name = "rare-metals", amount = 1},
    },
    ["advanced-tech-card"] = {
        {type = "item", name = "blank-tech-card", amount = 10},
        {type = "item", name = "ei_superior-data", amount = 10},
        {type = "item", name = "ei_cavity", amount = 1},
    },
}

local recipe_overwrite = {
    -- machinery
    ["inserter-parts"] = {
        {type = "item", name = "ei_iron-mechanical-parts", amount = 1},
        {type = "item", name = "ei_copper-mechanical-parts", amount = 1},
    },
    ["kr-atmospheric-condenser"] = {
        {type = "item", name = "ei_lufter", amount = 4},
        {type = "item", name = "ei_advanced-motor", amount = 4},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
    },
    ["kr-electrolysis-plant"] = {
        {type = "item", name = "chemical-plant", amount = 1},
        {type = "item", name = "ei_electronic-parts", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
    },
    ["kr-research-server"] = {
        {type = "item", name = "lab", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 6},
        {type = "item", name = "ei_energy-crystal", amount = 4},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 6},
    },
    ["kr-quantum-computer"] = {
        {type = "item", name = "kr-research-server", amount = 1},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "ei_high-energy-crystal", amount = 4},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 6},
    },
    ["kr-advanced-assembling-machine"] = {
        {type = "item", name = "ei_neo-assembler", amount = 2},
        {type = "item", name = "ei_advanced-motor", amount = 12},
        {type = "item", name = "ei_carbon-structure", amount = 10},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "imersium-gear-wheel", amount = 6},
        {type = "item", name = "imersium-beam", amount = 14},
    },
    ["kr-advanced-chemical-plant"] = {
        {type = "item", name = "ei_advanced-chem-plant", amount = 2},
        {type = "item", name = "ei_advanced-motor", amount = 12},
        {type = "item", name = "ei_carbon-structure", amount = 10},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "imersium-gear-wheel", amount = 6},
        {type = "item", name = "imersium-beam", amount = 14},
    },
    ["kr-advanced-furnace"] = {
        {type = "item", name = "electric-furnace", amount = 4},
        {type = "item", name = "ei_advanced-motor", amount = 12},
        {type = "item", name = "ei_carbon-structure", amount = 24},
        {type = "item", name = "processing-unit", amount = 2},
        {type = "item", name = "imersium-gear-wheel", amount = 6},
        {type = "item", name = "imersium-beam", amount = 14},
    },
    ["kr-crusher"] = {
        {type = "item", name = "ei_advanced-crusher", amount = 2},
        {type = "item", name = "ei_advanced-motor", amount = 12},
        {type = "item", name = "ei_carbon-structure", amount = 10},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "imersium-gear-wheel", amount = 6},
        {type = "item", name = "imersium-beam", amount = 14},
    },
    ["kr-filtration-plant"] = {
        {type = "item", name = "ei_advanced-motor", amount = 10},
        {type = "item", name = "storage-tank", amount = 2},
        {type = "item", name = "ei_purifier", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 8},
    },
    ["kr-advanced-solar-panel"] = {
        {type = "item", name = "ei_solar-panel-3", amount = 2},
        {type = "item", name = "ei_carbon-structure", amount = 6},
        {type = "item", name = "processing-unit", amount = 2},
        {type = "item", name = "imersium-plate", amount = 4},
        {type = "item", name = "imersite-crystal", amount = 12},
    },
    ["kr-singularity-lab"] = {
        {type = "item", name = "biusart-lab", amount = 1},
        {type = "item", name = "ei_simulation-data", amount = 100},
        {type = "item", name = "ei_energy-crystal", amount = 24},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 8},
    },
    ["ei_big-lab"] = {
        {type = "item", name = "kr-singularity-lab", amount = 1},
        {type = "item", name = "ei_computing-unit", amount = 10},
        {type = "item", name = "ei_high-energy-crystal", amount = 20},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 80},
    },
    ["kr-gas-power-station"] = {
        {type = "item", name = "ei_fluid-boiler", amount = 1},
        {type = "item", name = "steam-engine", amount = 1},
        {type = "item", name = "advanced-circuit", amount = 6},
        {type = "item", name = "electric-engine-unit", amount = 20},
        {type = "item", name = "ei_copper-mechanical-parts", amount = 12},
    },
    ["kr-energy-storage"] = {
        {type = "item", name = "accumulator", amount = 4},
        {type = "item", name = "processing-unit", amount = 10},
        {type = "item", name = "imersium-beam", amount = 12},
        {type = "item", name = "ei_magnet", amount = 2},
    },
    ["kr-small-roboport"] = {
        {type = "item", name = "roboport", amount = 1},
        {type = "item", name = "processing-unit", amount = 1},
        {type = "item", name = "imersium-beam", amount = 2},
    },
    ["kr-large-roboport"] = {
        {type = "item", name = "kr-small-roboport", amount = 4},
        {type = "item", name = "ei_magnet", amount = 10},
        {type = "item", name = "imersium-beam", amount = 12},
        {type = "item", name = "imersium-gear-wheel", amount = 20},
    },
    ["kr-quarry-drill"] = {
        {type = "item", name = "ei_excavator", amount = 1},
        {type = "item", name = "processing-unit", amount = 4},
        {type = "item", name = "rare-metals", amount = 20},
    },
    ["kr-singularity-beacon"] = {
        {type = "item", name = "ei_iron-beacon", amount = 1},
        {type = "item", name = "energy-control-unit", amount = 4},
        {type = "item", name = "imersium-beam", amount = 6},
    },
    ["kr-antimatter-reactor"] = {
        {type = "item", name = "ei_fusion-reactor", amount = 1},
        {type = "item", name = "ei_neutron-collector", amount = 4},
        {type = "item", name = "energy-control-unit", amount = 50},
        {type = "item", name = "ai-core", amount = 100},
        {type = "item", name = "ei_clean-plating", amount = 250},
        {type = "item", name = "imersium-beam", amount = 500},
        {type = "item", name = "ei_carbon-structure", amount = 100},
    },
    ["kr-intergalactic-transceiver"] = {
        {type = "item", name = "ei_fusion-reactor", amount = 1},
        {type = "item", name = "kr-antimatter-reactor", amount = 1},
        {type = "item", name = "nuclear-reactor", amount = 1},
        {type = "item", name = "ei_high-temperature-reactor", amount = 1},
        {type = "item", name = "ei_high-tech-parts", amount = 100},
        {type = "item", name = "ei_clean-plating", amount = 200},
        {type = "item", name = "imersium-beam", amount = 200},
        {type = "item", name = "ei_carbon-structure", amount = 200},
    },
    ["nuclear-reactor"] = {
        {type = "item", name = "ei_energy-crystal", amount = 100},
        {type = "item", name = "advanced-circuit", amount = 100},
        {type = "item", name = "concrete", amount = 200},
        {type = "item", name = "ei_lead-plate", amount = 200},
        {type = "item", name = "steel-plate", amount = 200},
        {type = "item", name = "ei_fission-tech", amount = 100},
    },
    --armor and stuff
    ["imersite-solar-panel-equipment"] = {
        {type = "item", name = "ei_personal-solar-3", amount = 2},
        {type = "item", name = "ai-core", amount = 20},
        {type = "item", name = "ei_odd-plating", amount = 4},
        {type = "item", name = "imersite-crystal", amount = 10},
        {type = "item", name = "ei_magnet", amount = 6},
        {type = "fluid", name = "ei_nitric-acid", amount = 25},
    },
    ["nuclear-reactor-equipment"] = {
        {type = "item", name = "fission-reactor-equipment", amount = 1},
        {type = "item", name = "rare-metals", amount = 30},
        {type = "item", name = "ei_simulation-data", amount = 20},
        {type = "item", name = "ei_fission-tech", amount = 20},
    },
    ["ei_personal-shield"] = {
        {type = "item", name = "energy-shield-mk4-equipment", amount = 1},
        {type = "item", name = "ei_superior-data", amount = 20},
        {type = "item", name = "ei_high-tech-parts", amount = 10},
    },
    ["power-armor-mk3"] = {
        {type = "item", name = "power-armor-mk2", amount = 1},
        {type = "item", name = "imersium-plate", amount = 20},
        {type = "item", name = "ei_carbon-structure", amount = 24},
        {type = "item", name = "processing-unit", amount = 10},
    },
    ["power-armor-mk4"] = {
        {type = "item", name = "power-armor-mk3", amount = 1},
        {type = "item", name = "energy-control-unit", amount = 20},
        {type = "item", name = "ei_eu-magnet", amount = 14},
        {type = "item", name = "ei_clean-plating", amount = 10},
    },
    ["ei_bio-armor"] = {
        {type = "item", name = "power-armor-mk4", amount = 1},
        {type = "item", name = "ei_high-tech-parts", amount = 20},
        {type = "item", name = "ei_superior-data", amount = 40},
        {type = "item", name = "ei_bio-matter", amount = 100},
    },
    ["kr-railgun-turret"] = {
        {type = "item", name = "ei_cannon-turret", amount = 1},
        {type = "item", name = "rare-metals", amount = 20},
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "ei_electronic-parts", amount = 20},
    },
    ["kr-rocket-turret"] = {
        {type = "item", name = "ei_cannon-turret", amount = 1},
        {type = "item", name = "rare-metals", amount = 20},
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "heavy-rocket-launcher", amount = 6},
        {type = "item", name = "processing-unit", amount = 20},
    },
    ["kr-nuclear-locomotive"] = {
        {type = "item", name = "locomotive", amount = 1},
        {type = "item", name = "rare-metals", amount = 80},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 20},
        {type = "item", name = "ei_advanced-motor", amount = 20},
        {type = "item", name = "ei_electronic-parts", amount = 20},
    },

    -- intermediates
    ["electric-engine-unit"] = {
        {type = "item", name = "automation-core", amount = 1},
        {type = "item", name = "engine-unit", amount = 1},
        {type = "item", name = "copper-cable", amount = 4},
    },
    ["ei_high-tech-parts"] = {
        {type = "item", name = "ei_eu-magnet", amount = 1},
        {type = "item", name = "ei_eu-circuit", amount = 1},
        {type = "item", name = "ei_plasma-cube", amount = 1},
        {type = "item", name = "ei_exotic-matter-up", amount = 1},
        {type = "item", name = "matter-cube", amount = 1},
        {type = "item", name = "charged-matter-stabilizer", amount = 1},
    },
    ["energy-control-unit"] = {
        {type = "item", name = "lithium-sulfur-battery", amount = 3},
        {type = "item", name = "ei_electronic-parts", amount = 4},
        {type = "item", name = "ei_carbon-structure", amount = 3},
        {type = "item", name = "imersite-crystal", amount = 2},
        {type = "item", name = "ei_superior-data", amount = 1},
    },
    ["rocket-fuel"] = {
        {type = "item", name = "iron-plate", amount = 1},
        {type = "item", name = "solid-fuel", amount = 1},
        {type = "fluid", name = "ei_liquid-oxygen", amount = 25},
        {type = "fluid", name = "ei_kerosene", amount = 15},
    },
    ["charged-antimatter-fuel-cell"] = {
        {type = "item", name = "empty-antimatter-fuel-cell", amount = 1},
        {type = "item", name = "lithium", amount = 10},
        {type = "item", name = "ei_charged-neutron-container", amount = 1},
        {type = "item", name = "ei_antimatter-cube", amount = 1},
    },

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
    ["fast-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "inserter", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 6},
    },
    ["bulk-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 2},
        {type = "item", name = "fast-inserter", amount = 1},
        {type = "item", name = "ei_electronic-parts", amount = 1},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
    },
    ["bulk-inserter"] = {
        {type = "item", name = "inserter-parts", amount = 2},
        {type = "item", name = "fast-inserter", amount = 1},
        {type = "item", name = "ei_electronic-parts", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
    },
    -- belts and stuff
    ["kr-advanced-transport-belt"] = {
        {type="item", name="express-transport-belt", amount=1},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=15},
    },
    ["kr-advanced-underground-belt"] = {
        {type="item", name="express-underground-belt", amount=2},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=35},
    },
    ["kr-advanced-splitter"] = {
        {type="item", name="express-splitter", amount=1},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=55},
    },
    ["kr-advanced-laoder"] = {
        {type="item", name="kr-express-loader", amount=2},
        {type="item", name="ei_steel-mechanical-parts", amount=5},
        {type="item", name="ei_condensed-cryodust", amount=1},
        {type="fluid", name="lubricant", amount=55},
    },

    ["ei_neo-belt"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
        {type = "item", name = "kr-superior-transport-belt", amount = 2},
        {type = "item", name = "ei_carbon-structure", amount = 2},
        {type = "item", name = "ei_enriched-cryodust", amount = 1},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
    },
    ["ei_neo-splitter"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
        {type = "item", name = "kr-superior-splitter", amount = 2},
        {type = "item", name = "ei_carbon-structure", amount = 4},
        {type = "item", name = "ei_enriched-cryodust", amount = 2},
        {type = "item", name = "processing-unit", amount = 5},
    },
    ["ei_neo-underground-belt"] = {
        {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
        {type = "item", name = "kr-superior-underground-belt", amount = 4},
        {type = "item", name = "ei_carbon-structure", amount = 10},
        {type = "item", name = "ei_enriched-cryodust", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 30},
    },

    -- science packs and their tech cards
    ["blank-tech-card"] = {
        {type = "item", name = "stone", amount = 1},
        {type = "item", name = "iron-plate", amount = 2},
    },
    ["ei_dark-age-tech"] = {
        {type = "item", name = "inserter-parts", amount = 1},
        {type = "item", name = "automation-science-pack", amount = 1},
    },
    ["ei_steam-age-tech"] = {
        {type = "item", name = "ei_steam-engine", amount = 1},
        {type = "item", name = "logistic-science-pack", amount = 1},
    },
    ["ei_electricity-age-tech"] = {
        {type = "item", name = "engine-unit", amount = 2},
        {type = "item", name = "ei_steel-mechanical-parts", amount = 3},
        {type = "item", name = "chemical-science-pack", amount = 5},
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
        {type = "item", name = "rare-metals", amount = 4},
        {type = "item", name = "utility-science-pack", amount = 5},
    },
    ["ei_quantum-age-tech"] = {
        {type = "item", name = "ei_high-energy-crystal", amount = 2},
        {type = "item", name = "ei_computing-unit", amount = 5},
        {type = "item", name = "production-science-pack", amount = 5},
    },
    ["ei_fusion-quantum-age-tech"] = {
        {type = "item", name = "ei_charged-neutron-container", amount = 1},
        {type = "item", name = "ei_fusion-data", amount = 5},
        {type = "item", name = "production-science-pack", amount = 5},
    },
    ["ei_space-quantum-age-tech"] = {
        {type = "item", name = "ei_advanced-rocket-fuel", amount = 4},
        {type = "item", name = "space-science-pack", amount = 1},
    },
    ["ei_exotic-age-tech"] = {
        {type = "item", name = "ei_high-tech-parts", amount = 2},
        {type = "item", name = "advanced-tech-card", amount = 1},
    },
}

ei_lib.recipe_add("ei_simulation-data", "blank-tech-card", 3)
ei_lib.recipe_add("ei_superior-data", "blank-tech-card", 10)
ei_lib.recipe_add("ei_plasma-data__deuterium", "blank-tech-card", 10)
ei_lib.recipe_add("ei_plasma-data__tritium", "blank-tech-card", 10)
ei_lib.recipe_add("ei_plasma-data__protium", "blank-tech-card", 10)
ei_lib.recipe_add("ei_magnet-data", "blank-tech-card", 10)
ei_lib.recipe_add("ei_fusion-data", "blank-tech-card", 10)
ei_lib.recipe_add("ei_fission-tech", "blank-tech-card", 4)
ei_lib.recipe_add("ei_fission-tech__pt239", "blank-tech-card", 10)
ei_lib.recipe_add("ei_fission-tech__th232", "blank-tech-card", 10)
ei_lib.recipe_add("ei_fission-tech__u233", "blank-tech-card", 10)
ei_lib.recipe_add("ei_fission-tech__u235", "blank-tech-card", 10)

-- machinery and other
-------------------------------------------------------------------------------
ei_lib.recipe_add("ei_quantum-computer", "kr-quantum-computer", 1)
ei_lib.add_unlock_recipe("ei_electricity-power", "kr-wind-turbine")

data.raw["solar-panel"]["kr-advanced-solar-panel"].production = "1280kW"


-- ressouces
-------------------------------------------------------------------------------
data.raw.recipe["iron-plate"].icon = nil
data.raw.recipe["iron-plate"].icons = nil
data.raw.recipe["iron-plate"].icon_size = nil

data.raw.recipe["copper-plate"].icon = nil
data.raw.recipe["copper-plate"].icons = nil
data.raw.recipe["copper-plate"].icon_size = nil

data.raw.recipe["rare-metals"].enabled = false
ei_lib.add_unlock_recipe("kr-fluids-chemistry", "rare-metals")


data:extend({
    {
        name = "enriched-iron",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_pure-iron", amount = 9},
            {type = "fluid", name = "sulfuric-acid", amount = 3},
        },
        results = {
            {type = "item", name = "enriched-iron", amount = 9},
            {type = "fluid", name = "ei_dirty-water", amount = 3},
        },
        main_product = "enriched-iron",
        subgroup = "ei_refining-purified",
        order = "b",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "enriched-copper",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_pure-copper", amount = 9},
            {type = "fluid", name = "sulfuric-acid", amount = 3},
        },
        results = {
            {type = "item", name = "enriched-copper", amount = 9},
            {type = "fluid", name = "ei_dirty-water", amount = 3},
        },
        main_product = "enriched-copper",
        subgroup = "ei_refining-purified",
        order = "b",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "enriched-rare-metals",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "raw-rare-metals", amount = 9},
            {type = "fluid", name = "hydrogen-chloride", amount = 10},
        },
        results = {
            {type = "item", name = "enriched-rare-metals", amount = 9},
            {type = "fluid", name = "chlorine", amount = 5},
        },
        main_product = "enriched-rare-metals",
        subgroup = "ei_refining-purified",
        order = "b",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "enriched-iron-plate",
        type = "recipe",
        category = "smelting",
        energy_required = 16,
        ingredients = {
            {type = "item", name = "enriched-iron", amount = 10},
        },
        results = {
            {type = "item", name = "ei_iron-ingot", amount = 20},
        },
        main_product = "ei_iron-ingot",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "enriched-copper-plate",
        type = "recipe",
        category = "smelting",
        energy_required = 16,
        ingredients = {
            {type = "item", name = "enriched-copper", amount = 10},
        },
        results = {
            {type = "item", name = "ei_copper-ingot", amount = 20},
        },
        main_product = "ei_copper-ingot",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "quartz",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "ei_sand", amount = 10},
            {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "item", name = "quartz", amount = 6},
        },
        main_product = "quartz",
        subgroup = "ei_refining-purified",
        order = "b-a",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_bio-matter__biomass",
        type = "recipe",
        category = "bioprocessing",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_bio-matter", amount = 1},
            {type = "item", name = "fertilizer", amount = 1},
            {type = "item", name = "biomass", amount = 10},
            {type = "item", name = "ei_cryodust", amount = 4},
            {type = "fluid", name = "chlorine", amount = 10},
        },
        results = {
            {type = "item", name = "ei_bio-matter", amount = 2},
            {type = "item", name = "ei_cryodust", amount = 1, probability = 0.5},
        },
        main_product = "ei_bio-matter",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "imersium-beam__metalworks",
        type = "recipe",
        category = "ei_metalworks",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "imersium-plate", amount = 2},
            {type = "item", name = "steel-plate", amount = 1},
        },
        results = {
            {type = "item", name = "imersium-beam", amount = 1},
        },
        main_product = "imersium-beam",
        hide_from_player_crafting = true,
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "imersium-gear-wheel__metalworks",
        type = "recipe",
        category = "ei_metalworks",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "imersium-plate", amount = 4},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 4},
        },
        results = {
            {type = "item", name = "imersium-gear-wheel", amount = 4},
        },
        main_product = "imersium-gear-wheel",
        hide_from_player_crafting = true,
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_water-from-atmosphere",
        type = "recipe",
        category = "ei_atmosphere-condensation",
        energy_required = 120,
        ingredients = {},
        results = {
            {type = "fluid", name = "water", amount = 25},
        },
        main_product = "water",
        subgroup = "fluid-recipes",
        order = "a",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_antimatter-cube",
        type = "item",
        icon = ei_graphics_item_path.."antimatter-cube.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "r",
        stack_size = 1
    },
    {
        name = "ei_antimatter-cube",
        type = "recipe",
        category = "ei_accelerator",
        energy_required = 100, -- 100s at 100MW = 10GJ
        ingredients = {
            {type = "item", name = "matter-cube", amount = 1},
            {type = "item", name = "ai-core", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 10},
            {type = "item", name = "ei_eu-magnet", amount = 1},
        },
        results = {
            {type = "item", name = "ei_antimatter-cube", amount = 1, probability = 0.5},
            {type = "item", name = "matter-cube", amount = 1, probability = 0.5},
            {type = "item", name = "ai-core", amount = 1, probability = 0.5},
            {type = "item", name = "ei_eu-magnet", amount = 1, probability = 0.5},
        },
        main_product = "ei_antimatter-cube",
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_antimatter-cube",
        type = "technology",
        icon = ei_graphics_tech_path.."antimatter.png",
        icon_size = 128,
        prerequisites = {"ei_accelerator"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_antimatter-cube"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["four-quantum-age"],
            time = 20
        },
        age = "four-quantum-age",
    },
})

-- inserters and belts
-------------------------------------------------------------------------------
ei_lib.recipe_add("ei_steam-inserter", "inserter-parts", 1)
ei_lib.recipe_add("ei_steam-long-inserter", "inserter-parts", 1)
ei_lib.recipe_add("ei_small-inserter-normal", "inserter-parts", 4)
ei_lib.recipe_add("ei_big-inserter-normal", "inserter-parts", 4)
ei_lib.remove_unlock_recipe("logistics", "inserter")
ei_lib.remove_unlock_recipe("logistics", "long-handed-inserter")
ei_lib.remove_unlock_recipe("logistics", "kr-loader")
ei_lib.add_unlock_recipe("fast-inserter", "kr-loader")

-- does not work above, why?
data.raw["item"]["ei_neo-underground-belt"].subgroup = "underground-belt"
data.raw["item"]["ei_neo-splitter"].subgroup = "splitter-belt"

-- science
-------------------------------------------------------------------------------
data.raw.item["automation-science-pack"].flags = nil
data.raw.item["space-science-pack"].flags = nil
data.raw.recipe["automation-science-pack"].enabled = true
data.raw.recipe["blank-tech-card"].enabled = true

data:extend({
    {
        name = "ei_blank-tech-card",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type="item", name="ei_ceramic", amount=3},
            {type="item", name="iron-plate", amount=4},
            {type="item", name="ei_glass", amount=2},
        },
        results = {{type="item", name="blank-tech-card", amount=14}},
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_blank-tech-card__electronic-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 8,
        ingredients = {
            {type="item", name="ei_ceramic", amount=6},
            {type="item", name="iron-plate", amount=6},
            {type="item", name="ei_electronic-parts", amount=2},
        },
        results = {{type="item", name="blank-tech-card", amount=32}},
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_matter-quantum-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type="item", name="ei_clean-plating", amount=2},
            {type="item", name="energy-control-unit", amount=1},
            {type="item", name="matter-tech-card", amount=1},
        },
        results = {{type="item", name="ei_matter-quantum-age-tech", amount=12}},
        enabled = false,
        always_show_made_in = true,
    },
    {
        name = "ei_imersite-quantum-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type="item", name="imersium-plate", amount=2},
            {type="item", name="ei_carbon-structure", amount=1},
            {type="item", name="production-science-pack", amount=5},
        },
        results = {{type="item", name="ei_imersite-quantum-age-tech", amount=10}},
        enabled = false,
        always_show_made_in = true,
    },
    {
        type = "recipe",
        name = "express-transport-belt",
        category = "crafting",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "fast-transport-belt", amount = 1},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 5},
            {type = "item", name = "rare-metals", amount = 1},
        },
        results = {{type="item", name="express-transport-belt", amount=1}},
        enabled = false,
    },
    {
        type = "recipe",
        name = "kr-wind-turbine",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "electric-engine-unit", amount = 1},
            {type = "item", name = "ei_iron-mechanical-parts", amount = 3},
            {type = "item", name = "ei_copper-mechanical-parts", amount = 3},
        },
        results = {{type="item", name="kr-wind-turbine", amount=1}},
        enabled = false,
    },
    {
        type = "recipe",
        name = "imersite-powder",
        category = "ei_crushing",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "raw-imersite", amount = 6},
        },
        results = {
            {type = "item", name = "ei_sand", amount = 2},
            {type = "item", name = "imersite-powder", amount = 4},
        },
        main_product = "imersite-powder",
        enabled = false,
    },
    
})

ei_lib.add_unlock_recipe("electronics", "ei_blank-tech-card")
ei_lib.add_unlock_recipe("ei_electronic-parts", "ei_blank-tech-card__electronic-parts")
ei_lib.add_unlock_recipe("ei_steam-age", "logistic-science-pack")
ei_lib.add_unlock_recipe("ei_electricity-age", "chemical-science-pack")
ei_lib.add_unlock_recipe("kr-research-server", "utility-science-pack")
ei_lib.add_unlock_recipe("kr-quantum-computer", "production-science-pack")
ei_lib.add_unlock_recipe("ei_moon-exploration", "space-science-pack")
ei_lib.add_unlock_recipe("kr-imersium-processing", "ei_imersite-quantum-age-tech")
ei_lib.add_unlock_recipe("kr-energy-control-unit", "ei_matter-quantum-age-tech")
ei_lib.add_unlock_recipe("kr-energy-control-unit", "matter-tech-card")
ei_lib.add_unlock_recipe("ei_exotic-age", "advanced-tech-card")

ei_lib.add_prerequisite("ei_moon-exploration", "ei_quantum-computer")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "ei_exotic-age")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "ei_fusion-reactor")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "kr-antimatter-reactor")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "ei_high-temperature-reactor")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "nuclear-power")
ei_lib.add_prerequisite("kr-intergalactic-transceiver", "ei_superior-induction-matrix")

ei_lib.set_prerequisites("ei_black-hole", {"ei_black-hole-exploration", "kr-intergalactic-transceiver"}) 

-- intermediates
-------------------------------------------------------------------------------
data.raw["recipe"]["iron-plate"].results = {
    {type = "item", name = "iron-plate", amount = 1}
}
data.raw["recipe"]["copper-plate"].results = {
    {type = "item", name = "copper-plate", amount = 1}
}

ei_lib.remove_unlock_recipe("advanced-circuit", "electronic-components")
ei_lib.recipe_add("ei_crystal-solution", "chlorine", 20, true)
ei_lib.recipe_add("ei_advanced-semiconductor", "chlorine", 5, true)
ei_lib.recipe_add("ei_advanced-semiconductor__monosilicon", "chlorine", 10, true)
ei_lib.recipe_add("ei_monosilicon", "chlorine", 2, true)
ei_lib.recipe_add("ei_nitric-acid-uranium-235", "chlorine", 10, true)
ei_lib.recipe_add("ei_nitric-acid-uranium-233", "chlorine", 10, true)
ei_lib.recipe_add("ei_nitric-acid-plutonium-239", "chlorine", 10, true)
ei_lib.recipe_add("ei_nitric-acid-thorium-232", "chlorine", 10, true)
ei_lib.recipe_add("ei_bio-matter", "chlorine", 2, true)

ei_lib.recipe_add("empty-antimatter-fuel-cell", "ei_empty-cryo-container", 1, false)
ei_lib.recipe_add("empty-antimatter-fuel-cell", "ei_clean-plating", 10, false)

ei_lib.recipe_add("heat-pipe", "quartz", 4, false)
ei_lib.recipe_add("solar-panel", "quartz", 8, false)
ei_lib.recipe_add("electronic-circuit", "wood", 1, false)
ei_lib.recipe_add("ei_green-circuit__waver", "wood", 4, false)
ei_lib.recipe_add("ei_advanced-motor", "rare-metals", 2, false)
ei_lib.recipe_add("ei_module-part", "rare-metals", 4, false)
ei_lib.recipe_add("processing-unit", "rare-metals", 6, false)

ei_lib.recipe_add("advanced-circuit", "silicon", 1)
data.raw["recipe"]["quartz"].ingredients = {
    {type = "item", name = "ei_sand", amount = 2},
    {type = "fluid", name = "water", amount = 20},
}
ei_lib.recipe_add("ei_semiconductor", "silicon", 2)
ei_lib.recipe_add("ei_advanced-base-semiconductor", "silicon", 4)
ei_lib.recipe_add("ei_silicon", "silicon", 1)
ei_lib.recipe_add("ei_lithium-crystal", "lithium", 1)
ei_lib.recipe_add("ei_neutron-collector", "lithium", 15)
ei_lib.recipe_add("ei_fusion-reactor", "lithium", 100)
ei_lib.recipe_add("lithium-sulfur-battery", "battery", 1)
ei_lib.recipe_add("ei_fusion-data", "lithium", 2)

data.raw["recipe"]["ai-core"].ingredients = {
    {type="item", name="processing-unit", 1}, {type="item", name="imersite-crystal", amount=3}, {"ei_computing-unit", amount=1}, 
}
data.raw["recipe"]["ai-core"].results = {{type="item", name="ai-core", amount=10}}
ei_lib.recipe_add("ei_superior-data", "ai-core", 1)
ei_lib.recipe_add("ei_plasma-data__tritium", "ai-core", 1)
ei_lib.recipe_add("ei_plasma-data__deuterium", "ai-core", 1)
ei_lib.recipe_add("ei_plasma-data__protium", "ai-core", 1)
ei_lib.recipe_add("ei_magnet-data", "ai-core", 1)
ei_lib.recipe_add("ei_fusion-data", "ai-core", 1)

ei_lib.recipe_add("ei_odd-plating", "imersite-crystal", 1)
ei_lib.recipe_add("imersium-plate", "ei_neodym-plate", 2)

ei_lib.recipe_add("ei_energy-crystal__growing", "quartz", 1)

ei_lib.add_unlock_recipe("kr-bio-processing", "ei_bio-matter__biomass")
ei_lib.add_unlock_recipe("kr-imersium-processing", "imersium-beam__metalworks")
ei_lib.add_unlock_recipe("kr-imersium-processing", "imersium-gear-wheel__metalworks")

ei_lib.recipe_add("imersium-beam", "steel-plate", 1)
ei_lib.recipe_add("imersium-gear-wheel", "ei_steel-mechanical-parts", 4)

data.raw.technology["kr-automation"].effects = {
    { type = "unlock-recipe", recipe = "kr-advanced-assembling-machine" },
}

ei_lib.recipe_add("ei_sus-plating", "rare-metals", 1)

-- chemistry changes
-------------------------------------------------------------------------------
ei_lib.add_unlock_recipe("kr-fluids-chemistry", "kr-water-separation")
ei_lib.remove_unlock_recipe("kr-advanced-chemistry", "kr-water-separation")
ei_lib.remove_unlock_recipe("kr-advanced-chemistry", "ammonia")
ei_lib.add_prerequisite("kr-advanced-chemistry", "ei_nitric-acid")

data.raw.technology["kr-atmosphere-condensation"].effects = {
    { type = "unlock-recipe", recipe = "kr-atmospheric-condenser" },
    { type = "unlock-recipe", recipe = "ei_water-from-atmosphere" },
}

ei_lib.add_unlock_recipe("ei_dirty-water-production", "kr-filtration-plant")
ei_lib.add_unlock_recipe("oil-processing", "chemical-plant")
ei_lib.remove_unlock_recipe("kr-fluids-chemistry", "kr-filtration-plant")
ei_lib.remove_unlock_recipe("kr-fluids-chemistry", "chemical-plant")

ei_lib.add_prerequisite("speed-module", "kr-mineral-water-gathering")
ei_lib.add_prerequisite("productivity-module", "kr-mineral-water-gathering")
ei_lib.add_prerequisite("efficiency-module", "kr-mineral-water-gathering")

--[[
data.raw.recipe["ei_module-base"].recipe_category = "crafting-with-fluid"
ei_lib.recipe_add("ei_module-base", "mineral-water", 50, true)
]]
data:extend({
    {
        name = "ei_module-base",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_module-part", amount=1},
            {type="item", name="ei_energy-crystal", amount=1},
            {type="item", name="ei_glass", amount=2},
            {type = "fluid", name = "mineral-water", amount = 50},
        },
        results = {{type="item", name="ei_module-base", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_module-base",
    },
})

ei_lib.recipe_add("ei_neodym-plate", "mineral-water", 25, true)
ei_lib.recipe_add("ei_cast-neodym__ingot", "rare-metals", 1)

-- fuel and vehicles
-------------------------------------------------------------------------------
data.raw["locomotive"]["ei_steam-advanced-locomotive"].burner.fuel_categories = {
    "chemical",
    "vehicle-fuel"
}

data.raw["locomotive"]["locomotive"].burner.fuel_categories = {
    "ei_diesel-fuel",
    "ei_rocket-fuel"
}

data.raw["locomotive"]["kr-nuclear-locomotive"].burner.fuel_categories = {
    "ei_nuclear-fuel",
    "ei_fusion-fuel"
}

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

ei_lib.recipe_add("ei_diesel-fuel-unit", "fuel", 1)


-- nuclear and steam reset
-------------------------------------------------------------------------------
data.raw["reactor"]["nuclear-reactor"].energy_source.fuel_categories = {"ei_nuclear-fuel"}
data.raw["reactor"]["nuclear-reactor"].energy_source.effectivity = 2
if ei_lib.config("nuclear-reactor__remove-bonus") then
    data.raw["reactor"]["nuclear-reactor"].neighbour_bonus = 0
end
data.raw["reactor"]["nuclear-reactor"].consumption = ei_lib.config("nuclear-reactor__energy-output")

-- heat exchanger
-- 10 MW in, 103w/s in, 15dec min, 500dec steam out so 500dec min heat, out 103steam at 500dec / s

-- steam
-- min temp 15 - max 1000, 200 J/K

-- steam turbine
-- 900kw at 165dec steam with 30/s

-- boiler: 165dec steam out, with 60/s at 1.8MW
-- fluid boiler: same with fluid

data.raw["boiler"]["ei_fluid-boiler"].energy_consumption = "1.5MW"

-- nuclear stuff
-- steam = 200J/K
-- > 500dec steam = 200J * 500 = 100.000J = 0,1MJ
-- 10k steam at 500dec = 1GJ

-- 1000dec steam = 0,2MJ
-- 500dec steam = 0,1MJ
-- U235 = 25GJ -> 250k steam
-- U233 = 15GJ -> 150k steam
-- Pu239 = 30GJ -> 300k steam
-- Th232 = 10GJ -> 100k steam

-- + 50k each as HTR is more efficient
-- * 2 since effeciency is 200% for nuclear
local blank_htr = {
    name = "ei_htr-uranium-235",
    type = "recipe",
    category = "ei_high-temperature-reactor",
    energy_required = 120,
    ingredients = {
        {type = "item", name = "ei_uranium-235-fuel", amount = 1},
        {type = "fluid", name = "water", amount = 2*300000},
    },
    results = {
        {type = "item", name = "ei_used-uranium-235-fuel", amount = 1},
        {type = "fluid", name = "steam", amount = 2*300000, temperature = 500},
    },
    always_show_made_in = true,
    enabled = false,
    main_product = "steam",
    subgroup = "ei_htr-recipes",
    order = "a",
}

local function add_htr(fuel, fuel_value, steam_heat_capacity, steam_temp)

    local recipe = util.table.deepcopy(blank_htr)
    recipe.name = "ei_htr-" .. fuel
    -- time is 120s

    -- energy of 1 unit steam
    local steam_energy = steam_heat_capacity * (steam_temp - 15)
    local total_gained_energy = fuel_value * 2

    -- + 5GJ as htr is more efficient
    local total_steam = (total_gained_energy + 5000000000) / steam_energy

    recipe.ingredients[1].name = "ei_"..fuel.."-fuel"
    recipe.ingredients[2].amount = total_steam

    recipe.results[1].name = "ei_used-" .. fuel.."-fuel"
    recipe.results[2].amount = total_steam
    recipe.results[2].temperature = steam_temp

    data:extend({recipe})

end

local htr_fuels = {
    ["uranium-235"] = 25*1000*1000*1000,
    ["uranium-233"] = 15*1000*1000*1000,
    ["plutonium-239"] = 30*1000*1000*1000,
    ["thorium-232"] = 10*1000*1000*1000,
}

for fuel, value in pairs(htr_fuels) do
    add_htr(fuel, value, 200, 415)
end

-- also increase energy usage of injector pylons to 10GW each
data.raw["assembling-machine"]["ei_energy-injector-pylon"].energy_usage = "10GW"

-- make pump not use energy
data.raw["pump"]["pump"].energy_source = {
    type = 'void'
}
data.raw["assembling-machine"]["kr-electric-offshore-pump"].energy_source = {
    type = 'void'
}
data.raw["item"]["satellite"].rocket_launch_product = nil
data.raw["capsule"]["raw-fish"].rocket_launch_product = nil
data.raw["capsule"]["raw-fish"].rocket_launch_products = nil

-- starting machinery
-------------------------------------------------------------------------------
data:extend({
    {
        type = "recipe",
        name = "ei_basic-power-pole",
        category = "crafting",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "wood", amount = 2},
            {type = "item", name = "copper-plate", amount = 3},
        },
        results = {{type="item", name="small-electric-pole", amount=1}},
        enabled = false,
    },
})

ei_lib.add_unlock_recipe("ei_dark-age", "ei_basic-power-pole")

-- remove non ei drops from crash site things
local swap_crash_items = {
    ["iron-plate"] = "ei_iron-ingot",
    ["copper-plate"] = "ei_copper-ingot",
    ["iron-gear-wheel"] = "ei_iron-mechanical-parts",
    ["copper-cable"] = "ei_copper-mechanical-parts",
} 

local crash_entites = {
    ["container"] = {
        "crash-site-spaceship",
        "crash-site-spaceship-wreck-big-1",
        "crash-site-spaceship-wreck-big-2",
        "crash-site-spaceship-wreck-medium-1",
        "crash-site-spaceship-wreck-medium-2",
        "crash-site-chest-1",
        "crash-site-chest-2",
        "kr-crash-site-chest-1",
        "kr-crash-site-chest-2",
    },
    ["simple-entity-with-owner"] = {
        "crash-site-spaceship-wreck-small-1",
        "crash-site-spaceship-wreck-small-2",
        "crash-site-spaceship-wreck-small-3",
        "crash-site-spaceship-wreck-small-4",
        "crash-site-spaceship-wreck-small-5",
        "crash-site-spaceship-wreck-small-6",
        "kr-mineable-wreckage",
    },
    ["assembling-machine"] = {
        "kr-crash-site-assembling-machine-1-repaired",
        "kr-crash-site-assembling-machine-2-repaired",
    },
    ["lab"] = {
        "kr-crash-site-lab-repaired",
    },
    ["electric-energy-interface"] = {
        "kr-crash-site-generator",
    },
}

for entity_type, entity_names in pairs(crash_entites) do

    for _, entity_name in pairs(entity_names) do

        if (not data.raw[entity_type]) or (not data.raw[entity_type][entity_name]) then
            log("Entity " .. entity_name .. " does not exist")
            goto continue
        end

        if (not data.raw[entity_type][entity_name].minable) or (not data.raw[entity_type][entity_name].minable.results) then
            goto continue
        end

        for i, minables in pairs(data.raw[entity_type][entity_name].minable.results) do

            --log(serpent.block(minables))
            if swap_crash_items[minables.name] then
                data.raw[entity_type][entity_name].minable.results[i].name = swap_crash_items[minables.name]
            end

        end

        ::continue::

    end

end

--log(serpent.block(data.raw["container"]["kr-crash-site-chest-2"]))

-- tech cost fixup
-------------------------------------------------------------------------------

-- loop over all techs and set their cost to 10 if they dont ignore tech multiplier
for tech_name, tech in pairs(data.raw.technology) do

    if tech.ignore_tech_cost_multiplier == true then
        goto continue
    end

    if not tech.unit then
        goto continue
    end

    if not tech.unit.count then
        goto continue
    end

    tech.unit.count = ei_lib.config("tech-scaling__startPrice")

    ::continue::
end

-- fix ammos
-------------------------------------------------------------------------------

-- only if "kr-more-realistic-weapon" setting is enabled
if settings.startup["kr-more-realistic-weapon"].value then
    data.raw["ammo"]["firearm-magazine"].ammo_type.category = "pistol-ammo"
    data.raw["ammo"]["piercing-rounds-magazine"].ammo_type.category = "pistol-ammo"
end

-- productivity modules
-------------------------------------------------------------------------------
local recipes = {
    "automation-science-pack",
    "logistic-science-pack",
    "chemical-science-pack",
    "utility-science-pack",
    "production-science-pack",
    "space-science-pack",
    "matter-tech-card",
    "advanced-tech-card",
    "blank-tech-card",
    "ei_blank-tech-card",
    "ei_blank-tech-card__electronic-parts",
    "utility-science-pack_alt",
    "production-science-pack_alt",
    "utility-science-pack_alt",
    "automation-science-pack_alt",
    "logistic-science-pack_alt",
    "chemical-science-pack_alt",
}

for i,v in pairs(recipes) do
    table.insert(data.raw["module"]["productivity-module"].limitation, v)
    table.insert(data.raw["module"]["productivity-module-2"].limitation, v)
    table.insert(data.raw["module"]["productivity-module-3"].limitation, v)
end

for target, info in pairs(items_to_merge) do
    ei_lib.merge_item(target, info.item, info.use_icon)
end

for _, recipe in pairs(recipe_to_hide) do
    -- if not data raw log
    if not data.raw.recipe[recipe] then
        log("Recipe " .. recipe .. " does not exist")
        goto continue
    end

    data.raw.recipe[recipe].hidden = true
    -- also remove it from tech unlocks
    for tech, _ in pairs(data.raw.technology) do
        ei_lib.remove_unlock_recipe(tech, recipe)
    end

    ::continue::

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

for recipe, info in pairs(hard_recipe_overwrite) do
    if not data.raw.recipe[recipe] then
        log("Recipe " .. recipe .. " does not exist")
        goto continue
    end

    ei_lib.recipe_hard_overwrite(recipe, info)
    ::continue::
end