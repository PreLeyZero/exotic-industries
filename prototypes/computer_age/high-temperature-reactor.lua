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
            {type="item", name="nuclear-reactor", amount=1},
            {type="item", name="ei_fission-tech", amount=100},
            {type="item", name="ei_electronic-parts", amount=50},
            {type="item", name="ei_steel-mechanical-parts", amount=80},
            {type="item", name="ei_simulation-data", amount=100}
        },
        results = {{type="item", name="ei_high-temperature-reactor", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_high-temperature-reactor",
    },
    {
        name = "ei_high-temperature-reactor",
        type = "technology",
        icon = ei_graphics_tech_path.."high-temperature-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_computer-core", "ei_plutonium-239-recycling", "nuclear-power"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_high-temperature-reactor"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_htr-uranium-235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_htr-plutonium-239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_htr-uranium-233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_htr-thorium-232"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_thorium-232__washing"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_thorium-232-fuel"
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
        type = "assembling-machine",
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
                volume = 1200000,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_reactor,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.south, position = {0, 2}},
                },
                production_type = "input",
                filter = "water",
            },
            {   
                volume = 1200000,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_reactor,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.north, position = {0, -2}},
                },
                production_type = "output",
                filter = "steam",
            }
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        graphics_set = {
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },

    -- nuclear stuff

    -- steam = 200J/K
    -- > 500dec steam = 200J * 500 = 100.000J = 0,1MJ
    -- 10k steam at 500dec = 1GJ

    -- 1000dec steam = 0,2MJ
    -- 500dec steam = 0,1MJ
    -- U235 = 25GJ -> 250k steam
    -- U233 = 15GJ -> 150k steam
    -- Pu239 = 30GJ -> 300k steam
    -- Th232 = 10GJ -> 100k steam

    -- + 50k each as HTR is more efficient
    -- * 2 since effeciency is 200% for nuclear

    {
        name = "ei_htr-uranium-235",
        type = "recipe",
        category = "ei_high-temperature-reactor",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_uranium-235-fuel", amount = 1},
            {type = "fluid", name = "water", amount = 2*300000},
        },
        results = {
            {type = "item", name = "ei_used-uranium-235-fuel", amount = 1},
            {type = "fluid", name = "steam", amount = 2*300000, temperature = 500},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steam",
        subgroup = "ei_htr-recipes",
        order = "a",
        --hide_from_player_crafting = true,
    },
    {
        name = "ei_htr-uranium-233",
        type = "recipe",
        category = "ei_high-temperature-reactor",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_uranium-233-fuel", amount = 1},
            {type = "fluid", name = "water", amount = 2*200000},
        },
        results = {
            {type = "item", name = "ei_used-uranium-233-fuel", amount = 1},
            {type = "fluid", name = "steam", amount = 2*200000, temperature = 500},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steam",
        subgroup = "ei_htr-recipes",
        order = "b",
        --hide_from_player_crafting = true,
    },
    {
        name = "ei_htr-plutonium-239",
        type = "recipe",
        category = "ei_high-temperature-reactor",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_plutonium-239-fuel", amount = 1},
            {type = "fluid", name = "water", amount = 2*350000},
        },
        results = {
            {type = "item", name = "ei_used-plutonium-239-fuel", amount = 1},
            {type = "fluid", name = "steam", amount = 2*350000, temperature = 500},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steam",
        subgroup = "ei_htr-recipes",
        order = "c",
        --hide_from_player_crafting = true,
    },
    {
        name = "ei_htr-thorium-232",
        type = "recipe",
        category = "ei_high-temperature-reactor",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_thorium-232-fuel", amount = 1},
            {type = "fluid", name = "water", amount = 2*150000},
        },
        results = {
            {type = "item", name = "ei_used-thorium-232-fuel", amount = 1},
            {type = "fluid", name = "steam", amount = 2*150000, temperature = 500},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "steam",
        subgroup = "ei_htr-recipes",
        order = "d",
        --hide_from_player_crafting = true,
    },



    {
        name = "ei_uranium-233-fuel",
        type = "item",
        icon = ei_graphics_item_path.."uranium-233-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-b-1",
        fuel_category = "ei_nuclear-fuel",
        fuel_value = "15GJ",
        burnt_result = "ei_used-uranium-233-fuel",
        stack_size = 10,
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."uranium-233-fuel.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."fission-fuel_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_used-uranium-233-fuel",
        type = "item",
        icon = ei_graphics_item_path.."used-uranium-233-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-b-2",
        stack_size = 10
    },
    {
        name = "ei_plutonium-239-fuel",
        type = "item",
        icon = ei_graphics_item_path.."plutonium-239-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-c-1",
        fuel_category = "ei_nuclear-fuel",
        fuel_value = "30GJ",
        burnt_result = "ei_used-plutonium-239-fuel",
        stack_size = 10,
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."plutonium-239-fuel.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."fission-fuel_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_used-plutonium-239-fuel",
        type = "item",
        icon = ei_graphics_item_path.."used-plutonium-239-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-c-2",
        stack_size = 10
    },
    {
        name = "ei_thorium-232-fuel",
        type = "item",
        icon = ei_graphics_item_path.."thorium-232-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-d-1",
        -- fuel_categories = {"ei_nuclear-fuel"},
        -- fuel_value = "10GJ",
        burnt_result = "ei_used-thorium-232-fuel",
        stack_size = 10,
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."thorium-232-fuel.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."fission-fuel_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_used-thorium-232-fuel",
        type = "item",
        icon = ei_graphics_item_path.."used-thorium-232-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-d-2",
        stack_size = 10
    },

    {
        name = "ei_plutonium-239",
        type = "item",
        icon = ei_graphics_item_path.."plutonium-239.png",
        icon_size = 64,
        subgroup = "ei_nuclear-processing",
        order = "a-b-a",
        stack_size = 100
    },
    {
        name = "ei_uranium-233",
        type = "item",
        icon = ei_graphics_item_path.."uranium-233.png",
        icon_size = 64,
        subgroup = "ei_nuclear-processing",
        order = "a-b-b",
        stack_size = 100
    },
    {
        name = "ei_thorium-232",
        type = "item",
        icon = ei_graphics_item_path.."thorium-232.png",
        icon_size = 64,
        subgroup = "ei_nuclear-processing",
        order = "a-b-c",
        stack_size = 100
    },

    {
        name = "ei_uranium-235-recycling",
        type = "technology",
        icon = ei_graphics_tech_path.."uranium-235-recycling.png",
        icon_size = 128,
        prerequisites = {"ei_nitric-acid"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-uranium-235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-uranium-235__centrifuging"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plutonium-239-fuel"
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
        name = "ei_nitric-acid-uranium-235",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_used-uranium-235-fuel", amount = 1},
            {type = "fluid", name = "ei_nitric-acid", amount = 100}
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid-uranium-235", amount = 100},
            {type = "item", name = "ei_nuclear-waste", amount = 1, probability = 0.25}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid-uranium-235",
    },
    {
        name = "ei_nitric-acid-uranium-235__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid-uranium-235", amount = 100}
        },
        results = {
            {type = "item", name = "uranium-238", amount = 3},
            {type = "item", name = "uranium-235", amount = 1, probability = 0.65},
            {type = "item", name = "ei_plutonium-239", amount = 1, probability = 0.45},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plutonium-239",
        icon = ei_graphics_tech_path.."uranium-235-recycling.png",
        icon_size = 128,
    },
    {
        name = "ei_plutonium-239-fuel",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_lead-plate", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 10},
            {type = "item", name = "uranium-238", amount = 9},
            {type = "item", name = "ei_plutonium-239", amount = 1},
        },
        results = {
            {type = "item", name = "ei_plutonium-239-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plutonium-239-fuel",
    },
    {
        name = "ei_plutonium-239-recycling",
        type = "technology",
        icon = ei_graphics_tech_path.."plutonium-239-recycling.png",
        icon_size = 128,
        prerequisites = {"ei_uranium-235-recycling"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-plutonium-239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-plutonium-239__centrifuging"
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
        name = "ei_nitric-acid-plutonium-239",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_used-plutonium-239-fuel", amount = 1},
            {type = "fluid", name = "ei_nitric-acid", amount = 100}
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid-plutonium-239", amount = 100},
            {type = "item", name = "ei_nuclear-waste", amount = 1, probability = 0.75}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid-plutonium-239",
    },
    {
        name = "ei_nitric-acid-plutonium-239__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid-plutonium-239", amount = 100}
        },
        results = {
            {type = "item", name = "uranium-238", amount = 3},
            {type = "item", name = "ei_plutonium-239", amount = 1, probability = 0.35},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plutonium-239",
        icon = ei_graphics_tech_path.."plutonium-239-recycling.png",
        icon_size = 128,
    },
    {
        name = "ei_thorium-232__washing",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 100},
            {type = "item", name = "stone", amount = 20},
        },
        results = {
            {type = "item", name = "stone", amount = 16},
            {type = "item", name = "ei_thorium-232", amount = 1, probability = 0.0216},
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 99},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_thorium-232",
    },
    {
        name = "ei_thorium-232-fuel",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_lead-plate", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 10},
            {type = "item", name = "uranium-238", amount = 7},
            {type = "item", name = "ei_thorium-232", amount = 3},
        },
        results = {
            {type = "item", name = "ei_thorium-232-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_thorium-232-fuel",
    },
    {
        name = "ei_thorium-232-recycling",
        type = "technology",
        icon = ei_graphics_tech_path.."thorium-232-recycling.png",
        icon_size = 128,
        prerequisites = {"ei_high-temperature-reactor"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-thorium-232"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-thorium-232__centrifuging"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_uranium-233-fuel"
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
        name = "ei_nitric-acid-thorium-232",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_used-thorium-232-fuel", amount = 1},
            {type = "fluid", name = "ei_nitric-acid", amount = 100}
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid-thorium-232", amount = 100},
            {type = "item", name = "ei_nuclear-waste", amount = 1, probability = 0.75}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid-thorium-232",
    },
    {
        name = "ei_nitric-acid-thorium-232__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid-thorium-232", amount = 100}
        },
        results = {
            {type = "item", name = "uranium-238", amount = 3},
            {type = "item", name = "ei_uranium-233", amount = 1, probability = 0.85},
            {type = "item", name = "ei_thorium-232", amount = 1, probability = 0.95},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-233",
        icon = ei_graphics_tech_path.."thorium-232-recycling.png",
        icon_size = 128,
    },
    {
        name = "ei_uranium-233-fuel",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_lead-plate", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 10},
            {type = "item", name = "uranium-238", amount = 9},
            {type = "item", name = "ei_uranium-233", amount = 1},
        },
        results = {
            {type = "item", name = "ei_uranium-233-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-233-fuel",
    },
    {
        name = "ei_uranium-233-recycling",
        type = "technology",
        icon = ei_graphics_tech_path.."uranium-233-recycling.png",
        icon_size = 128,
        prerequisites = {"ei_thorium-232-recycling"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-uranium-233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid-uranium-233__centrifuging"
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
        name = "ei_nitric-acid-uranium-233",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_used-uranium-233-fuel", amount = 1},
            {type = "fluid", name = "ei_nitric-acid", amount = 100}
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid-uranium-233", amount = 100},
            {type = "item", name = "ei_nuclear-waste", amount = 1, probability = 0.75}
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid-uranium-233",
    },
    {
        name = "ei_nitric-acid-uranium-233__centrifuging",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid-uranium-233", amount = 100}
        },
        results = {
            {type = "item", name = "uranium-238", amount = 3},
            {type = "item", name = "ei_uranium-233", amount = 1, probability = 0.45},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-233",
        icon = ei_graphics_tech_path.."uranium-233-recycling.png",
        icon_size = 128,
    },
})