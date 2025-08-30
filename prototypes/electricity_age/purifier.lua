ei_data = require("lib/data")

--====================================================================================================
--Purifier
--====================================================================================================

data:extend({
    {
        name = "ei_purifier",
        type = "recipe-category",
    },
    {
        name = "ei_purifier",
        type = "item",
        icon = ei_graphics_item_path.."purifier.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "d-a-c-2",
        place_result = "ei_purifier",
        stack_size = 50
    },
    {
        name = "ei_pure-iron",
        type = "item",
        icon = "__base__/graphics/icons/iron-ore.png",
        icon_mipmaps = 4,
        icon_size = 64,
        subgroup = "ei_refining-purified",
        order = "b-a",
        stack_size = 100,
        pictures = {
            {
                filename = "__base__/graphics/icons/iron-ore.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/iron-ore-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/iron-ore-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/iron-ore-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            }
        },
    },
    {
        name = "ei_pure-copper",
        type = "item",
        icon = "__base__/graphics/icons/copper-ore.png",
        icon_mipmaps = 4,
        icon_size = 64,
        subgroup = "ei_refining-purified",
        order = "b-b",
        stack_size = 100,
        pictures = {
            {
                filename = "__base__/graphics/icons/copper-ore.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/copper-ore-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/copper-ore-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = "__base__/graphics/icons/copper-ore-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            }
        },
    },
    {
        name = "ei_pure-lead",
        type = "item",
        icon = ei_graphics_item_path.."pure-lead.png",
        icon_mipmaps = 4,
        icon_size = 64,
        subgroup = "ei_refining-purified",
        order = "b-c",
        stack_size = 100,
        pictures = {
            {
                filename = ei_graphics_item_path.."pure-lead.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-lead-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-lead-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-lead-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            }
        },
    },
    {
        name = "ei_pure-gold",
        type = "item",
        icon = ei_graphics_item_path.."pure-gold.png",
        icon_mipmaps = 4,
        icon_size = 64,
        subgroup = "ei_refining-purified",
        order = "b-d",
        stack_size = 100,
        pictures = {
            {
                filename = ei_graphics_item_path.."pure-gold.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-gold-1.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-gold-2.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."pure-gold-3.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
            }
        },
    },
    {
        name = "ei_purifier",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="chemical-plant", amount=1},
            {type="item", name="electric-engine-unit", amount=6},
            {type="item", name="storage-tank", amount=2},
            {type="item", name="ei_steel-mechanical-parts", amount=8}
        },
        results = {{type="item", name="ei_purifier", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_purifier",
    },
    {
        name = "ei_purifier",
        type = "technology",
        icon = ei_graphics_tech_path.."purifier.png",
        icon_size = 256,
        prerequisites = {"ei_deep-mining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_purifier"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_hydrofluoric-acid"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_gold-chunk__purifier"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_iron-chunk__purifier"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_copper-chunk__purifier"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lead-chunk__purifier"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_gold-ingot__pure-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_iron-ingot__pure-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_copper-ingot__pure-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lead-ingot__pure-smelting"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__fluorite"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__vent"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_water__vent"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__landfill"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__slag"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__sand"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
    {
        name = "ei_purifier",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."purifier.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_purifier"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_purifier"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "450kW",
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_slots = 4,
        fluid_boxes = {
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {2, 0}},
                },
                production_type = "input",
            },
            {   
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.west, position = {-2, 0}},
                },
                production_type = "output",
            },
        },
        fluid_boxes_off_when_no_fluid_recipe = true,
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."purifier.png",
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
                    filename = ei_graphics_entity_path.."purifier_animation.png",
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
            sound = {filename = "__base__/sound/chemical-plant-3.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_gold-chunk__purifier",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "water", amount = 10},
            {type = "item", name = "ei_gold-chunk", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 10},
            {type = "item", name = "ei_pure-gold", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."gold-purification.png",
        subgroup = "ei_refining-purified",
        order = "a-d",
    },
    {
        name = "ei_lead-chunk__purifier",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "water", amount = 10},
            {type = "item", name = "ei_lead-chunk", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 10},
            {type = "item", name = "ei_pure-lead", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."lead-purification.png",
        subgroup = "ei_refining-purified",
        order = "a-c",
    },
    {
        name = "ei_iron-chunk__purifier",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "water", amount = 5},
            {type = "item", name = "ei_iron-chunk", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
            {type = "item", name = "ei_pure-iron", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."iron-purification.png",
        subgroup = "ei_refining-purified",
        order = "a-a",
    },
    {
        name = "ei_copper-chunk__purifier",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "water", amount = 5},
            {type = "item", name = "ei_copper-chunk", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
            {type = "item", name = "ei_pure-copper", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."copper-purification.png",
        subgroup = "ei_refining-purified",
        order = "a-b",
    },
    {
        name = "ei_copper-ingot__pure-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_pure-copper", amount = 2},
        },
        results = {
            {type = "item", name = "ei_copper-ingot", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        --hide_from_player_crafting = true,
        main_product = "ei_copper-ingot",
    },
    {
        name = "ei_iron-ingot__pure-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_pure-iron", amount = 2},
        },
        results = {
            {type = "item", name = "ei_iron-ingot", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        --hide_from_player_crafting = true,
        main_product = "ei_iron-ingot",
    },
    {
        name = "ei_lead-ingot__pure-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_pure-lead", amount = 2},
        },
        results = {
            {type = "item", name = "ei_lead-ingot", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        --hide_from_player_crafting = true,
        main_product = "ei_lead-ingot",
    },
    {
        name = "ei_gold-ingot__pure-smelting",
        type = "recipe",
        category = "smelting",
        energy_required = 3.2,
        ingredients = {
            {type = "item", name = "ei_pure-gold", amount = 2},
        },
        results = {
            {type = "item", name = "ei_gold-ingot", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        --hide_from_player_crafting = true,
        main_product = "ei_gold-ingot",
    },
    {
        name = "ei_dirty-water__fluorite",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 50},
        },
        results = {
            {type = "item", name = "ei_fluorite", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fluorite",
    },
    {
        name = "ei_dirty-water__vent",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 100},
        },
        results = {

        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."dirty-water_venting.png",
        subgroup = "ei_refining-purified",
        order = "a-e",
    },
    {
        name = "ei_water__vent",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "water", amount = 100},
        },
        results = {

        },
        always_show_made_in = true,
        enabled = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."vent_water.png",
        subgroup = "ei_refining-purified",
        order = "a-f",
    },
    {
        name = "ei_dirty-water__landfill",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 1000},
        },
        results = {
            {type = "item", name = "landfill", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "landfill",
    },
    {
        name = "ei_dirty-water__slag",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "water", amount = 5},
            {type = "item", name = "ei_slag", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dirty-water",
    },
    {
        name = "ei_dirty-water__sand",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "water", amount = 5},
            {type = "item", name = "ei_sand", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dirty-water",
    },
})