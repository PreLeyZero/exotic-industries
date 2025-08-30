ei_data = require("lib/data")

--====================================================================================================
--BURNER ASSEMBLER
--====================================================================================================

data:extend({
    {
        name = "ei_burner-assembler",
        type = "item",
        icon = ei_graphics_item_path.."burner-assembler.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "a",
        place_result = "ei_burner-assembler",
        stack_size = 50
    },
    {
        name = "ei_burner-assembler",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="stone-furnace", amount=1},
            {type="item", name="ei_copper-mechanical-parts", amount=2},
            {type="item", name="ei_copper-beam", amount=2}
        },
        results = {{type="item", name="ei_burner-assembler", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_burner-assembler",
    },
    {
        name = "ei_burner-assembler",
        type = "technology",
        icon = ei_graphics_tech_path.."burner-assembler.png",
        icon_size = 256,
        prerequisites = {"ei_dark-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_burner-assembler"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["dark-age"],
            time = 20
        },
        age = "dark-age",
    },
    {
        name = "ei_burner-assembler",
        type = "assembling-machine",
        icon = ei_graphics_item_path.."burner-assembler.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_burner-assembler"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        -- collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        -- selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        collision_box = data.raw["assembling-machine"]["assembling-machine-1"].collision_box,
        selection_box = data.raw["assembling-machine"]["assembling-machine-1"].selection_box,
        map_color = ei_data.colors.assembler,
        crafting_categories = {"crafting"},
        crafting_speed = 0.25,
        energy_source = {
            type = "burner",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = {pollution = 6},
            burnt_inventory_size = 1,
            fuel_categories = {"chemical"},
        },
        fast_replaceable_group = "assembling-machine",
        next_upgrade = "assembling-machine-1",
        energy_usage = "150kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."burner-assembler.png",
                size = {512,512},
                width = 512,
                height = 512,
                shift = {0,-0.2},
    	        scale = 0.44/2,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_entity_path.."burner-assembler_animation.png",
                    size = {512,512},
                    width = 512,
                    height = 512,
                    shift = {0,-0.2},
    	            scale = 0.44/2,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 1,
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
            sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.8},
            apparent_volume = 0.3,
        },
    }
})