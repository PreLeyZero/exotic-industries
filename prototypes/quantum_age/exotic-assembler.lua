ei_data = require("lib/data")

--====================================================================================================
--EXOTIC ASSEMBLER
--====================================================================================================

data:extend({
    {
        name = "ei_exotic-assembler",
        type = "recipe-category",
    },
    {
        name = "ei_exotic-assembler",
        type = "item",
        icon = ei_graphics_item_path.."exotic-assembler.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "c[assembling-machine-3]-x",
        place_result = "ei_exotic-assembler",
        stack_size = 50
    },
    {
        name = "ei_exotic-assembler",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 4,
        ingredients =
        {
            {"assembling-machine-3", 2},
            {"ei_carbon-structure", 5},
            {"ei_superior-data", 5},
            {"ei_magnet", 5},
            {type = "fluid", name = "ei_liquid-oxygen", amount = 25},
        },
        result = "ei_exotic-assembler",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_exotic-assembler",
    },
    {
        name = "ei_high-tech-parts",
        type = "technology",
        icon = ei_graphics_tech_path.."high-tech-parts.png",
        icon_size = 128,
        prerequisites = {"ei_asteroid-mining", "ei_neo-assembler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_exotic-assembler"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_high-tech-parts"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-cube"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_eu-circuit"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_eu-magnet"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
})


local neo_assembler = {
    name = "ei_exotic-assembler",
    type = "assembling-machine",
    icon = ei_graphics_item_path.."exotic-assembler.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {
        mining_time = 0.5,
        result = "ei_exotic-assembler"
    },
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    map_color = ei_data.colors.assembler,
    crafting_categories = {"ei_exotic-assembler"},
    crafting_speed = 1,
    energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        emissions_per_minute = 4,
    },
    energy_usage = "1MW",
    result_inventory_size = 1,
    source_inventory_size = 1,
    allowed_effects = {"speed", "consumption", "pollution", "productivity"},
    module_specification = {
        module_slots = 4
    },
    fluid_boxes = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes),
    animation = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].animation),
    working_sound =
    {
        sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.6},
        apparent_volume = 0.3,
    },
    -- fast_replaceable_group = "assembling-machine",
}

-- data.raw["assembling-machine"]["assembling-machine-3"].next_upgrade = "ei_exotic-assembler"

neo_assembler.fluid_boxes[1].secondary_draw_order = 2
neo_assembler.fluid_boxes[2].secondary_draw_order = 2

table.insert(neo_assembler.animation.layers,
{
    filename = ei_graphics_V453000_path.."beaconed-assembling-machine-3-overlay.png",
    width = 107,
    height = 109,
    frame_count = 1,
    repeat_count = 32,
    shift = util.by_pixel(0, 4),
    animation_speed = 1,
    hr_version = {
        filename = ei_graphics_V453000_path.."hr-beaconed-assembling-machine-3-overlay.png",
        priority = "high",
        width = 214,
        height = 218,
        frame_count = 1,
        repeat_count = 32,
        shift = util.by_pixel(0, 4),
        animation_speed = 1,
        scale = 0.5
    }
})

table.insert(neo_assembler.animation.layers,
{
    filename = ei_graphics_V453000_path.."assembling-machine-3-mask.png",
    width = 78,
    height = 96,
    frame_count = 32,
    line_length = 8,
    shift = util.by_pixel(-1, -11),
    tint = ei_data.colors.exotic,
    blend_mode = "additive",
    animation_speed = 1,
    hr_version = {
        filename = ei_graphics_V453000_path.."hr-assembling-machine-3-mask.png",
        priority = "high",
        width = 156,
        height = 192,
        frame_count = 32,
        line_length = 8,
        shift = util.by_pixel(-0.5, -11),
        tint = ei_data.colors.exotic,
        blend_mode = "additive",
        animation_speed = 1,
        scale = 0.5
    }
})

data:extend({neo_assembler})