ei_data = require("lib/data")

--====================================================================================================
--COMBUSTION TURBINE
--====================================================================================================

data:extend({
    {
        name = "ei_combustion-turbine",
        type = "item",
        icon = ei_graphics_item_path.."combustion-turbine.png",
        icon_size = 64,
        subgroup = "energy",
        order = "b[steam-power]-c[combustion-turbine]",
        place_result = "ei_combustion-turbine",
        stack_size = 10
    },
    {
        name = "ei_combustion-turbine",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="advanced-circuit", amount=20},
            {type="item", name="electric-engine-unit", amount=18},
            {type="item", name="steel-plate", amount=16},
            {type="item", name="ei_copper-mechanical-parts", amount=12},
            {type="item", name="steam-engine", amount=4},
            {type="item", name="concrete", amount=40}
        },
        results = {{type="item", name="ei_combustion-turbine", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_combustion-turbine",
    },
    {
        name = "ei_combustion-turbine",
        type = "technology",
        icon = ei_graphics_tech_path.."combustion-turbine.png",
        icon_size = 512,
        prerequisites = {"advanced-circuit", "advanced-oil-processing", "concrete"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_combustion-turbine"
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
        name = "ei_combustion-turbine",
        type = "burner-generator",
        icon = ei_graphics_item_path.."combustion-turbine.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_combustion-turbine"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-4.2, -4.3}, {4.2, 4.3}},
        selection_box = {{-4.3, -4.5}, {4.3, 4.5}},
        map_color = ei_data.colors.assembler,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-output"
        },
        burner = {
            type = "burner",
            fuel_categories = {"chemical"},
            effectivity = 1.25,
            fuel_inventory_size = 3,
            emissions_per_minute = {pollution = 120 },
            smoke = {
                {
                    name = "smoke",
                    deviation = {0.1, 0.1},
                    frequency = 30,
                    position = {0, -1.75},
                    starting_vertical_speed = 0.08,
                    starting_frame_deviation = 60,
                }
            }
        },
        max_power_output = "10MW",
        animation = {
            filename = ei_graphics_entity_path.."combustion-turbine_animation.png",
            size = {512,512},
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.65,
            line_length = 4,
            lines_per_file = 4,
            frame_count = 16,
            animation_speed = 0.2,
        },
        idle_animation = {
            filename = ei_graphics_entity_path.."combustion-turbine.png",
            size = {512,512},
            width = 512,
            height = 512,
            shift = {0,-0.2},
	        scale = 0.65,
            line_length = 1,
            -- lines_per_file = 2,
            frame_count = 1,
            animation_speed = 0.2,
            repeat_count = 16,
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/steam-turbine.ogg", volume = 0.2},
            apparent_volume = 0.3,
        },
    },
})