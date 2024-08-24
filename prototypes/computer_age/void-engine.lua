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
        name = "ei_void-fuel",
        type = "item",
        icon = ei_graphics_item_2_path.."void-fuel.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[empty-barrel]-1",
        stack_size = 50
    },
    {
        name = "ei_void-inflator",
        type = "item",
        icon = ei_graphics_item_2_path.."void-inflator.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[empty-barrel]-1",
        stack_size = 1
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
        name = "ei_void-inflator",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {"explosives", 4},
            {"ei_bio-matter", 2},
            {"ei_sus-plating", 2},
            {"ei_high-energy-crystal", 4}
        },
        result = "ei_void-inflator",
        result_count = 3,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_void-inflator",
    },
    {
        name = "ei_void-fuel",
        type = "recipe",
        category = "ei_void-engine",
        energy_required = 100,
        ingredients =
        {
            {type="item", name="ei_void-inflator", amount=1},
            {type="item", name="ei_empty-cryo-container", amount=1},
        },
        results = {
            {type="item", name="ei_void-fuel", amount=1, probability=0.1},
            {type="item", name="ei_empty-cryo-container", amount=1, probability=0.9}
        },
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_void-fuel",
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
            {
                type = "unlock-recipe",
                recipe = "ei_void-inflator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_void-fuel"
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
        resistances = {
            {
                type = "electric",
                percent = 100
            },
        },
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
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = 30,
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