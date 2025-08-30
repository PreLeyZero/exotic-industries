ei_data = require("lib/data")

--====================================================================================================
-- CANNON TURRET
--====================================================================================================

data:extend({
    {
        name = "ei_cannon-turret",
        type = "item",
        icon = ei_graphics_item_path.."cannon-turret.png",
        icon_size = 64,
        subgroup = "defensive-structure",
        order = "c-a",
        place_result = "ei_cannon-turret",
        stack_size = 50
    },
    {
        name = "ei_cannon-turret",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="gun-turret", amount=1},
            {type="item", name="ei_iron-mechanical-parts", amount=35},
            {type="item", name="electric-engine-unit", amount=15},
            {type="item", name="steel-plate", amount=20}
        },
        results = {{type="item", name="ei_cannon-turret", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_cannon-turret",
    },
    {
        name = "ei_cannon-turret",
        type = "technology",
        icon = ei_graphics_tech_path.."cannon-turret.png",
        icon_size = 256,
        prerequisites = {"tank"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_cannon-turret"
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
        type = "ammo-turret",
        name = "ei_cannon-turret",
        icon = ei_graphics_item_path.."cannon-turret.png",
        icon_size = 64,
        flags = {"placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_cannon-turret"
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
        rotation_speed = 0.005,
        --preparing_speed = 0.1,
        --folding_speed = 0.1,
        inventory_size = 1,
        automated_ammo_count = 10,
        attacking_speed = 0.5,
        folded_animation = {
            filename = ei_graphics_entity_path.."cannon-turret_animation.png",
            size = {512,512},
            shift = {0, 0},
	        scale = 0.35,
            line_length = 8,
            lines_per_file = 8,
            direction_count = 64,
            animation_speed = 0.35,
        },
        attacking_animation = {
            filename = ei_graphics_entity_path.."cannon-turret_animation.png",
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
            ammo_category = "cannon-shell",
            cooldown = 120,
            projectile_center = {0, 0.14},
            projectile_creation_distance = 2,
            range = 30,
            min_range = 10,
            rotate_penalty = 20,
            health_penalty = -10,
            sound = {
                {
                    filename = "__base__/sound/fight/tank-cannon.ogg",
                    volume = 0.7
                }
            }
        },

    }
    
})