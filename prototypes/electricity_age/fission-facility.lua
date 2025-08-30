ei_data = require("lib/data")

ei_lib = require("lib/lib")

--====================================================================================================
--FISSION FACILITY
--====================================================================================================

data:extend({
    {
        name = "ei_fission-facility",
        type = "recipe-category",
    },
    {
        name = "ei_fission-facility",
        type = "item",
        icon = ei_graphics_item_path.."fission-facility.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "a-a",
        place_result = "ei_fission-facility",
        stack_size = 50
    },
    {
        name = "ei_crushed-uranium",
        type = "item",
        icon = ei_graphics_item_path.."crushed-uranium.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "d1",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-uranium.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-uranium-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-uranium-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-uranium-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_crushed-pure-uranium",
        type = "item",
        icon = ei_graphics_item_path.."crushed-pure-uranium.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "c-a",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-pure-uranium.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-uranium-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-uranium-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-uranium-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_nuclear-waste",
        type = "item",
        icon = ei_graphics_item_path.."nuclear-waste.png",
        icon_size = 64,
        subgroup = "ei_refining-secondary",
        order = "d1",
        stack_size = 1,
    },
    {
        name = "ei_uranium-test-fuel",
        type = "item",
        icon = ei_graphics_item_path.."test-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-processing",
        order = "a-c-a",
        stack_size = 10,
    },
    {
        name = "ei_fission-tech",
        type = "item",
        icon = ei_graphics_item_path.."fission-tech.png",
        icon_size = 128,
        subgroup = "ei_nuclear-processing",
        order = "a-c-b",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."fission-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."fission-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_uranium-235-fuel",
        type = "item",
        icon = ei_graphics_item_path.."uranium-235-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-a-1",
        fuel_category = "ei_nuclear-fuel",
        fuel_value = "25GJ",
        burnt_result = "ei_used-uranium-235-fuel",
        stack_size = 10,
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."uranium-235-fuel.png",
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
        name = "ei_used-uranium-235-fuel",
        type = "item",
        icon = ei_graphics_item_path.."used-uranium-235-fuel.png",
        icon_size = 64,
        subgroup = "ei_nuclear-fission-fuel",
        order = "a-a-2",
        stack_size = 10
    },
    {
        name = "ei_fission-facility",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="advanced-circuit", amount=40},
            {type="item", name="ei_lead-plate", amount=50},
            {type="item", name="ei_energy-crystal", amount=25},
            {type="item", name="steel-plate", amount=50},
        },
        results = {{type="item", name="ei_fission-facility", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fission-facility",
    },
    {
        name = "ei_fission-facility",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."fission-facility.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_fission-facility"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_fission-facility"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "5MW",
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_slots = 4,
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."fission-facility.png",
                size = {512,512},
                shift = {-0.1, 0},
    	        scale = 0.38,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_entity_path.."fission-facility_animation.png",
                    size = {512,512},
                    shift = {-0.1, 0},
    	            scale = 0.38,
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
            sound = {filename = "__base__/sound/nuclear-reactor-2.ogg", volume = 0.4},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_crushed-uranium",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_uranium-chunk", amount = 4},
        },
        results = {
            {type = "item", name = "ei_crushed-uranium", amount = 2},
            {type = "item", name = "stone", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-uranium",
    },
    {
        name = "ei_crushed-pure-uranium",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_crushed-uranium", amount = 25},
            {type = "fluid", name = "sulfuric-acid", amount = 5},
        },
        results = {
            {type = "item", name = "ei_crushed-pure-uranium", amount = 5},
            {type = "fluid", name = "ei_uranium-solution", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-pure-uranium",
    },
    {
        name = "ei_uranium-solution",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_uranium-solution", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
            {type = "item", name = "ei_crushed-uranium", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-uranium",
        icon = ei_graphics_other_path.."uranium-solution.png",
        icon_size = 64,
        subgroup = "ei_refining-extraction",
        order = "g-a",
    },
    {
        name = "ei_uranium-hexafluorite",
        type = "recipe",
        category = "chemistry",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_crushed-pure-uranium", amount = 25},
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 100},
        },
        results = {
            {type = "fluid", name = "ei_uranium-hexafluorite", amount = 25},
            {type = "item", name = "ei_nuclear-waste", amount = 1, probability = 0.1},
            {type = "item", name = "ei_sand", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-hexafluorite",
    },
    {
        name = "ei_seperate-uranium",
        type = "recipe",
        category = "centrifuging",
        energy_required = 8,
        ingredients = {
            {type = "fluid", name = "ei_uranium-hexafluorite", amount = 100},
        },
        results = {
            {type = "fluid", name = "ei_uranium-hexafluorite", amount = 99},
            {type = "item", name = "uranium-235", amount = 1, probability = 0.0072},
            {type = "item", name = "uranium-238", amount = 1, probability = 0.9927},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."seperate-uranium.png",
        icon_size = 64,
        main_product = "uranium-235",
        subgroup = "ei_nuclear-processing",
        order = "a-a",
    },
    {
        name = "ei_uranium-235-fuel",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_lead-plate", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 10},
            {type = "item", name = "uranium-238", amount = 9},
            {type = "item", name = "uranium-235", amount = 1},
        },
        results = {
            {type = "item", name = "ei_uranium-235-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-235-fuel",
    },
    {
        name = "ei_uranium-test-fuel",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_lead-plate", amount = 4},
            {type = "item", name = "ei_ceramic", amount = 4},
            {type = "item", name = "uranium-238", amount = 10},
        },
        results = {
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_uranium-test-fuel",
    },
    {
        name = "ei_fission-tech",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 4},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 2},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_fission-facility"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_crushed-uranium"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_crushed-pure-uranium"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_uranium-hexafluorite"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_seperate-uranium"
})

table.insert(data.raw.technology["nuclear-power"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_uranium-235-fuel"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_uranium-test-fuel"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_fission-tech"
})

table.insert(data.raw.technology["uranium-processing"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_uranium-solution"
})

ei_lib.remove_unlock_recipe("uranium-processing", "uranium-processing")
ei_lib.remove_unlock_recipe("nuclear-power", "uranium-fuel-cell")