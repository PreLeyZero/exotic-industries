ei_data = require("lib/data")

--====================================================================================================
--BLACK HOLE
--====================================================================================================

data:extend({
    {
        name = "ei_black-hole",
        type = "item",
        icon = ei_graphics_item_path.."black-hole.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "a-a",
        place_result = "ei_black-hole",
        stack_size = 1
    },
    {
        name = "ei_black-hole",
        type = "recipe",
        category = "crafting",
        energy_required = 100,
        ingredients =
        {
            {type="item", name="ei_fusion-reactor", amount=1},
            {type="item", name="ei_neutron-collector", amount=10},
            {type="item", name="ei_high-tech-parts", amount=500},
            {type="item", name="ei_matter-stabilizer", amount=10},
            {type="item", name="ei_clean-plating", amount=500},
            {type="item", name="refined-concrete", amount=1000},
            {type="item", name="ei_black-hole-data", amount=1000},
            {type="item", name="ei_superior-data", amount=1000},
            {type="item", name="ei_fusion-data", amount=1000},
            {type="item", name="ei_fission-tech", amount=1000},
        },
        results = {{type="item", name="ei_black-hole", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_black-hole",
    },
    {
        name = "ei_black-hole",
        type = "technology",
        icon = ei_graphics_tech_path.."black-hole.png",
        icon_size = 256,
        prerequisites = {"ei_black-hole-exploration"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_black-hole"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_energy-injector-pylon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_energy-extractor-pylon"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["black-hole-exotic-age"],
            time = 20
        },
        age = "black-hole-exotic-age",
        enabled = ei_mod.show_exotic_gates,
        visible_when_disabled = false,
    },
    {
        name = "ei_black-hole",
        type = "container",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."black-hole.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 4, result = "ei_black-hole"},
        max_health = 10000,
        corpse = "big-remnants",
        inventory_size = 3,
        enable_inventory_bar = false,
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        picture =
        {
            filename = ei_graphics_entity_path.."black-hole.png",
            priority = "extra-high",
            width = 512,
            height = 512,
            scale = 0.68,
        },
        radius_visualisation_specification = {
            sprite = {
                filename = ei_graphics_other_path.."radius.png",
                width = 256,
                height = 256
            },
            distance = 20
        },
    },
    {
        name = "ei_energy-injector-pylon",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."energy-injector-pylon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 4,
            result = "ei_energy-injector-pylon"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        fixed_recipe = "ei_energy-injector-pylon__running",
        crafting_categories = {"ei_energy-injector-pylon"},
        crafting_speed = 2,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
            buffer_capacity = "20GJ",
        },
        energy_usage = "5GW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."energy-injector-pylon.png",
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
                    filename = ei_graphics_entity_path.."energy-injector-pylon_animation.png",
                    size = {512,512},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.3,
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
    },
    {
        name = "ei_energy-injector-pylon__running",
        type = "recipe",
        category = "ei_energy-injector-pylon",
        energy_required = 1000,
        ingredients = {},
        results = {},
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."energy-injector-pylon.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "b-a",
    },
    {
        name = "ei_energy-injector-pylon",
        type = "recipe-category",
    },
    {
        name = "ei_energy-injector-pylon",
        type = "item",
        icon = ei_graphics_item_path.."energy-injector-pylon.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "b-a",
        place_result = "ei_energy-injector-pylon",
        stack_size = 10
    },
    {
        name = "ei_energy-injector-pylon",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_matter-stabilizer", amount=2},
            {type="item", name="ei_high-tech-parts", amount=50},
            {type="item", name="ei_carbon-structure", amount=500},
            {type="item", name="ei_high-tech-parts", amount=100},
            {type="item", name="ei_clean-plating", amount=100},
            {type="item", name="ei_black-hole-data", amount=100},
        },
        results = {{type="item", name="ei_energy-injector-pylon", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_energy-injector-pylon",
    },
    {
        name = "ei_energy-extractor-pylon",
        type = "item",
        icon = ei_graphics_item_path.."energy-extractor-pylon.png",
        icon_size = 64,
        subgroup = "ei_black-hole",
        order = "b-a",
        place_result = "ei_energy-extractor-pylon",
        stack_size = 10
    },
    {
        name = "ei_energy-extractor-pylon",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_matter-stabilizer", amount=2},
            {type="item", name="ei_high-tech-parts", amount=50},
            {type="item", name="ei_carbon-structure", amount=500},
            {type="item", name="ei_high-tech-parts", amount=100},
            {type="item", name="ei_clean-plating", amount=100},
            {type="item", name="ei_black-hole-data", amount=100},
        },
        results = {{type="item", name="ei_energy-extractor-pylon", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_energy-extractor-pylon",
    },
    {
        name = "ei_energy-extractor-pylon",
        type = "electric-energy-interface",
        icon = ei_graphics_item_path.."energy-extractor-pylon.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 4,
            result = "ei_energy-extractor-pylon"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        energy_source = {
            type = 'electric',
            usage_priority = 'primary-output',
            input_flow_limit = "0kW",
            output_flow_limit = "100GW",
            buffer_capacity = "1000GJ",
            render_no_power_icon = false,
        },
        animation = {
            filename = ei_graphics_entity_path.."energy-extractor-pylon_animation.png",
            size = {512,512},
            shift = {0, 0},
            scale = 0.35,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.3,
        },
        --[[
        picture = {
            filename = ei_graphics_entity_path.."energy-extractor-pylon.png",
            size = {512,512},
            shift = {0, 0},
            scale = 0.35,
            line_length = 1,
        },
        ]]
        energy_production = "0GW",
        energy_usage = "0GW",
        gui_mode = "none",
        continuous_animation = true,
    },
    {
        type = "animation",
        name = "ei_black-hole_animation",
        filename = ei_graphics_entity_path.."black-hole_animation.png",
        priority = "extra-high",
        width = 512,
        height = 512,
        scale = 0.68,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.5,
    },
    {
        type = "animation",
        name = "ei_black-hole_glowing",
        filename = ei_graphics_entity_path.."black-hole_glowing.png",
        priority = "extra-high",
        width = 512,
        height = 512,
        scale = 0.68,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.5,
    },
    {
        type = "animation",
        name = "ei_black-hole_growing",
        filename = ei_graphics_entity_path.."black-hole_growing.png",
        priority = "extra-high",
        width = 512,
        height = 512,
        scale = 0.68,
        line_length = 6,
        lines_per_file = 6,
        frame_count = 36,
        animation_speed = 0.5,
    },
    
})