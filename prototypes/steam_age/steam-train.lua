-- prototpye definition for steam trains with textures from YuokiTani

--====================================================================================================
--STEAM TRAINS
--====================================================================================================

-- basic steam train

data:extend({
    {
        name = "ei_steam-basic-locomotive",
        type = "item",
        icon = ei_graphics_train_path.."sewt_bl_icon.png",
        icon_size = 32,
        subgroup = "ei_trains",
        order = "a1",
        place_result = "ei_steam-basic-locomotive",
        stack_size = 10
    },
    {
        name = "ei_steam-basic-wagon",
        type = "item",
        icon = ei_graphics_train_path.."4a-tw-s3-icon.png",
        icon_size = 32,
        subgroup = "ei_trains",
        order = "a2",
        place_result = "ei_steam-basic-wagon",
        stack_size = 10
    },
    {
        name = "ei_steam-basic-locomotive",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 20},
            {"ei_iron-mechanical-parts", 10},
            {"ei_copper-mechanical-parts", 10},
            {"ei_steam-engine", 10},
            {"boiler", 1},
        },
        result = "ei_steam-basic-locomotive",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-basic-locomotive",
    },
    {
        name = "ei_steam-basic-wagon",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"iron-plate", 20},
            {"ei_iron-mechanical-parts", 5},
            {"ei_copper-mechanical-parts", 5},
        },
        result = "ei_steam-basic-wagon",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-basic-wagon",
    },
    {
        name = "ei_iron-rail",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"stone", 1},
            {"ei_iron-beam", 2},
            {"copper-plate", 1}
        },
        result = "rail",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "rail",
    },
    {
        name = "ei_steam-basic-train",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-basic-train.png",
        icon_size = 410,
        prerequisites = {"ei_steam-power"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_steam-basic-locomotive"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_steam-basic-wagon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_iron-rail"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    },
    {
		type = "locomotive",
		name = "ei_steam-basic-locomotive",
		icon = ei_graphics_train_path.."sewt_bl_icon.png",
        icon_size = 32,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", },
		minable = 
        {
            mining_time = 1,
            result = "ei_steam-basic-locomotive"
        },
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 800,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",

		collision_box = {{-0.6, -2.6}, {0.6, 2.6}},
		selection_box = {{-1, -3}, {1, 3}},
		drawing_box = {{-1, -4}, {1, 3}},
		connection_distance = 3,
        joint_distance = 4,		

		weight = 1400,
		max_speed = 0.625,
		max_power = "450kW",
		reversing_power_modifier = 0.6,
		braking_force = 8,
		friction_force = 0.003,
		-- this is a percentage of current speed that will be subtracted
		air_resistance = 0.003,
		vertical_selection_shift = -0.5,
		energy_per_hit_point = 5,
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		burner =
		{
			fuel_category = "chemical",
			effectivity = 1,
			fuel_inventory_size = 3,
			smoke =
			{
				{
					name = "train-smoke",
					deviation = {0.3, 0.3},
					frequency = 300,
					position = {0, 0},
					starting_frame = 0,
					starting_frame_deviation = 60,
					height = 3,
					height_deviation = 0.5,
					starting_vertical_speed = 0.2,
					starting_vertical_speed_deviation = 0.1,
				}
			}
		},		
		front_light =
		{
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {-0.6, -16},
				size = 2,
				intensity = 0.6
			},
			{
				type = "oriented",
				minimum_darkness = 0.3,
				picture =
				{
					filename = "__core__/graphics/light-cone.png",
					priority = "medium",
					scale = 2,
					width = 200,
					height = 200
				},
				shift = {0.6, -16},
				size = 2,
				intensity = 0.6
			}
		},
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		
		pictures =
		{
			priority = "very-low",
			width = 512,
			height = 512,
			direction_count = 128,
			filenames =
			{
				ei_graphics_train_path.."se_cbl_sheet-0.png",
				ei_graphics_train_path.."se_cbl_sheet-1.png",
				ei_graphics_train_path.."se_cbl_sheet-2.png",
				ei_graphics_train_path.."se_cbl_sheet-3.png",
				ei_graphics_train_path.."se_cbl_sheet-4.png",
				ei_graphics_train_path.."se_cbl_sheet-5.png",
				ei_graphics_train_path.."se_cbl_sheet-6.png",
				ei_graphics_train_path.."se_cbl_sheet-7.png",
			},
			line_length = 4,
			lines_per_file = 4,
			shift = {0, -1.125},
			scale = 0.5,
			
		},
		minimap_representation =
		{
		  filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-minimap-representation.png",
		  flags = {"icon"},
		  size = {20, 40},
		  scale = 0.5
		},
		selected_minimap_representation =
		{
		  filename = "__base__/graphics/entity/diesel-locomotive/diesel-locomotive-selected-minimap-representation.png",
		  flags = {"icon"},
		  size = {20, 40},
		  scale = 0.5
		},
  
		wheels = standard_train_wheels,
		rail_category = "regular",

		stop_trigger =
		{
			-- left side
			{
				type = "create-trivial-smoke",
				repeat_count = 75,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the left
				speed = {-0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{-0.75, -2.7}, {-0.3, 2.7}}
			},
			-- right side
			{
				type = "create-trivial-smoke",
				repeat_count = 75,
				smoke_name = "smoke-train-stop",
				initial_height = 0,
				-- smoke goes to the right
				speed = {0.03, 0},
				speed_multiplier = 0.75,
				speed_multiplier_deviation = 1.1,
				offset_deviation = {{0.3, -2.7}, {0.75, 2.7}}
			},
			{
				type = "play-sound",
				sound =
				{
					{
						filename = "__base__/sound/train-breaks.ogg",
						volume = 0.6
					},
				}
			},
		},
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/steam-engine-90bpm.ogg",
				volume = 0.8
			},
			match_speed_to_activity = true,
		},
		open_sound = { filename = "__base__/sound/car-door-open.ogg", volume=0.7 },
		close_sound = { filename = "__base__/sound/car-door-close.ogg", volume = 0.7 },
		sound_minimum_speed = 0.2;
	},
    {
		type = "cargo-wagon",
		name = "ei_steam-basic-wagon",
		icon = ei_graphics_train_path.."4a-tw-s3-icon.png",
        icon_size = 32,
		flags = {"placeable-neutral", "player-creation", "placeable-off-grid", },
		inventory_size = 40,
		minable = {
            mining_time = 1,
            result = "ei_steam-basic-wagon"
        },
		mined_sound = {filename = "__core__/sound/deconstruct-medium.ogg"},
		max_health = 600,
		corpse = "medium-remnants",
		dying_explosion = "medium-explosion",
		
		collision_box = {{-0.6, -2.4}, {0.6, 2.4}},
		selection_box = {{-1.0, -2.7}, {1, 3.3}},		
		connection_distance = 3, joint_distance = 4,
		
		weight = 1200,
		max_speed = 1.2,
		braking_force = 2,
		friction_force = 0.0015,
		air_resistance = 0.002,
		energy_per_hit_point = 5,    
		resistances =
		{
			{type = "fire", decrease = 15, percent = 50 },
			{type = "physical", decrease = 15, percent = 30 },
			{type = "impact",decrease = 50,percent = 60},
			{type = "explosion",decrease = 15,percent = 30},
			{type = "acid",decrease = 10,percent = 20}
		},
		vertical_selection_shift = -0.8,
		--back_light = rolling_stock_back_light(),
		--stand_by_light = rolling_stock_stand_by_light(),
		pictures =
		{
			priority = "very-low",
			width = 256,
			height = 256,
			back_equals_front = true,
			direction_count = 64,
			filename = ei_graphics_train_path.."4acw_gr_sheet.png",      
			line_length = 8,
			lines_per_file = 8,
			shift = {0.42, -1.125}
		},
		minimap_representation = {
			filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},
		selected_minimap_representation = {
			filename = "__base__/graphics/entity/cargo-wagon/cargo-wagon-selected-minimap-representation.png",
			flags = {"icon"},
			size = {20, 40},
			scale = 0.5
		},

		wheels = standard_train_wheels,
		rail_category = "regular",
		drive_over_tie_trigger = drive_over_tie(),
		tie_distance = 50,
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/train-wheels.ogg",
				volume = 0.5
			},
			match_volume_to_activity = true,
		},
		crash_trigger = crash_trigger(),
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		sound_minimum_speed = 0.5;
		vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
	},  
})