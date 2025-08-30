-- this file contains the prototype definition for varios stuff from exotic age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_black-hole-data",
        type = "item",
        icon = ei_graphics_item_path.."black-hole-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "c-a",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."black-hole-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."space-data_light.png",
                scale = 0.25
              }
            }
          },
    },
    {
        name = "ei_black-hole-exotic-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."black-hole-exotic-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a7",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."black-hole-exotic-age-tech.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."exotic-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    },
})


--RECIPES
------------------------------------------------------------------------------------------------------

data:extend({
    {
        name = "ei_black-hole-exotic-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 240,
        ingredients = {
            {type = "item", name = "ei_clean-plating", amount = 20},
            {type = "item", name = "ei_simulation-data", amount = 40},
            {type = "item", name = "ei_black-hole-data", amount = 5},
        },
        results = {
            {type = "item", name = "ei_black-hole-exotic-age-tech", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_black-hole-exotic-age-tech",
    },
})


--OTHER
------------------------------------------------------------------------------------------------------

table.insert(data.raw["technology"]["ei_black-hole-exploration"].effects, {type = "unlock-recipe", recipe = "ei_black-hole-exotic-age-tech"})
