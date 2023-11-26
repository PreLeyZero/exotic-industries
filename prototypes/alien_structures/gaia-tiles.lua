-- ====================================================================================================
-- TILES FOR GAIA
-- ====================================================================================================
local sounds = require("__base__/prototypes/entity/sounds")
local noise = require("noise")
local autoplace_utils = require("autoplace_utils")
local bvu = require("biome-visualization-utils")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")

-- ====================================================================================================
-- TILES
-- ====================================================================================================

-- HELPER FUNCTIONS
------------------------------------------------------------------------------------------------------

local tile_noise_enabled = true
local tile_noise_persistence = 0.7

local tile_noise_influence = 2 / 3
local size_control_influence = 1
local rectangle_influence = 1
local beach_influence = 5

local function noise_layer_expression(noise_name)
    if tile_noise_enabled == false then
        return noise.to_noise_expression(0)
    end
    return noise.function_application("factorio-multioctave-noise", {
        x = noise.var("x"),
        y = noise.var("y"),
        persistence = tile_noise_persistence,
        seed0 = noise.var("map_seed"),
        seed1 = noise.noise_layer_name_to_id(noise_name),
        input_scale = noise.fraction(1, 6),
        output_scale = tile_noise_influence,
        octaves = 4
    })
end

local function peak_to_noise_expression(variable, optimal, range)
    local distance_from_optimal = noise.ridge(variable - optimal, 0, math.huge)
    -- Idea is to have a plateau in the center of the rectangle,
    -- edges that taper off at a consistent slope for all rectangles (so that interactions between rectangles are predictable),
    return range - distance_from_optimal
end
local function rectangle_peak_to_noise_expression(variable, optimal, range)
    -- Clamp rectangle-based peaks so that large rectangles don't become
    -- super powerful at their centers, because we want to be able to override
    -- them e.g. with beach peaks or whatever
    return noise.min(peak_to_noise_expression(variable, optimal, range) * 20, 1) * rectangle_influence
end

local function extend_left_rectangle_edge(left)
    if left == 0 then
        return -10
    end
    return left
end
local function extend_right_rectangle_edge(right)
    if right == 1 then
        return 11
    end
    return right
end

local function extend_edge_rectangle(rectangle)
    return {{extend_left_rectangle_edge(rectangle[1][1]), extend_left_rectangle_edge(rectangle[1][2])},
            {extend_right_rectangle_edge(rectangle[2][1]), extend_right_rectangle_edge(rectangle[2][2])}}
end

local function auxwater_rect_to_noise_expression(rectangle)
    rectangle = extend_edge_rectangle(rectangle)

    local aux_center = (rectangle[2][1] + rectangle[1][1]) / 2
    local aux_range = math.abs(rectangle[2][1] - rectangle[1][1]) / 2
    local water_center = (rectangle[2][2] + rectangle[1][2]) / 2
    local water_range = math.abs(rectangle[2][2] - rectangle[1][2]) / 2

    local water_fitness = rectangle_peak_to_noise_expression(noise.var("moisture"), water_center, water_range)
    local aux_fitness = rectangle_peak_to_noise_expression(noise.var("aux"), aux_center, aux_range)

    return noise.min(water_fitness, aux_fitness)
end

-- 'rectangles' indicate
-- {{minimum aux, minimum water}, {maximum aux, maximum water}}
local function autoplace_settings(noise_name, control_name, ...)
    local rectangles = {...}
    local probability_expression = noise.to_noise_expression(-math.huge)
    for i, rectangle in ipairs(rectangles) do
        if type(rectangle) == "table" then
            bvu.log_rectangle(noise_name, {
                aux = {
                    min = rectangle[1][1],
                    max = rectangle[2][1]
                },
                moisture = {
                    min = rectangle[1][2],
                    max = rectangle[2][2]
                }
            })
            probability_expression = noise.max(probability_expression, auxwater_rect_to_noise_expression(rectangle))
        elseif type(rectangle) == "function" then
            probability_expression = rectangle(probability_expression)
        else
            error("Non-table, non-function passed as rectangle to autoplace_settings")
        end
    end

    -- local size_multiplier = noise.get_control_setting(control_name).size_multiplier
    -- local size_log = noise.log2(size_multiplier)
    -- local size_control_term = size_log * size_control_influence
    local size_control_term = 0
    probability_expression = probability_expression + noise_layer_expression(noise_name) + size_control_term

    return {
        probability_expression = probability_expression
    }
