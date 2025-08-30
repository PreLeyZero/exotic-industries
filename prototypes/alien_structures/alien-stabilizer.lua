ei_data = require("lib/data")

--====================================================================================================
--ALIEN STABILIZER
--====================================================================================================

data:extend({
    {
        name = "ei_alien-stabilizer",
        type = "recipe-category",
    },
    {
        name = "ei_alien-stabilizer",
        type = "item",
        icon = ei_graphics_item_path.."alien-stabilizer.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "a-b",
        place_result = "ei_alien-stabilizer",
        stack_size = 10
    },
    {
        name = "ei_alien-stabilizer",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."alien-stabilizer.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_alien-stabilizer"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        fixed_recipe = "ei_alien-stabilizer__running",
        crafting_categories = {"ei_alien-stabilizer"},
        crafting_speed = 2,
        energy_source = {
            type = 'void',
        },
        energy_usage = "1W",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."alien-stabilizer.png",
                size = {512,512},
                shift = {-0.1, 0.2},
    	        scale = 0.35,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_entity_path.."alien-stabilizer_animation.png",
                    size = {512,512},
                    shift = {-0.1, 0.2},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.2,
                    run_mode = "backward",
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
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = ei_data.matter_stabilizer.alien_range
        },
    },
    {
        name = "ei_alien-stabilizer__running",
        type = "recipe",
        category = "ei_alien-stabilizer",
        energy_required = 1000,
        ingredients = {},
        results = {},
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."matter-stabilizer.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b4",
    },
})