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
            {type="item", name="steel-plate", amount=4},
            {type="item", name="ei_steel-mechanical-parts", amount=6},
            {type="item", name="copper-plate", amount=4},
            {type="item", name="stone-furnace", amount=1},
        },
        results = {{type="item", name="ei_burner-heater", amount=1}},
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
            },
            {
                type = "unlock-recipe",
                recipe = "ei_basic-heat-pipe"
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
        circuit_wire_max_distance = 9,
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
        consumption = "1300kW",
        energy_source = {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = 0.85,
            fuel_inventory_size = 1,
            burnt_inventory_size = 1,
            smoke = {
                {
                    name = "smoke",
                    frequency = 5,
                    position = {0,-1.3},
                },
            },
            emissions_per_minute = {pollution = 15 },
        },
        heat_buffer = {
            max_temperature = 275,
            specific_heat = ei_data.specific_heat,
            max_transfer = "1800kW",
            minimum_heat = "1kJ",
            heat_decay = 0,
            heat_buffer = "100MW",
            connections = {
                {
                    position = {0,1.3},
                    direction = defines.direction.south,
                    type = "output",
                },
                {
                    position = {-1.3,0},
                    direction = defines.direction.west,
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
            },
        },
        --[[
        connection_patches_connected = {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
            width = 64,
            height = 64,
            variation_count = 4,
            scale = 0.5
        },
        connection_patches_disconnected = {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
            width = 64,
            height = 64,
            variation_count = 4,
            scale = 0.5
        },

        heat_connection_patches_connected = {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
            width = 64,
            height = 64,
            variation_count = 4,
            scale = 0.5
        },
        heat_connection_patches_disconnected = {
            filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
            width = 64,
            height = 64,
            variation_count = 4,
            scale = 0.5
        },
        ]]--
        neighbour_bonus = 0.25,
        scale_energy_usage = true,
        picture = {
            filename = ei_graphics_entity_path.."burner-heater.png",
            priority = "extra-high",
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.45/2,
        },
        working_light_picture = {
            filename = ei_graphics_entity_path.."burner-heater_light.png",
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