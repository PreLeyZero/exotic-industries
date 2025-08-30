ei_data = require("lib/data")

--====================================================================================================
--BIG TURBINE
--====================================================================================================

data:extend({
    {
        name = "ei_big-turbine",
        type = "recipe-category",
    },
    {
        name = "ei_big-turbine",
        type = "item",
        icon = ei_graphics_item_path.."big-turbine.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "c-f",
        place_result = "ei_big-turbine",
        stack_size = 50
    },
    {
        name = "ei_big-turbine",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_carbon-structure", amount=20},
            {type="item", name="steam-turbine", amount=10},
            {type="item", name="ei_steel-mechanical-parts", amount=25},
            {type="item", name="ei_advanced-motor", amount=20}
        },
        results = {{type="item", name="ei_big-turbine", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_big-turbine",
    },
    {
        name = "ei_big-turbine",
        type = "generator",
        icon = ei_graphics_item_path.."big-turbine.png",
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 300,
        corpse = "big-remnants",
        collision_box = {{-3.4,-3.4},{3.4,3.4}},
        selection_box = {{-3.5,-3.5},{3.5,3.5}},
        map_color = ei_data.colors.assembler,
        minable = {
            mining_time = 0.5,
            result = "ei_big-turbine",
        },
        effectivity = 1,
        energy_source = {
            type = "electric",
            usage_priority = "primary-output",
        },
        burns_fluid = true,
        fluid_usage_per_tick = ei_data.fusion.turbine_power/ei_data.fusion.coolant_fuel_value/60,
        maximum_temperature = 1500,
        max_power_output = tostring(ei_data.fusion.turbine_power).."MW",
        fluid_box = {
          filter = "ei_critical-steam",
          volume = 200,
          pipe_covers = pipecoverspictures(),
          pipe_connections =
          {
            {flow_direction = "input-output", direction = defines.direction.west, position = {-3, 0}},
            {flow_direction = "input-output", direction = defines.direction.east, position = {3, 0}},
            {flow_direction = "input-output", direction = defines.direction.south, position = {0, 3}},
            {flow_direction = "input-output", direction = defines.direction.north, position = {0, -3}}
          },
          production_type = "input-output"
        },
        --animation
        horizontal_animation = {
            layers = {
                {
                    filename = ei_graphics_entity_path.."big-turbine_animation.png",
                    size = {512*2,512*2},
                    scale = 0.77/2,
                    line_length = 5,
                    lines_per_file = 5,
                    frame_count = 25,
                    animation_speed = 0.5,
                    shift = {0,-0.5} 
                },
                {
                    filename = ei_graphics_entity_path.."big-turbine_pipe.png",
                    size = {512*2,512*2},
                    scale = 0.77/2,
                    line_length = 1,
                    lines_per_file = 1,
                    frame_count = 1,
                    repeat_count = 25,
                    animation_speed = 0.5,
                    shift = {0,-0.5} 
                },
            }
        },
        vertical_animation = {
            layers = {
                {
                    filename = ei_graphics_entity_path.."big-turbine_animation.png",
                    size = {512*2,512*2},
                    scale = 0.77/2,
                    line_length = 5,
                    lines_per_file = 5,
                    frame_count = 25,
                    animation_speed = 0.5,
                    shift = {0,-0.5} 
                },
                {
                    filename = ei_graphics_entity_path.."big-turbine_pipe.png",
                    size = {512*2,512*2},
                    scale = 0.77/2,
                    line_length = 1,
                    lines_per_file = 1,
                    frame_count = 1,
                    repeat_count = 25,
                    animation_speed = 0.5,
                    shift = {0,-0.5} 
                },
            }
        },
        smoke = {
          {
              name = "smoke",
              frequency = 1,
              position = {0,-3},
              --deviation = {x = -2, y = -2},
          },
        },
        working_sound =
        {
          sound = {filename = "__base__/sound/chemical-plant-3.ogg" },
          apparent_volume = 0.3,
        },
    },
})