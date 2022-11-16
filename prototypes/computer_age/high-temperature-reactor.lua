ei_data = require("lib/data")

--====================================================================================================
--ARC FURNACE
--====================================================================================================

data:extend({
    {
        name = "ei_high-temperature-reactor",
        type = "recipe-category",
    },
    {
        name = "ei_high-temperature-reactor",
        type = "item",
        icon = ei_graphics_item_path.."high-temperature-reactor.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "b-b",
        place_result = "ei_high-temperature-reactor",
        stack_size = 10
    },
    {
        name = "ei_high-temperature-reactor",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"nuclear-reactor", 1},
            {"ei_fission-tech", 100},
            {"ei_electronic-parts", 50},
            {"ei_steel-mechanical-parts", 80},
            {"ei_simulation-data", 100}
        },
        result = "ei_high-temperature-reactor",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_high-temperature-reactor",
    },
    {
        name = "ei_high-temperature-reactor",
        type = "technology",
        icon = ei_graphics_tech_path.."high-temperature-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_computer-core"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_high-temperature-reactor"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_htr-uranium-235"
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
        name = "ei_high-temperature-reactor",
        type = "furnace",
        icon = ei_graphics_item_path.."high-temperature-reactor.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_high-temperature-reactor"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_high-temperature-reactor"},
        crafting_speed = 1,
        energy_source = {
            type = 'heat',
            max_temperature = 1000,
            min_working_temperature = 925,
            specific_heat = ei_data.high_specific_heat,
            max_transfer = '200MW',
            connections = {
                {position = {-2.3, 0}, direction = defines.direction.west},
                {position = {-2.3, 1}, direction = defines.direction.west},
                {position = {-2.3, -1}, direction = defines.direction.west},
                -- {position = {0,1.4}, direction = defines.direction.south},
                {position = {2.3, 0}, direction = defines.direction.east},
                {position = {2.3, 1}, direction = defines.direction.east},
                {position = {2.3, -1}, direction = defines.direction.east},
                -- {position = {-1.5,0}, direction = defines.direction.west}
            }
        },
        energy_usage = "150MW",
        result_inventory_size = 1,
        source_inventory_size = 1,
        fluid_boxes = {
            {   
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_reactor,
                pipe_connections = {
                    {type = "input", position = {0, 3}},
                },
                production_type = "input",
            },
            {   
                base_area = 1,
                base_level = 1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_reactor,
                pipe_connections = {
                    {type = "output", position = {0, -3}},
                },
                production_type = "output",
            },
            off_when_no_fluid_recipe = true
        },
        animation = {
            filename = ei_graphics_entity_path.."high-temperature-reactor.png",
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
                filename = ei_graphics_entity_path.."high-temperature-reactor_animation.png",
                size = {512,512},
                shift = {0, 0},
	            scale = 0.35,
                line_length = 4,
                lines_per_file = 4,
                frame_count = 16,
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
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    -- 1000dec steam = 0,2MJ
    -- 175000 * 1000dec steam = 35GJ 
    -- 100s for 35GJ = 350MW output (-150 for heating)
    -- steam output per second = 350MW/0,2MJ = 1750 steam/s 
    {
        name = "ei_htr-uranium-235",
        type = "recipe",
        category = "ei_high-temperature-reactor",
        energy_required = 100,
        ingredients = {
            {type = "item", name = "ei_uranium-235-fuel", amount = 1},
        },
        results = {
            {type = "item", name = "ei_used-uranium-235-fuel", amount = 1},
            {type = "fluid", name = "steam", amount = 175000, temperature = 1000},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steam",
        hide_from_player_crafting = true,
    },
})