end

-- DATA
------------------------------------------------------------------------------------------------------

data:extend({{
    name = "ei_gaia-grass-1",
    type = "tile",
    order = "a[gaia]-a[grass]",
    collision_mask = {"ground-tile"},
    layer = 55,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-grass-1.png",
        "__base__/graphics/terrain/masks/transition-3.png", ei_graphics_terrain_path .. "gaia-grass-1_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-3.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 0.91,
                weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025,
                           0.025, 0.010, 0.025}
            },
            [4] = {
                probability = 0.91,
                weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                           0.01}
            }
            -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
        }),

    transitions = data.raw.tile["grass-1"].transitions,
    transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-grass-1", "grass", {{0, 0.7}, {1, 1}}),

    walking_sound = data.raw.tile["grass-1"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["grass-1"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["grass-1"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["grass-1"].trigger_effect
}, {
    name = "ei_gaia-grass-2",
    type = "tile",
    order = "a[gaia]-a[grass]",
    collision_mask = {"ground-tile"},
    layer = 56,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-grass-2.png",
        "__base__/graphics/terrain/masks/transition-3.png", ei_graphics_terrain_path .. "gaia-grass-2_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-3.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 0.91,
                weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025,
                           0.025, 0.010, 0.025}
            },
            [4] = {
                probability = 0.75,
                weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005,
                           0.025, 0.045, 0.045}
            }
            -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
        }),

    transitions = data.raw.tile["grass-2"].transitions,
    transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-grass-2", "grass", {{0.45, 0.45}, {1, 0.8}}),

    walking_sound = data.raw.tile["grass-2"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["grass-2"].trigger_effect
}, {
    name = "ei_gaia-grass-1_var",
    type = "tile",
    order = "a[gaia]-a[grass]",
    collision_mask = {"ground-tile"},
    layer = 57,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-grass-1_var.png",
        "__base__/graphics/terrain/masks/transition-3.png", ei_graphics_terrain_path .. "gaia-grass-1_var_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-3.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 0.91,
                weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025,
                           0.025, 0.010, 0.025}
            },
            [4] = {
                probability = 0.91,
                weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01,
                           0.01}
            }
            -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
        }),

    transitions = data.raw.tile["grass-1"].transitions,
    transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-grass-1_var", "grass", {{0, 0.7}, {1, 1}}),

    walking_sound = data.raw.tile["grass-1"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["grass-1"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["grass-1"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["grass-1"].trigger_effect
}, {
    name = "ei_gaia-grass-2",
    type = "tile",
    order = "a[gaia]-a[grass]",
    collision_mask = {"ground-tile"},
    layer = 58,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-grass-2.png",
        "__base__/graphics/terrain/masks/transition-3.png", ei_graphics_terrain_path .. "gaia-grass-2_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-3.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 0.91,
                weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025,
                           0.025, 0.010, 0.025}
            },
            [4] = {
                probability = 0.75,
                weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005,
                           0.025, 0.045, 0.045}
            }
            -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
        }),

    transitions = data.raw.tile["grass-2"].transitions,
    transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-grass-2", "grass", {{0, 0.45}, {1, 0.8}}),

    walking_sound = data.raw.tile["grass-2"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["grass-2"].trigger_effect
}, {
    name = "ei_gaia-grass-2_var",
    type = "tile",
    order = "a[gaia]-a[grass]",
    collision_mask = {"ground-tile"},
    layer = 59,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-grass-2_var.png",
        "__base__/graphics/terrain/masks/transition-3.png", ei_graphics_terrain_path .. "gaia-grass-2_var_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-3.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 0.91,
                weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025,
                           0.025, 0.010, 0.025}
            },
            [4] = {
                probability = 0.75,
                weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005,
                           0.025, 0.045, 0.045}
            }
            -- [8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
        }),

    transitions = data.raw.tile["grass-2"].transitions,
    transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-grass-2_var", "grass", {{1, 0.45}, {1, 0.8}}),

    walking_sound = data.raw.tile["grass-2"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["grass-2"].trigger_effect
}, {
    name = "ei_gaia-rock-1",
    type = "tile",
    order = "a[gaia]-a[rock]",
    collision_mask = {"ground-tile"},
    layer = 60,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-rock-1.png",
        "__base__/graphics/terrain/masks/transition-1.png", ei_graphics_terrain_path .. "gaia-rock-1_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-1.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 1,
                weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030,
                           0.005, 0.070, 0.027}
            },
            [4] = {
                probability = 1.00,
                weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070,
                           0.070, 0.065, 0.070}
            }
        }),

    transitions = data.raw.tile["dirt-4"].transitions,
    transitions_between_transitions = data.raw.tile["dirt-4"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-rock-1", "dirt", {{0, 0.7}, {1, 1}}),

    walking_sound = data.raw.tile["dirt-4"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["dirt-4"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["dirt-4"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["dirt-4"].trigger_effect
}, {
    name = "ei_gaia-rock-2",
    type = "tile",
    order = "a[gaia]-a[rock]",
    collision_mask = {"ground-tile"},
    layer = 61,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-rock-2.png",
        "__base__/graphics/terrain/masks/transition-1.png", ei_graphics_terrain_path .. "gaia-rock-2_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-1.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 1,
                weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030,
                           0.005, 0.070, 0.027}
            },
            [4] = {
                probability = 1.00,
                weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070,
                           0.070, 0.065, 0.070}
            }
        }),

    transitions = data.raw.tile["dry-dirt"].transitions,
    transitions_between_transitions = data.raw.tile["dry-dirt"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-rock-2", "dirt", {{0.45, 0}, {0.55, 0.35}}),

    walking_sound = data.raw.tile["dry-dirt"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["dry-dirt"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["dry-dirt"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["dry-dirt"].trigger_effect
}, {
    name = "ei_gaia-rock-3",
    type = "tile",
    order = "a[gaia]-a[rock]",
    collision_mask = {"ground-tile"},
    layer = 62,
    variants = tile_variations_template(ei_graphics_terrain_path .. "gaia-rock-3.png",
        "__base__/graphics/terrain/masks/transition-1.png", ei_graphics_terrain_path .. "gaia-rock-3_hr.png",
        "__base__/graphics/terrain/masks/hr-transition-1.png", {
            max_size = 4,
            [1] = {
                weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005,
                           0.025, 0.045, 0.045}
            },
            [2] = {
                probability = 1,
                weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030,
                           0.005, 0.070, 0.027}
            },
            [4] = {
                probability = 1.00,
                weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070,
                           0.070, 0.065, 0.070}
            }
        }),

    transitions = data.raw.tile["dirt-3"].transitions,
    transitions_between_transitions = data.raw.tile["dirt-3"].transitions_between_transitions,

    autoplace = autoplace_settings("ei_gaia-rock-3", "dirt", {{0, 0.35}, {0.55, 0.4}}),

    walking_sound = data.raw.tile["dirt-3"].walking_sound,
    map_color = {
        r = 55,
        g = 53,
        b = 11
    },
    scorch_mark_color = {
        r = 0.318,
        g = 0.222,
        b = 0.152,
        a = 1.000
    },
    pollution_absorption_per_second = data.raw.tile["dirt-3"].pollution_absorption_per_second,
    vehicle_friction_modifier = data.raw.tile["dirt-3"].vehicle_friction_modifier,

    trigger_effect = data.raw.tile["dirt-3"].trigger_effect

}})

-- NOISE LAYERS
------------------------------------------------------------------------------------------------------

data:extend({{
    type = "noise-layer",
    name = "ei_gaia-grass-1"
}, {
    type = "noise-layer",
    name = "ei_gaia-grass-1_var"
}, {
    type = "noise-layer",
    name = "ei_gaia-grass-2"
}, {
    type = "noise-layer",
    name = "ei_gaia-grass-2_var"
}, {
    type = "noise-layer",
    name = "ei_gaia-rock-1"
}, {
    type = "noise-layer",
    name = "ei_gaia-rock-2"
}, {
    type = "noise-layer",
    name = "ei_gaia-rock-3"
}})
