ei_data = require("lib/data")

--====================================================================================================
--FUSION REACTOR
--====================================================================================================

data:extend({
    {
        name = "ei_fusion-reactor",
        type = "recipe-category",
    },
    {
        name = "ei_fusion-reactor",
        type = "item",
        icon = ei_graphics_item_path.."fusion-reactor.png",
        icon_size = 64,
        subgroup = "ei_nuclear-buildings",
        order = "c-d",
        place_result = "ei_fusion-reactor",
        stack_size = 1,
    },
    {
        name = "ei_fusion-reactor",
        type = "recipe",
        category = "crafting",
        energy_required = 40,
        ingredients =
        {
            {type="item", name="ei_plasma-heater", amount=2},
            {type="item", name="ei_magnet", amount=40},
            {type="item", name="refined-concrete", amount=200},
            {type="item", name="processing-unit", amount=100},
            {type="item", name="ei_fusion-data", amount=200},
            {type="item", name="ei_lead-plate", amount=100},
        },
        results = {{type="item", name="ei_fusion-reactor", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fusion-reactor",
    },
    {
        name = "ei_fusion-reactor",
        type = "technology",
        icon = ei_graphics_tech_path.."fusion-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_lithium-processing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fusion-reactor"
            },
            --[[
            {
                type = "unlock-recipe",
                recipe = "ei_dt-fusion"
            },
            ]]
            {
                type = "unlock-recipe",
                recipe = "ei_cold-coolant"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_exchanger"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_big-turbine"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
    },
    {
        name = "ei_fusion-reactor",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_item_path.."fusion-reactor.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_fusion-reactor"
        },
        max_health = 1000,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-5.4, -5.4}, {5.4, 5.4}},
        selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
        map_color = ei_data.colors.assembler,
        crafting_categories = {"ei_fusion-reactor"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        -- fixed_recipe = "ei_fusion-F1__ei_heated-deuterium-F2__ei_heated-tritium-TM__medium-FM__medium",
        energy_usage = "400MW",
        fluid_boxes = {
            {   
                -- fusion inputs
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.east, position = {5, 0}},
                },
                production_type = "input",
            },
            {   
                -- fusion inputs
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_nitrogen,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.west, position = {-5, 0}},
                },
                production_type = "input",
            },
            {   
                -- coolant
                filter = "ei_cold-coolant",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_round,
                pipe_connections = {
                    {flow_direction = "input", direction = defines.direction.south, position = {0, 5}},
                },
                production_type = "input",
            },
            {   
                -- coolant
                filter = "ei_hot-coolant",
                volume = 200,
                pipe_covers = pipecoverspictures(),
                pipe_picture = ei_pipe_big_round,
                pipe_connections = {
                    {flow_direction = "output", direction = defines.direction.north, position = {0, -5}},
                },
                production_type = "output",
            },
        },
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."fusion-reactor.png",
                size = {512*2,512*2},
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
                    filename = ei_graphics_entity_path.."fusion-reactor_animation-basic.png",
                    size = {512*2,512*2},
                    shift = {0, 0},
    	            scale = 0.35,
                    line_length = 4,
                    lines_per_file = 4,
                    frame_count = 16,
                    animation_speed = 0.6,
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
        },
        working_sound =
        {
            sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.6},
            apparent_volume = 0.3,
        },
    },
    {
        name = "ei_cold-coolant",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid", amount = 5},
            {type = "fluid", name = "ei_molten-lead", amount = 30},
        },
        results = {
            {type = "fluid", name = "ei_cold-coolant", amount = 25},
            {type = "fluid", name = "ei_dirty-water", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cold-coolant",
    },
})

--RECIPES FOR FUSION
------------------------------------------------------------------------------------------------------

