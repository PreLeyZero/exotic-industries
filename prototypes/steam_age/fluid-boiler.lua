ei_data = require("lib/data")

-- ====================================================================================================
-- FLUID BOILER
-- ====================================================================================================

data:extend({{
    name = "ei_fluid-boiler",
    type = "item",
    icons = {{
        icon = "__base__/graphics/icons/boiler.png",
        icon_size = 64,
        icon_mipmaps = 4
    }, {
        icon = ei_graphics_other_path .. "fluid_down_overlay.png",
        icon_size = 64
    }},
    subgroup = "energy",
    order = "b[steam-power]-a[fluid-boiler]",
    place_result = "ei_fluid-boiler",
    stack_size = 50
}, {
    name = "ei_fluid-boiler",
    type = "recipe",
    category = "crafting",
    energy_required = 2,
    ingredients = {{"boiler", 1}, {"ei_steel-mechanical-parts", 6}, {"pipe", 4}, {"ei_copper-beam", 4}},
    result = "ei_fluid-boiler",
    result_count = 1,
    enabled = false,
    always_show_made_in = true,
    main_product = "ei_fluid-boiler"
}, {
    name = "ei_fluid-boiler",
    type = "technology",
    icon = ei_graphics_tech_path .. "fluid-boiler.png",
    icon_size = 220,
    prerequisites = {"ei_fluid-heater"},
    effects = {{
        type = "unlock-recipe",
        recipe = "ei_fluid-boiler"
    }},
    unit = {
        count = 100,
        ingredients = ei_data.science["steam-age"],
        time = 20
    },
    age = "steam-age"
}})

local boiler = table.deepcopy(data.raw["boiler"]["boiler"])

boiler.name = "ei_fluid-boiler"
boiler.icons = {{
    icon = "__base__/graphics/icons/boiler.png",
    icon_size = 64,
    icon_mipmaps = 4
}, {
    icon = ei_graphics_other_path .. "fluid_down_overlay.png",
    icon_size = 64
}}
boiler.minable.result = "ei_fluid-boiler"
boiler.fluid_box = {
    base_area = 1,
    height = 2,
    base_level = -1,
    pipe_covers = pipecoverspictures(),
    pipe_connections = {{
        type = "input-output",
        position = {-2, 0.5}
    }, {
        type = "input-output",
        position = {2, 0.5}
    }},
    production_type = "input-output",
    filter = "water"
}
boiler.energy_source = {
    type = "fluid",
    fluid_box = {
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        pipe_picture = ei_pipe_south_basic,
        pipe_connections = {{
            type = "input",
            position = {0, 1.5}
        }},
        production_type = "input"
    },
    effectivity = 1,
    emissions_per_minute = 30,
    burns_fluid = true,
    scale_fluid_usage = true,
    smoke = {{
        name = "smoke",
        north_position = util.by_pixel(-38, -47.5),
        south_position = util.by_pixel(38.5, -32),
        east_position = util.by_pixel(20, -70),
        west_position = util.by_pixel(-19, -8.5),
        frequency = 15,
        starting_vertical_speed = 0.0,
        starting_frame_deviation = 60
    }},
    light_flicker = {
        color = {0, 0, 0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
    }
}

data:extend({boiler})
