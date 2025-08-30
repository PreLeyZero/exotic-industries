--====================================================================================================
--PLANET EXPLORATION
--====================================================================================================

data.raw["rocket-silo"]["rocket-silo"].fixed_recipe = nil
data.raw["item"]["satellite"].rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}}
data.raw["capsule"]["raw-fish"].rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}}
data.raw["capsule"]["raw-fish"].send_to_orbit_mode = "automated"

-- fuel costs:
-- 10 for nauvis orbit
-- 14 for moon
-- 18 for gas giant
-- 20 for mars


data:extend({

    -- ROCKETS

    {
        name = "ei_rocket__nauvis-orbit",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="rocket-fuel", amount=10},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__moon",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="rocket-fuel", amount=12},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__mars",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=16},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__uran",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=26},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__sulf",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=18},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__gas-giant",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=24},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__sun",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=20},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10}
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__asteroid",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=20},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10},
            {type="item", name="ei_dt-mix", amount=1},
            {type="item", name="ei_fusion-drive", amount=1},
        },
        results = {{type="item", name="rocket-part", amount=1}},
        enabled = false,
        hidden = true,
        main_product = "rocket-part",
    },
    {
        name = "ei_rocket__black-hole",
        type = "recipe",
        category = "rocket-building",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-rocket-fuel", amount=20},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_rocket-parts", amount=10},
            {type="item", name="ei_dt-mix", amount=4},
            {type="item", name="ei_fusion-drive", amount=1},
        },
        results = {{type="item", name="rocket-part", amount=1}},
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
                recipe = "ei_rocket__moon"
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
                recipe = "ei_rocket__mars"
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
                recipe = "ei_rocket__uran"
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
                recipe = "ei_rocket__gas-giant"
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
                recipe = "ei_rocket__sulf"
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
                recipe = "ei_rocket__sun"
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
                recipe = "ei_rocket__asteroid"
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
        name = "ei_black-hole-exploration",
        type = "technology",
        icon = ei_graphics_tech_path.."black-hole-exploration.png",
        icon_size = 256,
        prerequisites = {"ei_exotic-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket__black-hole"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["exotic-age"],
            time = 20
        },
        age = "exotic-age",
        enabled = ei_mod.show_exotic_gates,
        visible_when_disabled = false,
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
        prerequisites = {"ei_basic-space-mining", "ei_moon-exploration", "ei_tritium-breeding"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_moon-rock__centrifuging"
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
                recipe = "ei_mars-rock__centrifuging"
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
                recipe = "ei_uran-rock__centrifuging"
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
                recipe = "ei_sulf-rock__centrifuging"
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
                recipe = "ei_exotic-rock__centrifuging"
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
    {
        name = "ei_exploration-satellite",
        type = "technology",
        icon = ei_graphics_tech_path.."exploration-satellite.png",
        icon_size = 128,
        prerequisites = {"ei_deep-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_exploration-satellite"
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
        rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}},
        send_to_orbit_mode = "automated",
        weight = 1
    },
    {
        name = "ei_watch-satellite",
        type = "item",
        icon = ei_graphics_item_path.."watch-satellite.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "space-related",
        order = "n-a-2",
        rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}},
        send_to_orbit_mode = "automated",
        weight = 1
    },
    {
        name = "ei_exploration-satellite",
        type = "item",
        icon = ei_graphics_item_path.."exploration-satellite.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "space-related",
        order = "n-a-3",
        rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 0}},
        send_to_orbit_mode = "automated",
        weight = 1
    },

    -- RECIPES

    {
        name = "ei_moon-rock__centrifuging",
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
        name = "ei_mars-rock__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_mars-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_copper-chunk", amount = 100, probability = 0.5},
            {type = "item", name = "ei_iron-chunk", amount = 100, probability = 0.5},
            {type = "item", name = "ei_gold-chunk", amount = 100, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x2",
        icon = ei_graphics_other_path.."mars-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_uran-rock__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_uran-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_uranium-chunk", amount = 100, probability = 0.75},
            {type = "item", name = "ei_lead-chunk", amount = 100, probability = 0.5},
            {type = "item", name = "ei_neodym-chunk", amount = 100, probability = 0.05},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x3",
        icon = ei_graphics_other_path.."uran-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_sulf-rock__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_sulf-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_gold-chunk", amount = 100, probability = 0.25},
            {type = "item", name = "ei_sulfur-chunk", amount = 100, probability = 0.5},
            {type = "item", name = "ei_neodym-chunk", amount = 100, probability = 0.75},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-raw",
        order = "x4",
        icon = ei_graphics_other_path.."sulf-rock.png",
        icon_size = 64,
    },
    {
        name = "ei_exotic-rock__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_exotic-rock", amount = 10},
        },
        results = {
            {type = "item", name = "ei_neodym-chunk", amount = 100, probability = 0.05},
            {type = "item", name = "ei_uranium-chunk", amount = 100, probability = 0.05},
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
    {
        name = "ei_exploration-satellite",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "satellite", amount = 1},
            {type = "item", name = "radar", amount = 10},
            {type = "item", name = "ei_fusion-drive", amount = 1},
            {type = "item", name = "ei_dt-mix", amount = 10},
        },
        results = {
            {type = "item", name = "ei_exploration-satellite", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_exploration-satellite",
    },

    -- ITEMS

    {
        name = "ei_moon-rock",
        type = "item",
        icon = ei_graphics_item_path.."moon-rock.png",
        icon_size = 64,
        stack_size = 1000,
        subgroup = "ei_refining-raw",
        order = "b1",
    },
    {
        name = "ei_mars-rock",
        type = "item",
        icon = ei_graphics_item_path.."mars-rock.png",
        icon_size = 64,
        stack_size = 1000,
        subgroup = "ei_refining-raw",
        order = "b2",
    },
    {
        name = "ei_sulf-rock",
        type = "item",
        icon = ei_graphics_item_path.."sulf-rock.png",
        icon_size = 64,
        stack_size = 1000,
        subgroup = "ei_refining-raw",
        order = "b3",
    },
    {
        name = "ei_uran-rock",
        type = "item",
        icon = ei_graphics_item_path.."uran-rock.png",
        icon_size = 64,
        stack_size = 1000,
        subgroup = "ei_refining-raw",
        order = "b4",
    },
    {
        name = "ei_exotic-rock",
        type = "item",
        icon = ei_graphics_item_path.."exotic-rock.png",
        icon_size = 64,
        stack_size = 1000,
        subgroup = "ei_refining-raw",
        order = "b5",
    },

})

