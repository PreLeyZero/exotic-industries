ei_data = require("lib/data")

--====================================================================================================
-- PLASMA TURRET
--====================================================================================================

data:extend({
    {
        name = "ei_plasma-turret",
        type = "item",
        icon = ei_graphics_item_path.."plasma-turret.png",
        icon_size = 64,
        subgroup = "defensive-structure",
        order = "c-a",
        place_result = "ei_plasma-turret",
        stack_size = 50
    },
    {
        name = "ei_plasma-turret",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="laser-turret", amount=4},
            {type="item", name="ei_high-energy-crystal", amount=30},
            {type="item", name="ei_magnet", amount=25},
            {type="item", name="ei_superior-data", amount=40},
            {type="item", name="ei_plasma-data", amount=40},
        },
        results = {{type="item", name="ei_plasma-turret", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_plasma-turret",
    },
    {
        name = "ei_plasma-turret",
        type = "technology",
        icon = ei_graphics_tech_path.."plasma-turret.png",
        icon_size = 256,
        prerequisites = {"ei_plasma-heater"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-turret"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        type = "electric-turret",
        name = "ei_plasma-turret",
        icon = ei_graphics_item_path.."plasma-turret.png",
        icon_size = 64,
        flags = {"placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_plasma-turret"
        },
        max_health = 1000,
        corpse = "medium-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        resistances = {
			{type = "physical", percent = 50},
			{type = "fire", percent = 75},
			{type = "impact", percent = 75}
		},
        energy_source = {
			type = "electric",
			buffer_capacity = "200MJ",
			input_flow_limit = "150MW",
			drain = "40MW",
			usage_priority = "primary-input"
		},
        rotation_speed = 0.005,
        --preparing_speed = 0.1,
        --folding_speed = 0.1,
        attacking_speed = 0.5,
        folded_animation = {
            filename = ei_graphics_entity_path.."plasma-turret_animation.png",
            size = {512,512},
            shift = {0, 0},
	        scale = 0.35,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            animation_speed = 0.35,
        },
        attacking_animation = {
            filename = ei_graphics_entity_path.."plasma-turret_animation.png",
            size = {512,512},
            shift = {0, 0},
            scale = 0.35,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            animation_speed = 0.35,
        },
        graphics_set = {
            base_visualisation = {
                animation = {
                    layers = {
                        {
                            filename = ei_graphics_other_path.."64_empty.png",
                            size = {64,64},
                            shift = {0, 0},
                            scale = 0.44/2,
                            line_length = 1,
                            direction_count = 1,
                            frame_count = 1,
                        }
                    }
                }
            }
        },
        call_for_help_radius = 40,
        attack_parameters = {
            type = "projectile",
            ammo_category = "electric",
            cooldown = 300,
            projectile_center = {0, 0.14},
            projectile_creation_distance = 2.3,
            range = 300,
            min_range = 40,
            health_penalty = -1000,
            rotate_penalty = 100,
            sound = {
                {
                    filename = "__base__/sound/fight/laser-1.ogg",
                    volume = 0.7
                },
                {
                    filename = "__base__/sound/fight/laser-2.ogg",
                    volume = 0.7
                },
                {
                    filename = "__base__/sound/fight/laser-3.ogg",
                    volume = 0.7
                },
            },
            damage_modifier = 1,
            ammo_type = {
                type = "projectile",
                category = "electric",
                energy_consumption = "100MJ",
                projectile = "ei_plasma-bullet",
                -- speed = 10,
                action = {
                    type = "direct",
                    action_delivery = {
                        type = "projectile",
                        projectile = "ei_plasma-bullet",
                        starting_speed = 10,
                        direction_deviation = 0.1,
                        range_deviation = 0.5,
                        max_range = 300,
                    }
                }
            }
        },
    },
    {
        name = "ei_plasma-bullet",
        type = "projectile",
        flags = {"not-on-map"},
        acceleration = 0.005,
        action = {
            action_delivery = {
                target_effects = {
                    {
                        type = "damage",
                        damage = {amount = 1000, type = "electric"},
                        force = "not-same",
                    },
                    {
                        action = {
                            action_delivery = {
                                target_effects = {
                                    {
                                        damage = {amount = 300,type = "explosion"},
                                        force = "not-same",
                                        type = "damage"
                                    },
                                },
                                type = "instant"
                            },
                            radius = 9,
                            type = "area"
                        },
                        type = "nested-result"
                    },
                    {
                        type = "create-entity",
                        entity_name = "ei_plasma-explosion"
                    },
                    {
                        check_buildability = true,
                        entity_name = "huge-scorchmark-tintable",
                        type = "create-entity"
                    },
                    {
                        repeat_count = 1,
                        type = "invoke-tile-trigger"
                    },
                    {
                        decoratives_with_trigger_only = false,
                        from_render_layer = "decorative",
                        include_decals = false,
                        include_soft_decoratives = true,
                        invoke_decorative_trigger = true,
                        radius = 9,
                        to_render_layer = "object",
                        type = "destroy-decoratives"
                    }
                },
                type = "instant",
            },
            type = "direct",
        },
        animation = {
            filename = ei_graphics_other_path.."plasma-bullet.png",
            width = 3,
            height = 50,
            shift = {0, 0},
            scale = 2,
            frame_count = 1,
            draw_as_glow = true,
            priority = "high",
        },
    },
    {
        name = "ei_plasma-explosion",
        type = "explosion",
        flags = {"not-on-map"},
        animations = {
            {
                filename = ei_graphics_other_path.."plasma-explosion.png",
                size = {1944/6, 1248/3},
                shift = {0, -6},
                scale = 2,
                line_length = 6,
                lines_per_file = 6,
                frame_count = 36,
                animation_speed = 0.3,
                draw_as_glow = true,
                priority = "high",
            },
        },
        light = {intensity = 1, size = 100},
        sound = {
            aggregation = {
                max_count = 1,
                remove = true
            },
            variations = {
                {
                    filename = "__base__/sound/fight/large-explosion-1.ogg",
                    volume = 0.7
                },
                {
                    filename = "__base__/sound/fight/large-explosion-2.ogg",
                    volume = 0.7
                },
            }
        },
        smoke = "smoke-fast",
        smoke_count = 2,
        smoke_slow_down_factor = 1,
        --[[
        created_effect = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    {
                        type = "create-entity",
                        entity_name = "medium-scorchmark",
                        check_buildability = true
                    }
                }
            }
        },
        ]]
        subgroup = "explosions",
        order = "c-a-a"
    }
    
})