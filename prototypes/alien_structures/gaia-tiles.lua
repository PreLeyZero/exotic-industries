--====================================================================================================
--TILES FOR GAIA
--====================================================================================================

local sounds = require("__base__/prototypes/entity/sounds")
local autoplace_utils = require("autoplace_utils")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")

--====================================================================================================
--TILES
--====================================================================================================
  
--DATA
------------------------------------------------------------------------------------------------------

data:extend({

    {
        name = "ei_gaia-grass-1",
        type = "tile",
        order = "a[gaia]-a[grass]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 55,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-grass-1_hr.png", "__base__/graphics/terrain/masks/transition-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
            [4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
          }
        ),
    
        transitions = data.raw.tile["grass-1"].transitions,
        transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(-10, 0.7, 11, 11) + noise_layer_noise(19)'},

        walking_sound = data.raw.tile["grass-1"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["grass-1"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["grass-1"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["grass-1"].trigger_effect,
    },
    {
        name = "ei_gaia-grass-2",
        type = "tile",
        order = "a[gaia]-a[grass]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 56,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-grass-2_hr.png", "__base__/graphics/terrain/masks/transition-3.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
                [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
                --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
            }
        ),
    
        transitions = data.raw.tile["grass-2"].transitions,
        transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(0.45, 0.45, 11, 0.8) + noise_layer_noise(20)'},

        walking_sound = data.raw.tile["grass-2"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["grass-2"].trigger_effect,
    },
    {
        name = "ei_gaia-grass-1_var",
        type = "tile",
        order = "a[gaia]-a[grass]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 57,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-grass-1_var_hr.png", "__base__/graphics/terrain/masks/transition-3.png",
          {
            max_size = 4,
            [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
            [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
            [4] = { probability = 0.91, weights = {0.100, 0.80, 0.80, 0.100, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01 }, },
            --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
          }
        ),
    
        transitions = data.raw.tile["grass-1"].transitions,
        transitions_between_transitions = data.raw.tile["grass-1"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(-10, 0.7, 11, 11) + noise_layer_noise(19)'},

        walking_sound = data.raw.tile["grass-1"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["grass-1"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["grass-1"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["grass-1"].trigger_effect,
    },
    {
        name = "ei_gaia-grass-2",
        type = "tile",
        order = "a[gaia]-a[grass]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 58,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-grass-2_hr.png", "__base__/graphics/terrain/masks/transition-3.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
                [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
                --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
            }
        ),
    
        transitions = data.raw.tile["grass-2"].transitions,
        transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(0.45, 0.45, 11, 0.8) + noise_layer_noise(20)'},

        walking_sound = data.raw.tile["grass-2"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["grass-2"].trigger_effect,
    },
    {
        name = "ei_gaia-grass-2_var",
        type = "tile",
        order = "a[gaia]-a[grass]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 59,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-grass-2_var_hr.png", "__base__/graphics/terrain/masks/transition-3.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 0.91, weights = {0.150, 0.150, 0.150, 0.150, 0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025 }, },
                [4] = { probability = 0.75, weights = {0.085, 0.085, 0.085, 0.075, 0.057, 0.055, 0.085, 0.075, 0.035, 0.015, 0.001, 0.025, 0.005, 0.025, 0.045, 0.045 }, },
                --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
            }
        ),
    
        transitions = data.raw.tile["grass-2"].transitions,
        transitions_between_transitions = data.raw.tile["grass-2"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(0.45, 0.45, 11, 0.8) + noise_layer_noise(20)'},

        walking_sound = data.raw.tile["grass-2"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["grass-2"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["grass-2"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["grass-2"].trigger_effect,
    },
    {
        name = "ei_gaia-rock-1",
        type = "tile",
        order = "a[gaia]-a[rock]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 60,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-rock-1_hr.png", "__base__/graphics/terrain/masks/transition-1.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
                [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
            }
        ),

        transitions = data.raw.tile["dirt-4"].transitions,
        transitions_between_transitions = data.raw.tile["dirt-4"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(0.45, -10, 0.55, 0.35) + noise_layer_noise(13)'},

        walking_sound = data.raw.tile["dirt-4"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["dirt-4"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["dirt-4"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["dirt-4"].trigger_effect,
    },
    {
        name = "ei_gaia-rock-2",
        type = "tile",
        order = "a[gaia]-a[rock]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 61,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-rock-2_hr.png", "__base__/graphics/terrain/masks/transition-1.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
                [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
            }
        ),

        transitions = data.raw.tile["dry-dirt"].transitions,
        transitions_between_transitions = data.raw.tile["dry-dirt"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(-10, 0.3, 0.45, 0.35) + noise_layer_noise(7)'},

        walking_sound = data.raw.tile["dry-dirt"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["dry-dirt"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["dry-dirt"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["dry-dirt"].trigger_effect,
    },
    {
        name = "ei_gaia-rock-3",
        type = "tile",
        order = "a[gaia]-a[rock]",
        collision_mask = {layers = {ground_tile = true}},
        layer = 62,
        variants = tile_variations_template(
            ei_graphics_terrain_path.."gaia-rock-3_hr.png", "__base__/graphics/terrain/masks/transition-1.png",
            {
                max_size = 4,
                [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
                [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
                [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
            }
        ),

        transitions = data.raw.tile["dirt-3"].transitions,
        transitions_between_transitions = data.raw.tile["dirt-3"].transitions_between_transitions,
    
        autoplace = {probability_expression = 'expression_in_range_base(-10, 0.35, 0.55, 0.4) + noise_layer_noise(8)'},

        walking_sound = data.raw.tile["dirt-3"].walking_sound,
        map_color={r=55, g=53, b=11},
        scorch_mark_color = {r = 0.318, g = 0.222, b = 0.152, a = 1.000},
        pollution_absorption_per_second = data.raw.tile["dirt-3"].pollution_absorption_per_second,
        vehicle_friction_modifier = data.raw.tile["dirt-3"].vehicle_friction_modifier,
    
        trigger_effect = data.raw.tile["dirt-3"].trigger_effect,


    }
})

gaia_water = table.deepcopy(data.raw.tile["water"]);
gaia_water.name = "ei_gaia-water"
gaia_water.fluid = "ei_gaia-water";
data:extend({gaia_water})