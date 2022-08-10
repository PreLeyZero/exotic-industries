ei_data = require("lib/data")

--====================================================================================================
--BURNER HEATER
--====================================================================================================

data:extend({
    {
        name = "ei_burner-heater",
        type = "item",
        icon = ei_graphics_item_path.."burner-heater.png",
        icon_size = 64,
        subgroup = "energy",
        order = "b[steam-power]-b[burner-heater]",
        place_result = "ei_burner-heater",
        stack_size = 50
    },
    {
        name = "ei_burner-heater",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"steel-plate", 4},
            {"ei_steel-mechanical-parts", 6},
            {"copper-plate", 4},
            {"stone-furnace", 1},
        },
        result = "ei_burner-heater",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_burner-heater",
    },
    {
        name = "ei_burner-heater",
        type = "technology",
        icon = ei_graphics_tech_path.."burner-heater.png",
        icon_size = 256,
        prerequisites = {"steel-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_burner-heater"
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
        name = "ei_burner-heater",
        type = "reactor",
        icon = ei_graphics_item_path.."burner-heater.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_burner-heater"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        consumption = "900kW",
        energy_source = {
            type = "burner",
            fuel_category = "chemical",
            effectivity = 0.85,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            smoke = {
                {
                    name = "smoke",
                    tape = "trival-smoke",
                    frequency = 5,
                    position = {0,-1.3},
                    duration = 1,
                },
            },
            emissions_per_minute = 10,
        },
        heat_buffer = {
            max_temperature = 200,
            specific_heat = "1MJ",
            max_transfer = "1800KW",
            minimum_heat = "1MJ",
            heat_decay = 0.1,
            heat_buffer = "50MW",
            connections = {
                {
                    position = {0,1.3},
                    direction = defines.direction.south,
                    type = "output",
                },
                {
                    position = {0,-1.3},
                    direction = defines.direction.north,
                    type = "output",
                },
                {
                    position = {1.3,0},
                    direction = defines.direction.east,
                    type = "output",
                },
                {
                    position = {-1.3,0},
                    direction = defines.direction.west,
                    type = "output",
                },
            },
        },
        neighbour_bonus = 0.15,
        scale_energy_usage = true,
        picture = {
            filename = ei_graphics_entity_path.."burner-heater.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            shift = {0.0, 0.0},
            scale = 0.5,
        },
        working_light_picture = {
            filename = ei_graphics_entity_path.."burner-heater_light.png",
            priority = "extra-high",
            width = 128,
            height = 128,
            shift = {0.0, 0.0},
            scale = 0.5,
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/steel-furnace.ogg"},
            apparent_volume = 0.3,
        },
    }
})