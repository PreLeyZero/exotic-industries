ei_data = require("lib/data")

--====================================================================================================
--STEAM ASSEMBLER
--====================================================================================================

data:extend({
    {
        name = "ei_steam-assembler",
        type = "recipe-category",
    },
    {
        name = "ei_steam-assembler",
        type = "item",
        icon = ei_graphics_item_path.."steam-assembler.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a",
        place_result = "ei_steam-assembler",
        stack_size = 50
    },
    {
        name = "ei_steam-assembler",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="pipe", amount=6},
            {type="item", name="ei_copper-mechanical-parts", amount=4},
            {type="item", name="ei_steam-engine", amount=4},
            {type="item", name="ei_copper-beam", amount=2}
        },
        results = {{type="item", name="ei_steam-assembler", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-assembler",
    },
    {
        name = "ei_steam-assembler",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-assembler.png",
        icon_size = 256,
        prerequisites = {"ei_steam-power"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_steam-assembler"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
    {
        name = "ei_steam-assembler",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."steam-assembler.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_steam-assembler"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        -- collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        -- selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        collision_box = data.raw["assembling-machine"]["assembling-machine-1"].collision_box,
        selection_box = data.raw["assembling-machine"]["assembling-machine-1"].selection_box,
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_steam-assembler", "crafting", "crafting-with-fluid"},
        crafting_speed = 0.5,
        energy_source = {
            type = "fluid",
            fluid_box = {   
                filter = "steam",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_steam,
                pipe_connections = {
                    {flow_direction = "input-output", direction = defines.direction.north, position = {0, -1}},
                    {flow_direction = "input-output", direction = defines.direction.south, position = {0, 1}}
                },
                production_type = "input-output",
            },
            effectivity = 0.3,
            scale_fluid_usage = true,
        },
        fast_replaceable_group = "assembling-machine",
        next_upgrade = "assembling-machine-1",
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_steam,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {1, 0}},
                },
                production_type = "input",
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        energy_usage = "50kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."steam-assembler.png",
                size = {512,512},
                width = 512,
                height = 512,
                shift = {0,-0.2},
    	        scale = 0.44/2,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_entity_path.."steam-assembler_animation.png",
                    size = {512,512},
                    width = 512,
                    height = 512,
                    shift = {0,-0.2},
    	            scale = 0.44/2,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.6,
                  }
                },
                {
                    light = {
                    type = "basic",
                    intensity = 1,
                    size = 15
                    }
                }
            },
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.8},
            apparent_volume = 0.3,
        },
    }
})
