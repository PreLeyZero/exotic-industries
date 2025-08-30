ei_data = require("lib/data")

--====================================================================================================
--MATTER STABILIZER
--====================================================================================================

data:extend({
    {
        name = "ei_matter-stabilizer",
        type = "recipe-category",
    },
    {
        name = "ei_matter-stabilizer",
        type = "item",
        icon = ei_graphics_item_path.."matter-stabilizer.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b4",
        place_result = "ei_matter-stabilizer",
        stack_size = 10
    },
    {
        name = "ei_matter-stabilizer",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_advanced-motor", amount=10},
            {type="item", name="ei_high-tech-parts", amount=16},
            {type="item", name="ei_carbon-structure", amount=20},
            {type="item", name="ei_odd-plating", amount=20}
        },
        results = {{type="item", name="ei_matter-stabilizer", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_matter-stabilizer",
    },
    {
        name = "ei_matter-stabilizer",
        type = "technology",
        icon = ei_graphics_tech_path.."matter-stabilizer.png",
        icon_size = 256,
        prerequisites = {"ei_high-tech-parts"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_matter-stabilizer"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_matter-stabilizer",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."matter-stabilizer.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_matter-stabilizer"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        fixed_recipe = "ei_matter-stabilizer__running",
        crafting_categories = {"ei_matter-stabilizer"},
        crafting_speed = 2,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "10MW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."matter-stabilizer.png",
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
                    filename = ei_graphics_entity_path.."matter-stabilizer_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.3,
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
            distance = ei_data.matter_stabilizer.matter_range
        },
    },
    {
        name = "ei_matter-stabilizer__running",
        type = "recipe",
        category = "ei_matter-stabilizer",
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
    {
        type = "sprite",
        name = "ei_stabilizer-radius",
        filename = ei_graphics_other_path.."radius.png",
        width = 256,
        height = 256
    },
})