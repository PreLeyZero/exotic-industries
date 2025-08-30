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
        subgroup = "ei_alien-structures-2",
        order = "a-b",
        place_result = "ei_gate",
        stack_size = 10
    },
    {
        name = "ei_gate",
        type = "recipe",
        category = "crafting",
        energy_required = 30,
        ingredients =
        {
            {type="item", name="concrete", amount=50},
            {type="item", name="ei_electronic-parts", amount=100},
            {type="item", name="battery", amount=200},
            {type="item", name="ei_high-energy-crystal", amount=50},
            {type="item", name="steel-plate", amount=200},
            {type="item", name="ei_steel-mechanical-parts", amount=100}
        },
        results = {{type="item", name="ei_gate", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_gate",
    },
    {
        name = "ei_gate",
        type = "technology",
        icon = ei_graphics_tech_2_path.."gate.png",
        icon_size = 256,
        prerequisites = {"ei_knowledge-console", "ei_computer-core", "ei_high-energy-crystal"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_gate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_drone-port"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_concentrated-gaia-water"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_water"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge"],
            time = 20
        },
        -- age = "advanced-computer-age",
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
        selection_box = {{-5.4, -5.4}, {5.4, 5.4}},
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
            scale = 0.39
        },
        -- continuous_animation = true,
        energy_source = {
            type = "electric",
            buffer_capacity = "5GJ",
            usage_priority = "secondary-input",
            input_flow_limit = "100MW",
            output_flow_limit = "0MW",
        },
        energy_usage = "20MW",
        selectable_in_game = false,
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
            scale = 0.39
        },
        inventory_type = "with_filters_and_bar",
        health = 3000,
        minable = {mining_time = 1, --[[result = "ei_gate"]]},
        flags = {"not-blueprintable", "not-on-map", "not-flammable", "not-repairable", "not-upgradable", "hide-alt-info", "not-deconstructable"},
        hidden = true,
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        --circuit_wire_connection_point = data.raw["container"]["steel-chest"].circuit_wire_connection_point,
        circuit_wire_max_distance = data.raw["container"]["steel-chest"].circuit_wire_max_distance,
        circuit_connector_sprites = ei_lib.make_circuit_connector(-0.77, 1.6)[2],
        circuit_wire_connection_point = ei_lib.make_circuit_connector(-0.77, 1.6)[1]
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
    {
        type = "capsule",
        name = "ei_gate-remote",
        icon = ei_graphics_item_2_path.."gate-remote.png",
        icon_size = 64,
        stack_size = 1,
        flags = {"only-in-cursor"},
        hidden = true,
        capsule_action = {
            type = "throw",
            uses_stack = false,
            attack_parameters = {
                type = "projectile",
                range = 1000,
                cooldown = 60,
                ammo_category = "ei_gate-remote-ammo",
                ammo_type = {
                    target_type = "position",
                    action = {
                        type = "direct",
                        action_delivery = {
                            type = "instant",
                            target_effects = {
                                {
                                    type = "script",
                                    effect_id = "ei_gate-remote"
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    {
        type = "ammo-category",
        name = "ei_gate-remote-ammo"
    },
    {
        type = "sprite",
        name = "ei_gate-remote-sprite",
        filename = ei_graphics_entity_2_path.."position_marker.png",
        width = 258,
        height = 183,
    }
    --[[
    {
        type = "artillery-flare",
        name = "ei_gate-flare",
        pictures = data.raw["artillery-flare"]["artillery-flare"].pictures,
        render_layer = "higher-object-under",
        render_layer_when_on_ground = "higher-object-under",
        shots_per_flare = 0,
        life_time = 60,
        map_color = {r=1, g=0, b=0},

    }
    ]]
})