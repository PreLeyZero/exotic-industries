ei_data = require("lib/data")

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
        subgroup = "production-machine",
        order = "g-a-a",
        place_result = "ei_fission-facility",
        stack_size = 50
    },
    {
        name = "ei_fission-facility",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"electronic-circuit", 2},
            {"electric-engine-unit", 4},
            {"ei_iron-beam", 2},
            {"ei_copper-mechanical-parts", 6}
        },
        result = "ei_fission-facility",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fission-facility",
    },
    {
        name = "ei_fission-facility",
        type = "assembling-machine",
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
        crafting_categories = {"ei_crushing"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "5MW",
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_specification = {
            module_slots = 4
        },
        animation = {
            filename = ei_graphics_entity_path.."fission-facility.png",
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
                filename = ei_graphics_entity_path.."fission-facility_animation.png",
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
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-2.ogg", volume = 0.4},
            apparent_volume = 0.3,
        },
    }
})

table.insert(data.raw.technology["nuclear-power"].effects,  {
    type = "unlock-recipe",
    recipe = "ei_fission-facility"
})