--====================================================================================================
--PLANET EXPLORATION
--====================================================================================================

data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw["item"]["satellite"].rocket_launch_product = nil
data.raw["item"]["satellite"].rocket_launch_products = nil

-- fuel costs:
-- 10 for nauvis orbit
-- 14 for moon
-- 18 for gas giant
-- 20 for mars


data:extend({

    -- ROCKETS

    {
        name = "ei_rocket:nauvis-orbit",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 10},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:moon",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 12},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:mars",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 16},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:uran",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 26},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:sulf",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 18},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:gas-giant",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 24},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:sun",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 20},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket:asteroid",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {"rocket-fuel", 20},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10},
            {"ei_dt-mix", 1},
            {"ei_fusion-drive", 1},
        },
        result = "rocket-part",
        result_count = 1,
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },

    -- TECHS

    {
        name = "ei_moon-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."moon-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_fish-growing", "ei_oxygen-difluoride"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:moon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_space-quantum-age-tech"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-rocket-fuel"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_mars-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."mars-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:mars"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_uran-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."uran-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:uran"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_gas-giant-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."gas-giant-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:gas-giant"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_sulf-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."sulf-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:sulf"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_sun-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."sun-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:sun"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_deep-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."planet-exploration.png",
        icon_size = 512,
        prerequisites = {"ei_mars-exploration", "ei_uran-exploration", "ei_gas-giant-exploration", "ei_sulf-exploration", "ei_sun-exploration", "ei_fusion-drive"},
        effects = {
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_asteroid-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."asteroid-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_deep-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket:asteroid"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },

    -- BASIC MINING

    {
        name = "ei_basic-space-mining",
        type = "technology",
        icon = ei_graphics_item_path.."mining-satellite.png",
        icon_size = 128,
        prerequisites = {"mining-productivity-3", "ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_mining-satellite"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_watch-satellite",
        type = "technology",
        icon = ei_graphics_tech_path.."watch-satellite.png",
        icon_size = 128,
        prerequisites = {"ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_watch-satellite"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_moon-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."moon-mining.png",
        icon_size = 256,
        prerequisites = {"ei_basic-space-mining", "ei_neutron-collector", "ei_moon-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_moon-rock:centrifuging"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_mars-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."mars-mining.png",
        icon_size = 256,
        prerequisites = {"ei_basic-space-mining", "ei_mars-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_mars-rock:centrifuging"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_uran-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."uran-mining.png",
        icon_size = 256,
        prerequisites = {"ei_basic-space-mining", "ei_uran-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_uran-rock:centrifuging"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_sulf-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."sulf-mining.png",
        icon_size = 256,
        prerequisites = {"ei_basic-space-mining", "ei_sulf-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_sulf-rock:centrifuging"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_sun-watching",
        type = "technology",
        icon = ei_graphics_tech_path.."sun-watching.png",
        icon_size = 256,
        prerequisites = {"ei_watch-satellite", "ei_sun-exploration"},
        effects = {},
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_gas-giant-watching",
        type = "technology",
        icon = ei_graphics_tech_path.."gas-giant-watching.png",
        icon_size = 256,
        prerequisites = {"ei_watch-satellite", "ei_gas-giant-exploration"},
        effects = {},
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_asteroid-mining",
        type = "technology",
        icon = ei_graphics_tech_path.."asteroid-mining.png",
        icon_size = 256,
        prerequisites = {"ei_basic-space-mining", "ei_asteroid-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_exotic-rock:centrifuging"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_exotic-matter"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },

    -- ROCKET PAYLOADS

    {
        name = "ei_mining-satellite",
        type = "item",
        icon = ei_graphics_item_path.."mining-satellite.png",
        icon_size = 128,
        stack_size = 1,
        subgroup = "space-related",
        order = "n-a-1",
    },
    {
        name = "ei_watch-satellite",
        type = "item",
        icon = ei_graphics_item_path.."watch-satellite.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "space-related",
        order = "n-a-2",
    },

    -- RECIPES

    {
        name = "ei_moon-rock:centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_moon-rock", amount = 10},
        },
        results = {
            {type = "item", name = "stone", amount = 10, probability = 0.025},
            {type = "fluid", name = "ei_helium-3", amount = 10, probability = 0.05}, -- one rocket (for 10/s at he3 lowest injection: 3.7 GW) = 10000 * 0.05 = 500 He3 = 500 * 5 plasma = 2500 plasma -> 250/s (4.1 min) at low, 50 s at high 
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x1",
        icon = ei_graphics_other_path.."moon-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_mars-rock:centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_mars-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_copper-chunk", amount = 10, probability = 0.5},
            {type = "item", name = "ei_iron-chunk", amount = 10, probability = 0.5},
            {type = "item", name = "ei_gold-chunk", amount = 10, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x2",
        icon = ei_graphics_other_path.."mars-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_uran-rock:centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_uran-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_uranium-chunk", amount = 10, probability = 0.75},
            {type = "item", name = "ei_lead-chunk", amount = 10, probability = 0.5},
            {type = "item", name = "ei_neodym-chunk", amount = 10, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x3",
        icon = ei_graphics_other_path.."uran-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_sulf-rock:centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_sulf-rock", amount = 10},
        },
        results = {
            {type = "item", name = "stone", amount = 10, probability = 0.25},
            {type = "item", name = "sulfur", amount = 10, probability = 0.5},
            {type = "item", name = "ei_neodym-chunk", amount = 10, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x4",
        icon = ei_graphics_other_path.."sulf-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_exotic-rock:centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_exotic-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_neodym-chunk", amount = 10, probability = 0.05},
            {type = "item", name = "ei_uranium-chunk", amount = 10, probability = 0.05},
            {type = "item", name = "ei_exotic-ore", amount = 10, probability = 0.1}, -- 1000 ore per rocket
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x4",
        icon = ei_graphics_other_path.."exotic-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_exotic-matter",
        type = "recipe",
        category = "centrifuging",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_exotic-ore", amount = 1},
        },
        results = {
            {type = "item", name = "ei_exotic-matter-up", amount = 1, probability = 0.5},
            {type = "item", name = "ei_exotic-matter-down", amount = 1, probability = 0.5},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_alien-items",
        order = "x-1",
        icon = ei_graphics_other_path.."exotic-matter.png",
        icon_size = 128,
    },
    {
        name = "ei_mining-satellite",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "satellite", amount = 1},
            {type = "item", name = "electric-mining-drill", amount = 1},
        },
        results = {
            {type = "item", name = "ei_mining-satellite", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_mining-satellite",
    },
    {
        name = "ei_watch-satellite",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "satellite", amount = 1},
            {type = "item", name = "lab", amount = 1},
            {type = "item", name = "radar", amount = 1},
        },
        results = {
            {type = "item", name = "ei_watch-satellite", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_watch-satellite",
    },

    -- ITEMS

    {
        name = "ei_moon-rock",
        type = "item",
        icon = ei_graphics_item_path.."moon-rock.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-raw",
        order = "b1",
    },
    {
        name = "ei_mars-rock",
        type = "item",
        icon = ei_graphics_item_path.."mars-rock.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-raw",
        order = "b2",
    },
    {
        name = "ei_sulf-rock",
        type = "item",
        icon = ei_graphics_item_path.."sulf-rock.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-raw",
        order = "b3",
    },
    {
        name = "ei_uran-rock",
        type = "item",
        icon = ei_graphics_item_path.."uran-rock.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-raw",
        order = "b4",
    },
    {
        name = "ei_exotic-rock",
        type = "item",
        icon = ei_graphics_item_path.."exotic-rock.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "ei_refining-raw",
        order = "b5",
    },

})