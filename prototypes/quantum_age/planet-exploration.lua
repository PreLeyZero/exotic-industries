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
            {"rocket-fuel", 14},
            {"ei_carbon-structure", 2},
            {"ei_rocket-parts", 10}
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

})