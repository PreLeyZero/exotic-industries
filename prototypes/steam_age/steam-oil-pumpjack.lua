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
            {type="item", name="steel-plate", amount=4},
            {type="item", name="ei_steam-engine", amount=4},
            {type="item", name="ei_copper-mechanical-parts", amount=4},
            {type="item", name="pipe", amount=4}
        },
        results = {{type="item", name="ei_steam-oil-pumpjack", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-oil-pumpjack",
    },
    {
        name = "ei_steam-oil-processing",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-oil-processing.png",
        icon_size = 128,
        prerequisites = {"ei_burner-heater"},
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
                recipe = "ei_solid-fuel__residual-oil"
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
pump.module_slots = 0

-- set energy source
pump.energy_source = {
    type = "fluid",
    fluid_box = {   
        filter = "steam",
        volume = 200,
        pipe_covers = pipecoverspictures(),
        pipe_picture = ei_pipe_pumpjack,
        pipe_connections = {
            {flow_direction = "input", direction = defines.direction.south, position = {0, 1}},
        },
        production_type = "input",
    },
    effectivity = 1,
    scale_fluid_usage = true,
}

pump.graphics_set = {
    animation = {
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
                    filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
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
}
data:extend({pump})