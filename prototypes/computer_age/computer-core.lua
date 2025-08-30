ei_data = require("lib/data")

--====================================================================================================
-- COMPUTER CORE
--====================================================================================================

data:extend({
    {
        name = "ei_computer-core",
        type = "recipe-category",
    },
    {
        name = "ei_computer-core",
        type = "item",
        icon = ei_graphics_item_path.."computer-core.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_result = "ei_computer-core",
        stack_size = 50
    },
    {
        name = "ei_computer-core",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="lab", amount=4},
            {type="item", name="ei_electronic-parts", amount=40},
            {type="item", name="ei_energy-crystal", amount=20},
            {type="item", name="ei_steel-mechanical-parts", amount=16}
        },
        results = {{type="item", name="ei_computer-core", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_computer-core",
    },
    {
        name = "ei_computing-power",
        type = "recipe",
        category = "ei_computer-core",
        energy_required = 100,
        ingredients = {
            {type = "item", name = "ei_electronic-parts", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_computing-power", amount = 1000},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_computing-power",
    },
    {
        name = "ei_computer-core",
        type = "technology",
        icon = ei_graphics_tech_path.."computer-core.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_computer-core"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_data-pipe"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_computing-power"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_small-simulator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_simulation-data"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_computer-core",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."computer-core.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_computer-core"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_computer-core"},
        crafting_speed = 1,
        fixed_recipe = "ei_computing-power",
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "15MW",
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_data,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.east, position = {2, 0}},
                },
                production_type = "output",
            },
        },
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."computer-core.png",
                size = {512,512},
                shift = {0, 0},
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
                    filename = ei_graphics_entity_path.."computer-core_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 6,
                    lines_per_file = 6,
                    frame_count = 36,
                    animation_speed = 0.4,
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
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    }
})