local ei_lib = require("lib/lib")

--====================================================================================================
--GATE
--====================================================================================================


data:extend({
    {
        name = "ei_gate",
        type = "item",
        icon = ei_graphics_item_2_path.."gate.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "b-a",
        place_result = "ei_gate",
        stack_size = 10
    },
    {
        name = "ei_gate",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"chemical-plant", 2},
            {"ei_advanced-motor", 10},
            {"storage-tank", 2},
            {"ei_steel-mechanical-parts", 8}
        },
        result = "ei_gate",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_gate",
    },
    {
        name = "ei_gate",
        type = "technology",
        icon = ei_graphics_tech_2_path.."gate.png",
        icon_size = 256,
        prerequisites = {"ei_big-lab"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_gate"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_gate",
        type = "electric-energy-interface",
        icon = ei_graphics_item_2_path.."gate.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        map_color = ei_data.colors.assembler,
        -- minable = {mining_time = 1, result = "ei_gate"},
        gui_mode = "none",
        -- overlay other when no power and no destination
        --[[
        animation = {
            filename = ei_graphics_entity_2_path.."gate_animation.png",
            width = 1024,
            height = 1024,
            shift = {0, -1},
            scale = 0.39,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.3,
            run_mode = "backward",
        },
        picture = {
            filename = ei_graphics_path.."graphics/64_empty.png",
            width = 64,
            height = 64,
        },
        ]]
        picture = {
            filename = ei_graphics_entity_2_path.."gate.png",
            width = 1024,
            height = 1024,
            shift = {0, -1},
            scale = 0.39,
        },
        -- continuous_animation = true,
        energy_source = {
            type = "electric",
            buffer_capacity = "10GJ",
            usage_priority = "tertiary",
            input_flow_limit = "200MW",
            output_flow_limit = "0MW",
            energy_usage = "100MW",
        },
    },
    {
        name = "ei_gate-container",
        type = "container",
        inventory_size = 30,
        picture = {
            filename = ei_graphics_entity_2_path.."gate.png",
            width = 1024,
            height = 1024,
            shift = {0, -1},
            scale = 0.39,
        },
        inventory_type = "with_filters_and_bar",
        minable = {mining_time = 1, --[[result = "ei_gate"]]},
        flags = {"not-blueprintable", "not-on-map", "not-flammable", "not-repairable", "not-upgradable", "hidden", "hide-alt-info", "not-deconstructable"},
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        --circuit_wire_connection_point = data.raw["container"]["steel-chest"].circuit_wire_connection_point,
        circuit_wire_max_distance = data.raw["container"]["steel-chest"].circuit_wire_max_distance,
        circuit_connector_sprites = ei_lib.make_circuit_connector(-0.1, 1.5)[2],
        circuit_wire_connection_point = ei_lib.make_circuit_connector(-0.1, 1.5)[1]
    },
    {
        type = "animation",
        name = "ei_gate-runnig",
        priority = "extra-high",
        filename = ei_graphics_entity_2_path.."gate_animation.png",
        width = 1024,
        height = 1024,
        shift = {0, -1},
        scale = 0.39,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.3,
        run_mode = "backward",
    },
    {
        type = "animation",
        name = "ei_exit-simple",
        priority = "extra-high",
        filename = ei_graphics_entity_2_path.."exit_simple.png",
        width = 512,
        height = 512,
        shift = {0, 0},
        scale = 0.35,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.3,
        run_mode = "backward",
    },
    
})