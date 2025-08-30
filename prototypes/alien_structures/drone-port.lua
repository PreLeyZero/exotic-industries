--====================================================================================================
--DRONE PORT
--====================================================================================================

data:extend({
    {
        name = "ei_drone-port",
        type = "recipe-category",
    },
    {
        name = "ei_drone-port",
        type = "item",
        icon = ei_graphics_item_2_path.."drone-port.png",
        icon_size = 64,
        subgroup = "ei_alien-structures-2",
        order = "a-c",
        place_result = "ei_drone-port",
        stack_size = 10
    },
    {
        name = "ei_drone-port",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="steel-plate", amount=20},
            {type="item", name="ei_steel-mechanical-parts", amount=32},
            {type="item", name="ei_electronic-parts", amount=20},
            {type="item", name="ei_computer-core", amount=1},
        },
        results = {{type="item", name="ei_drone-port", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_drone-port",
    },
    {
        name = "ei_drone-port",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_2_path.."drone-port.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_drone-port"
        },
        max_health = 3000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
        selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
        map_color = ei_data.colors.assembler,
        fixed_recipe = "ei_drone-port__running",
        crafting_categories = {"ei_drone-port"},
        crafting_speed = 1,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
        },
        energy_usage = "50MW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_2_path.."drone-port.png",
                size = {512,512},
                shift = {-0.1, 0.2},
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
                    filename = ei_graphics_entity_2_path.."drone-port_animation.png",
                    size = {512,512},
                    shift = {-0.1, 0.2},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    --frame_count = 16,
                    frame_sequence = {1,2,3,4,5,6,7,8,9,10,11,12},
                    frame_count = 12,
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
    },
    {
        name = "ei_drone-port__running",
        type = "recipe",
        category = "ei_drone-port",
        energy_required = 1000,
        ingredients = {},
        results = {},
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."64_empty.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b4",
    },
})

--DRONE
----------------------------------------------------------------------------------------------------

data:extend({
    {
        type = "car",
        name = "ei_drone",
        --[[
        burner = {
            type = "burner",
            fuel_categories = {"chemical", "ei_nuclear-fuel", "ei_fusion-fuel"},
            effectivity = 1,
            fuel_inventory_size = 3,
            burnt_inventory_size = 3,
        },
        ]]
        energy_source = {
            type = "void",
        },
        consumption = "100kW",
        effectivity = 1,
        inventory_size = 0,
        rotation_speed = 0.01,
        has_belt_immunity = true,
        immune_to_tree_impacts = true,
        immune_to_rock_impacts = true,
        immune_to_cliff_impacts = true,
        tank_driving = true,
        render_layer = "higher-object-under",
        braking_power = "200kW",
        friction = 0.01,
        energy_per_hit_point = 1,
        weight = 100,
        max_health = 1000,
        icon = ei_graphics_item_2_path.."drone.png",
        icon_size = 64,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
        collision_mask = {layers = {}},
        animation = {
            direction_count = 64,
            layers = {
                {
                    filename = ei_graphics_entity_2_path.."drone_animation.png",
                    line_length = 8,
                    lines_per_file = 8,
                    frame_count = 1,
                    width = 512,
                    height = 512,
                    scale = 0.15,
                    direction_count = 64,
                },
                {
                    filename = ei_graphics_entity_2_path.."drone_shadow.png",
                    line_length = 8,
                    lines_per_file = 8,
                    frame_count = 1,
                    width = 512,
                    height = 512,
                    scale = 0.15,
                    draw_as_shadow = true,
                    direction_count = 64,
                    shift = {1.5, 1.5},
                },
            }
        },
        light = {
            {
                minimum_darkness = 0.3,
                intensity = 0.4,
                size = 10,
            },
            {
                type = "oriented",
                minimum_darkness = 0.3,
                picture = {
                    filename = "__core__/graphics/light-cone.png",
                    priority = "extra-high",
                    flags = { "light" },
                    scale = 2,
                    width = 200,
                    height = 200
                },
                shift = {0, -13},
                size = 2,
                intensity = 0.6,
                color = {r = 0.92, g = 0.77, b = 0.3}
            }
        },
    },
    {
        name = "ei_drone-corpse",
        type = "character-corpse",
        icon = ei_graphics_item_2_path.."drone.png",
        icon_size = 64,
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
        time_to_live = 60*15, -- 15 minutes
        picture = data.raw["container"]["crash-site-chest-1"].picture,
        minable = {
            mining_time = 1
        },
    }
})

-- drone character
local drone_character = util.table.deepcopy(data.raw["character"]["character"])
local reach = 40
drone_character.name = "ei_drone-character"
drone_character.reach_distance = reach
drone_character.reach_resource_distance = reach
drone_character.build_distance = reach
drone_character.drop_item_distance = reach

data:extend({drone_character})