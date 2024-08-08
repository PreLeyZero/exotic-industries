ei_data = require("lib/data")

--====================================================================================================
--VOID ENGINE
--====================================================================================================

data:extend({
    {
        name = "ei_void-engine",
        type = "recipe-category",
    },
    {
        name = "ei_void-engine",
        type = "item",
        icon = ei_graphics_item_2_path.."void-engine.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-5",
        place_result = "ei_void-engine",
        stack_size = 50
    },
    {
        name = "ei_void-engine",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"ei_insulated-tank", 2},
            {"ei_arc-furnace", 1},
            {"ei_magnet", 20},
            {"ei_steel-mechanical-parts", 18}
        },
        result = "ei_void-engine",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_void-engine",
    },
    {
        name = "ei_void-engine",
        type = "technology",
        icon = ei_graphics_tech_2_path.."void-engine.png",
        icon_size = 256,
        prerequisites = {"ei_sus-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_void-engine"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_void-engine",
        type = "assembling-machine",
        icon = ei_graphics_item_2_path.."void-engine.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_void-engine"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-4.4, -4.4}, {4.4, 4.4}},
        selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_void-engine"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "20MW",
        result_inventory_size = 1,
        source_inventory_size = 1,
        allowed_effects = {"speed", "consumption", "pollution"},
        module_specification = {
            module_slots = 20
        },
        animation = {
            filename = ei_graphics_entity_2_path.."void-engine_off.png",
            size = {512*2,512*2},
            shift = {0, -0.5},
	        scale = 0.33,
            line_length = 1,
            --lines_per_file = 2,
            frame_count = 1,
            -- animation_speed = 0.2,
        },
        working_visualisations = {
            {
              animation = 
              {
                filename = ei_graphics_entity_2_path.."void-engine.png",
                size = {512*2,512*2},
                shift = {0, -0.5},
	            scale = 0.33,
                line_length = 1,
                frame_count = 1,
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
        working_sound =
        {
            sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
})