local base_recipe = {
    name = "ei_dt-fusion",
    type = "recipe",
    category = "ei_fusion-reactor",
    energy_required = 1,
    ingredients = {
        {type = "fluid", name = "ei_heated-deuterium", amount = 15}, -- fuel 1
        {type = "fluid", name = "ei_heated-tritium", amount = 15},   -- fuel 2
        {type = "fluid", name = "ei_cold-coolant", amount = 100},
    },
    results = {
        {type = "fluid", name = "ei_hot-coolant", amount = 100},
    },
    always_show_made_in = true,
    enabled = true,
    hidden = true,
    -- TODO add a cool icon
    main_product = "ei_hot-coolant",
}


-- [possbile settings in fusion reactor GUI]

-- 1. fuel 1: "ei_heated-".."deuterium" or "tritium" or "protium" or "helium-3" or "lithium-6"
-- 2. fuel 2: "ei_heated-".."deuterium" or "tritium" or "protium" or "helium-3" or "lithium-6"

-- 3. reactor temperature:
--          low <=> high neutron flux, power output = 0.2 
--          medium <=> low neutron flux, power output = 1
--          high <=> no neutron flux, power output = 1.2

-- -> neutron flux is evaluated by neutron_collector script

-- 4. reactor fuel injection:
--          low <=> 5/s, power output = 0.75
--          medium <=> 10/s, power output = 1
--          high <=> 25/s, power output = 2 


-- [Base values for fuel combinations]

-- 1 protium + 1 protium <=> nope
-- 1 protium + 1 deuterium <=> nope
-- 1 protium + 1 tritium <=> nope
-- 1 protium + 1 helium-3 <=> nope
-- 1 protium + 1 lithium-6 <=> 60MJ

-- 1 deuterium + 1 deuterium <=> 100MJ
-- 1 deuterium + 1 tritium <=> 200MJ
-- 1 deuterium + 1 helium-3 <=> 220MJ
-- 1 deuterium + 1 lithium-6 <=> 120MJ

-- 1 tritium + 1 tritium <=> 300MJ
-- 1 tritium + 1 helium-3 <=> 380MJ
-- 1 tritium + 1 lithium-6 <=> nope

-- always 1 cold coolant -> 1 hot coolant
-- 1 hot coolant transports 20MJ
--> 1 GJ = 50 hot coolant


-- get data from ei_data.fusion
fuel_combinations = ei_data.fusion.fuel_combinations
temp_modes = ei_data.fusion.temp_modes
fuel_injection_modes = ei_data.fusion.fuel_injection_modes

coolant_fuel_value = ei_data.fusion.coolant_fuel_value

-- make recipes for all possible fuel, temp and fuel injection combinations
for fuel1, fuel2_combinations in pairs(fuel_combinations) do

    for fuel2, energy in pairs(fuel2_combinations) do

        if energy then
        
            for temp_mode, temp_mode_value in pairs(temp_modes) do

                for fuel_injection_mode, fuel_injection_mode_values in pairs(fuel_injection_modes) do
                    local recipe = table.deepcopy(base_recipe)
                    recipe.name = "ei_fusion-F1__"..fuel1.."-F2__"..fuel2.."-TM__"..temp_mode.."-FM__"..fuel_injection_mode

                    recipe.ingredients[1].name = fuel1
                    recipe.ingredients[1].amount = fuel_injection_mode_values[2]
                    recipe.ingredients[2].name = fuel2
                    recipe.ingredients[2].amount = fuel_injection_mode_values[2]

                    recipe.ingredients[3].name = "ei_cold-coolant"
                    recipe.ingredients[3].amount = energy * temp_mode_value * fuel_injection_mode_values[1] / coolant_fuel_value
                    recipe.results[1].amount = energy * temp_mode_value * fuel_injection_mode_values[1] / coolant_fuel_value

                    data:extend({recipe})
                end

            end

        end

    end

end

-- example recipe name:
-- ei_fusion-F1__ei_heated-deuterium-F2__ei_heated-tritium-TM__medium-FM__high

-- F1: fuel 1, F2: fuel 2, TM: temperature mode, FM: fuel injection mode
