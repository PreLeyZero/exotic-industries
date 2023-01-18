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
})