-- SPRITE SHEETS

data:extend({
    {
        name = "ei_destination__moon",
        type = "sprite",
        filename = ei_graphics_destination_path.."moon.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__mars",
        type = "sprite",
        filename = ei_graphics_destination_path.."mars.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__uran",
        type = "sprite",
        filename = ei_graphics_destination_path.."uran.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__sun",
        type = "sprite",
        filename = ei_graphics_destination_path.."sun.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__sulf",
        type = "sprite",
        filename = ei_graphics_destination_path.."sulf.png",
        size = 128,
    },
    {
        name = "ei_destination__galaxy",
        type = "sprite",
        filename = ei_graphics_destination_path.."galaxy.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__asteroid",
        type = "sprite",
        filename = ei_graphics_destination_path.."asteroid.png",
        size = 128,
    },
    {
        name = "ei_destination__black-hole",
        type = "sprite",
        filename = ei_graphics_destination_path.."black-hole.png",
        size = 256,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__gas",
        type = "sprite",
        filename = ei_graphics_destination_path.."gas.png",
        size = 128,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__gas-giant",
        type = "sprite",
        filename = ei_graphics_destination_path.."gas-giant.png",
        size = 256,
        flags = {"gui-icon"}
    },
    {
        name = "ei_destination__nauvis-orbit",
        type = "sprite",
        filename = ei_graphics_destination_path.."nauvis-orbit.png",
        size = 128,
        flags = {"gui-icon"}
    },
})
