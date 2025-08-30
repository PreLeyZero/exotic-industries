ei_data = require("lib/data")

--====================================================================================================
--BIG LAB
--====================================================================================================

data:extend({
    {
        name = "ei_big-lab",
        type = "item",
        icon = ei_graphics_item_path.."big-lab.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "a3",
        place_result = "ei_big-lab",
        stack_size = 50
    },
    {
        name = "ei_big-lab",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="lab", amount=10},
            {type="item", name="ei_simulation-data", amount=100},
            {type="item", name="ei_electronic-parts", amount=100},
            {type="item", name="ei_steel-mechanical-parts", amount=40},
            {type="item", name="ei_energy-crystal", amount=40}
        },
        results = {{type="item", name="ei_big-lab", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_big-lab",
    },
    {
        name = "ei_big-lab",
        type = "technology",
        icon = ei_graphics_tech_path.."big-lab.png",
        icon_size = 256,
        prerequisites = {"ei_computer-core"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_big-lab"
            },
            --[[
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-computer-age-tech"
            },
            ]]
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_big-lab",
        type = "lab",
        icon = ei_graphics_item_path.."big-lab.png",
        icon_size = 64,
        flags = {"player-creation","placeable-neutral"},
        max_health = 1000,
        corpse = "big-remnants",
        collision_box = {{-4.9,-4.9},{4.9,4.9}},
        selection_box = {{-5,-5},{5,5}},
        map_color = {r=0, g=0, b=1, a=1},
        minable = {
            mining_time = 1,
            result = "ei_big-lab",
        },
        researching_speed = 10,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        energy_usage = "20MW",
        inputs = ei_data.lab_inputs["big-lab"],
        allowed_effects = {"speed", "productivity", "consumption", "pollution"},
        module_slots = 6,
        icons_positioning = {
            {inventory_index = defines.inventory.lab_modules, shift = {0, 0.8}},
            {inventory_index = defines.inventory.lab_input, shift = {0, 0}}
        },
        off_animation = {
            filename = ei_graphics_entity_path.."big-lab.png",
            size = {512*2,512*2},
            scale = 0.41,
            line_length = 1,
            frame_count = 1,
            animation_speed = 1,
            shift = {1.5,-0.4}
        },
        on_animation = {
            layers = {
                {
                    filename = ei_graphics_entity_path.."big-lab.png",
                    size = {512*2,512*2},
                    scale = 0.41,
                    line_length = 1,
                    frame_count = 1,
                    animation_speed = 0.4,
                    shift = {1.5,-0.4},
                    repeat_count = 16
                },
                {
                    filename = ei_graphics_entity_path.."big-lab_animation.png",
                    size = {512*2,512*2},
                    scale = 0.41,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.4,
                    shift = {1.5,-0.4}
                }
            }
        },
    
        working_sound = { 
            sound = { filename = "__base__/sound/lab.ogg"},
            idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
            apparent_volume = 0.7,
        },
    },
})