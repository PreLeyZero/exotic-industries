ei_data = require("lib/data")

--====================================================================================================
--STEAM OIL PUMPJACK
--====================================================================================================

data:extend({
    {
        name = "ei_steam-oil-pumpjack",
        type = "item",
        icon = ei_graphics_item_path.."steam-oil-pumpjack.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "extraction-machine",
        order = "b[fluids]-b",
        place_result = "ei_steam-oil-pumpjack",
        stack_size = 20
    },
    {
        name = "ei_steam-oil-pumpjack",
        type = "recipe",
        category = "crafting",
        energy_required = 3,
        ingredients =
        {
            {"steel-plate", 4},
            {"ei_steam-engine", 4},
            {"ei_copper-mechanical-parts", 4},
            {"pipe", 4}
        },
        result = "ei_steam-oil-pumpjack",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-oil-pumpjack",
    },
    {
        name = "ei_steam-oil-processing",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-oil-processing.png",
        icon_size = 128,
        prerequisites = {"steel-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_steam-oil-pumpjack"
            },
            {
                type = "unlock-recipe",
                recipe = "oil-refinery"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heat-chemical-plant"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_solid-fuel:residual-oil"
            },
            {
                type = "unlock-recipe",
                recipe = "solid-fuel-from-petroleum-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "basic-oil-processing"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
})

-- copy normal pumpjack and add steam energy source

local pump = table.deepcopy(data.raw["mining-drill"]["pumpjack"])
pump.name = "ei_steam-oil-pumpjack"
pump.icon = ei_graphics_item_path.."steam-oil-pumpjack.png"
pump.icon_size = 64
pump.minable.result = "ei_steam-oil-pumpjack"
pump.mining_speed = 0.5

-- remove modules
pump.module_specification = nil

-- set energy source
pump.energy_source = {
    type = "fluid",
    fluid_box = {   
        filter = "steam",
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        pipe_picture = ei_pipe_pumpjack,
        pipe_connections = {
            {type = "input", position = {0, 2.0}},
        },
        production_type = "input",
    },
    effectivity = 1,
    scale_fluid_usage = true,
}

pump.animations = {
    north = {
      layers = {
        {
            animation_speed = 0.5,
            filename = ei_graphics_entity_path.."steam-oil-pumpjack_animation.png",
            frame_count = 40,
            height = 202,
            line_length = 8,
            priority = "high",
            scale = 0.5,
            shift = {
              -0.125,
              -0.75
            },
            width = 206
        },
        {
            animation_speed = 0.5,
            draw_as_shadow = true,
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead-shadow.png",
            frame_count = 40,
            height = 82,
            line_length = 8,
            priority = "high",
            scale = 0.5,
            shift = {
              0.5546875,
              0.453125
            },
            width = 309
        }
      }
    }
}
data:extend({pump})