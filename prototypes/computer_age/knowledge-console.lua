ei_data = require("lib/data")

--====================================================================================================
--KNOWLEDGE CONSOLE
--====================================================================================================

data:extend({
    {
        name = "ei_knowledge-console",
        type = "recipe-category",
    },
    {
        name = "ei_knowledge-console",
        type = "item",
        icon = ei_graphics_item_path.."knowledge-console.png",
        icon_size = 64,
        subgroup = "ei_alien-structures-2",
        order = "a-a",
        place_result = "ei_knowledge-console",
        stack_size = 1
    },
    {
        name = "ei_knowledge-console",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"ei_energy-crystal", 10},
            {"lab", 1},
            {"ei_steel-mechanical-parts", 8}
        },
        result = "ei_knowledge-console",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_knowledge-console",
    },
    {
        name = "ei_knowledge-console:running",
        type = "recipe",
        category = "ei_knowledge-console",
        energy_required = 1000,
        ingredients = {},
        results = {},
        result_count = 1,
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."64_empty.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b4",
    },
    {
        name = "ei_knowledge-console",
        type = "technology",
        icon = ei_graphics_tech_path.."knowledge-console.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_knowledge-console"
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
        name = "ei_knowledge-console",
        type = "assembling-machine",
        crafting_categories = {"ei_knowledge-console"},
        icon = ei_graphics_item_path.."knowledge-console.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_knowledge-console"
        },
        max_health = 1000,
        dying_explosion = "medium-explosion",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        fixed_recipe = "ei_knowledge-console:running",
        map_color = ei_data.colors.assembler,
        crafting_speed = 1,
        energy_source = {
            type = "void",
        },
        energy_usage = "1W",
        animation = {
            filename = ei_graphics_entity_2_path.."knowledge-console.png",
            size = {256, 256},
            shift = {0, -0.3},
            scale = 0.16*2,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_2_path.."knowledge-console_animation.png",
                size = {256, 256},
                shift = {0, -0.3},
                scale = 0.16*2,
                line_length = 8,
                lines_per_file = 8,
                frame_count = 64,
                animation_speed = 0.5,
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
        }
    }
})