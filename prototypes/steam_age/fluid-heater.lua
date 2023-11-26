ei_data = require("lib/data")

--====================================================================================================
--FLUID HEATER
--====================================================================================================

data:extend({
    {
        name = "ei_fluid-heater",
        type = "item",
        icons = {
            {
                icon = ei_graphics_item_path.."fluid-heater.png",
                icon_size = 64,
            },
            {
                icon = ei_graphics_other_path.."fluid_down_overlay.png",
                icon_size = 64,
            }
        },
        subgroup = "energy",
        order = "b[steam-power]-b[fluid-heater]",
        place_result = "ei_fluid-heater",
        stack_size = 50
    },
    {
        name = "ei_fluid-heater",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"steel-plate", 4},
            {"ei_steel-mechanical-parts", 6},
            {"pipe", 4},
            {"stone-furnace", 1},
        },
        result = "ei_fluid-heater",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fluid-heater",
    },
    {
        name = "ei_fluid-heater",
        type = "technology",
        icon = ei_graphics_tech_path.."fluid-heater.png",
        icon_size = 256,
        prerequisites = {"ei_steam-oil-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fluid-heater"
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
        name = "ei_fluid-heater",
        type = "reactor",
        icon = ei_graphics_item_path.."fluid-heater.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_fluid-heater"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        consumption = "1300kW",
        energy_source = {
            type = "fluid",
            fluid_box = {
                base_area = 1,
                base_level = -1,
                height = 2,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_fluid_heater,
                pipe_connections = {
                    {type = "input-output", position = {0, -2}},
                    {type = "input-output", position = {0, 2}},
                    {type = "input-output", position = {2, 0}},
                    {type = "input-output", position = {-2, 0}}
                },
                production_type = "input-output",
            },
            effectivity = 1,
            burns_fluid = true,
            scale_fluid_usage = true,
            emissions_per_minute = 15,
        },
        heat_buffer = {
            max_temperature = 275,
            specific_heat = ei_data.specific_heat,
            max_transfer = "1800KW",
            minimum_heat = "1KJ",
            heat_decay = 0,
            heat_buffer = "100MW",
            connections = {
                {
                    position = {1.3,1.3},
                    direction = defines.direction.east,
                    type = "output",
                },
                {
                    position = {-1.3,1.3},
                    direction = defines.direction.west,
                    type = "output",
                },
                {
                    position = {1.3,-1.3},
                    direction = defines.direction.east,
                    type = "output",
                },
                {
                    position = {-1.3,-1.3},
                    direction = defines.direction.west,
                    type = "output",
                },

                {
                    position = {1.3,1.3},
                    direction = defines.direction.south,
                    type = "output",
                },
                {
                    position = {-1.3,1.3},
                    direction = defines.direction.south,
                    type = "output",
                },
                {
                    position = {1.3,-1.3},
                    direction = defines.direction.north,
                    type = "output",
                },
                {
                    position = {-1.3,-1.3},
                    direction = defines.direction.north,
                    type = "output",
                },
            },
            pipe_covers = ei_pipe_heat_basic,
            heat_pipe_covers = ei_pipe_heated_basic,
        },

        neighbour_bonus = 0.25,
        scale_energy_usage = true,
        picture = {
            filename = ei_graphics_entity_path.."fluid-heater.png",
            priority = "extra-high",
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.45/2,
        },
        working_light_picture = {
            filename = ei_graphics_entity_path.."fluid-heater_light.png",
            priority = "extra-high",
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.45/2,
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/steel-furnace.ogg"},
            apparent_volume = 0.3,
        },
    }
})