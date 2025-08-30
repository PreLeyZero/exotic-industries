ei_data = require("lib/data")

--====================================================================================================
--DESTILL TOWER
--====================================================================================================

data:extend({
    {
        name = "ei_destill-tower",
        type = "recipe-category",
    },
    {
        name = "ei_destill-tower",
        type = "item",
        icon = ei_graphics_item_path.."destill-tower.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-b-a",
        place_result = "ei_destill-tower",
        stack_size = 50
    },
    {
        name = "ei_destill-tower",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="storage-tank", amount=1},
            {type="item", name="ei_steel-mechanical-parts", amount=6},
            {type="item", name="pipe", amount=4},
            {type="item", name="stone-furnace", amount=1},
        },
        results = {{type="item", name="ei_destill-tower", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_destill-tower",
    },
    {
        name = "ei_destill-tower",
        type = "technology",
        icon = ei_graphics_tech_path.."destill-tower.png",
        icon_size = 256,
        prerequisites = {"oil-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_destill-tower"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_destill-light"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_destill-kerosene"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_destill-heavy"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_destill-lube"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_destill-tower",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."destill-tower.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_destill-tower"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_destill-tower"},
        crafting_speed = 1,
        energy_source = {
            type = 'heat',
            max_temperature = 275,
            min_working_temperature = 215,
            specific_heat = ei_data.specific_heat,
            max_transfer = '10MW',
            connections = {
                {
                    position = {1.3,1.3},
                    direction = defines.direction.east,
                    type = "input",
                },
                {
                    position = {-1.3,1.3},
                    direction = defines.direction.west,
                    type = "input",
                },
                {
                    position = {1.3,-1.3},
                    direction = defines.direction.east,
                    type = "input",
                },
                {
                    position = {-1.3,-1.3},
                    direction = defines.direction.west,
                    type = "input",
                },

                {
                    position = {1.3,1.3},
                    direction = defines.direction.south,
                    type = "input",
                },
                {
                    position = {-1.3,1.3},
                    direction = defines.direction.south,
                    type = "input",
                },
                {
                    position = {1.3,-1.3},
                    direction = defines.direction.north,
                    type = "input",
                },
                {
                    position = {-1.3,-1.3},
                    direction = defines.direction.north,
                    type = "input",
                },
            },
            
        },
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_slots = 3,
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_fluid_heater,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {1, 0}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_fluid_heater,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-1, 0}},
                },
                production_type = "output",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_fluid_heater,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.south, position = {0, 1}},
                },
                production_type = "output",
            },
        },
        energy_usage = "200kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."destill-tower.png",
                size = {512*2,512*2},
                shift = {0,-0.2},
    	        scale = 0.3,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/chemical-plant.ogg", volume = 0.4},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_destill-light",
        type = "recipe",
        category = "ei_destill-tower",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_residual-oil", amount = 55},
        },
        results = {
            {type = "fluid", name = "ei_medium-destilate", amount = 45},
            {type = "fluid", name = "light-oil", amount = 45},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "light-oil",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-b[light-oil]",
    },
    {
        name = "ei_destill-kerosene",
        type = "recipe",
        category = "ei_destill-tower",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_medium-destilate", amount = 45},
        },
        results = {
            {type = "fluid", name = "ei_heavy-destilate", amount = 35},
            {type = "fluid", name = "ei_kerosene", amount = 35},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_kerosene",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-c[kerosene]",
    },
    {
        name = "ei_destill-heavy",
        type = "recipe",
        category = "ei_destill-tower",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_heavy-destilate", amount = 35},
        },
        results = {
            {type = "fluid", name = "ei_lube-destilate", amount = 25},
            {type = "fluid", name = "heavy-oil", amount = 25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "heavy-oil",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-d[heavy-oil]",
    },
    {
        name = "ei_destill-lube",
        type = "recipe",
        category = "ei_destill-tower",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_lube-destilate", amount = 25},
        },
        results = {
            {type = "fluid", name = "lubricant", amount = 10},
            {type = "item", name = "ei_coke", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "lubricant",
        subgroup = "fluid-recipes",
        order = "a[fluid-chemistry]-e[lubricant]",
    },
})