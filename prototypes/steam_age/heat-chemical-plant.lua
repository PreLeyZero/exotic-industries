ei_lib = require("lib/lib")

--====================================================================================================
--HEAT CHEM PLANT
--====================================================================================================

data:extend({
    {
        name = "ei_heat-chemical-plant",
        type = "item",
        icon = ei_graphics_item_path.."heat-chemical-plant.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "production-machine",
        order = "e",
        place_result = "ei_heat-chemical-plant",
        stack_size = 50
    },
    {
        name = "ei_heat-chemical-plant",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"pipe", 4},
            {"steel-plate", 6},
            {"ei_copper-mechanical-parts", 4},
            {"stone-furnace", 1},
        },
        result = "ei_heat-chemical-plant",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_heat-chemical-plant",
    }
})

local plant = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
plant.name = "ei_heat-chemical-plant"
plant.icon = ei_graphics_item_path.."heat-chemical-plant.png"
plant.icon_size = 64
plant.minable.result = "ei_heat-chemical-plant"

plant.crafting_speed = 0.5

plant.animation = ei_lib.make_4way_animation_from_spritesheet({ layers =
{
  {
    filename = ei_graphics_entity_path.."heat-chemical-plant.png",
    width = 108,
    height = 148,
    frame_count = 24,
    line_length = 12,
    shift = util.by_pixel(1, -9),
    hr_version =
    {
      filename = ei_graphics_entity_path.."hr-heat-chemical-plant.png",
      width = 220,
      height = 292,
      frame_count = 24,
      line_length = 12,
      shift = util.by_pixel(0.5, -9),
      scale = 0.5
      }
  },
  {
    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
    width = 154,
    height = 112,
    repeat_count = 24,
    frame_count = 1,
    shift = util.by_pixel(28, 6),
    draw_as_shadow = true,
    hr_version =
    {
      filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
      width = 312,
      height = 222,
      repeat_count = 24,
      frame_count = 1,
      shift = util.by_pixel(27, 6),
      draw_as_shadow = true,
      scale = 0.5
      }
  }
}})

plant.energy_source = {
    type = 'heat',
    max_temperature = 275,
    min_working_temperature = 185,
    specific_heat = ei_data.specific_heat,
    max_transfer = '10MW',
    connections = {
        {position = {-1.3, 0}, direction = defines.direction.west},
        -- {position = {0,1.4}, direction = defines.direction.south},
        {position = {1.3, 0}, direction = defines.direction.east},
        -- {position = {-1.5,0}, direction = defines.direction.west}
    }
}

data:extend({plant})