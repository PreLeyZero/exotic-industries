ei_data = require("lib/data")

--====================================================================================================
--NEO BELTS
--====================================================================================================

data:extend({
    {
        name = "ei_neo-logistics",
        type = "technology",
        icon = ei_graphics_tech_path.."logistics-4.png",
        icon_size = 256,
        prerequisites = {"ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_neo-belt"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neo-underground-belt"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neo-splitter"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_neo-belt",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
            {type = "item", name = "express-transport-belt", amount = 2},
            {type = "item", name = "ei_neodym-plate", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
        },
        results = {
            {type = "item", name = "ei_neo-belt", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neo-belt",
    },
    {
        name = "ei_neo-splitter",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 20},
            {type = "item", name = "express-splitter", amount = 2},
            {type = "item", name = "ei_neodym-plate", amount = 2},
            {type = "item", name = "processing-unit", amount = 5},
        },
        results = {
            {type = "item", name = "ei_neo-splitter", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neo-splitter",
    },
    {
        name = "ei_neo-underground-belt",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 6,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
            {type = "item", name = "express-underground-belt", amount = 4},
            {type = "item", name = "ei_neodym-plate", amount = 20},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 30},
        },
        results = {
            {type = "item", name = "ei_neo-underground-belt", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neo-underground-belt",
    },
    {
        name = "ei_neo-belt",
        type = "item",
        icon = ei_graphics_item_path.."neo-belt.png",
        icon_size = 64,
        subgroup = "belt",
        order = "a[transport-belt]-d[neo-transport-belt]",
        place_result = "ei_neo-belt",
        stack_size = 100
    },
    {
        name = "ei_neo-underground-belt",
        type = "item",
        icon = ei_graphics_item_path.."neo-underground-belt.png",
        icon_size = 64,
        subgroup = "belt",
        order = "b[underground-belt]-d[neo-underground-belt]",
        place_result = "ei_neo-underground-belt",
        stack_size = 50
    },
    {
        name = "ei_neo-splitter",
        type = "item",
        icon = ei_graphics_item_path.."neo-splitter.png",
        icon_size = 64,
        subgroup = "belt",
        order = "c[splitter]-d[neo-splitter]",
        place_result = "ei_neo-splitter",
        stack_size = 50
    },
    {
		type = "transport-belt",
		name = "ei_neo-belt",
		icon = ei_graphics_item_path.."neo-belt.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {
            mining_time = 0.2,
            result = "ei_neo-belt"
        },
		related_underground_belt = "ei_neo-underground-belt",
		max_health = 200,
		resistances =
		{
			{
				type = "fire",
				percent = 50
			}
		},
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/transport-belt.ogg",
				volume = 0.4
			},
			persistent = true
		},
		belt_animation_set = {
            animation_set =
            {
                filename = ei_graphics_belt_path .. "hr-neo-transport-belt.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                frame_count = 32,
                direction_count = 20
            },
        
            east_index = 1,
            west_index = 2,
            north_index = 3,
            south_index = 4,
        
            east_to_north_index = 5,
            north_to_east_index = 6,
        
            west_to_north_index = 7,
            north_to_west_index = 8,
        
            south_to_east_index = 9,
            east_to_south_index = 10,
        
            south_to_west_index = 11,
            west_to_south_index = 12,
        
            starting_south_index = 13,
            ending_south_index = 14,
        
            starting_west_index = 15,
            ending_west_index = 16,
        
            starting_north_index = 17,
            ending_north_index = 18,
        
            starting_east_index = 19,
            ending_east_index = 20
        },
		fast_replaceable_group = "transport-belt",
		speed = 0.125*3/2,
		animation_speed_coefficient = 32,
		connector_frame_sprites = transport_belt_connector_frame_sprites,
		circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
		circuit_connector_sprites = circuit_connector_definitions["belt"].sprites,
		circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
	},
    {
		type = "underground-belt",
		name = "ei_neo-underground-belt",
		icon = ei_graphics_item_path.."neo-underground-belt.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {
            mining_time = 0.2,
            result = "ei_neo-underground-belt"
        },
		max_health = 200,
		max_distance = 18,
		underground_sprite =
		{
			filename = "__core__/graphics/arrows/underground-lines.png",
			priority = "high",
			width = 64,
			height = 64,
			x = 64,
			scale = 0.5
		},
		underground_remove_belts_sprite =
		{
			filename = "__core__/graphics/arrows/underground-lines-remove.png",
			priority = "high",
			width = 64,
			height = 64,
			x = 64,
			scale = 0.5
		},
		resistances =
		{
			{
				type = "fire",
				percent = 50
			},
			{
				type = "impact",
				percent = 30
			}
		},
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},		
		belt_animation_set = {
            animation_set =
            {
                filename = ei_graphics_belt_path .. "hr-neo-transport-belt.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                frame_count = 32,
                direction_count = 20
            },
        
            east_index = 1,
            west_index = 2,
            north_index = 3,
            south_index = 4,
        
            east_to_north_index = 5,
            north_to_east_index = 6,
        
            west_to_north_index = 7,
            north_to_west_index = 8,
        
            south_to_east_index = 9,
            east_to_south_index = 10,
        
            south_to_west_index = 11,
            west_to_south_index = 12,
        
            starting_south_index = 13,
            ending_south_index = 14,
        
            starting_west_index = 15,
            ending_west_index = 16,
        
            starting_north_index = 17,
            ending_north_index = 18,
        
            starting_east_index = 19,
            ending_east_index = 20
        }, 
		fast_replaceable_group = "transport-belt",
		speed = 0.125*3/2,
		animation_speed_coefficient = 32,
		structure =
		{
			direction_in =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure.png",
					priority = "extra-high",
					width = 192,
					height = 192,
					y = 192,
					scale = 0.5
				}
			},
			direction_out =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure.png",
					priority = "extra-high",
					width = 192,
					height =192,
					scale = 0.5
				}
			},
			direction_in_side_loading =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure.png",
					priority = "extra-high",
					width = 192,
					height = 192,
					y = 192*3,
					scale = 0.5
				}
			},
			direction_out_side_loading =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure.png",
					priority = "extra-high",
					width = 192,
					height = 192,
					y = 192*2,
					scale = 0.5
				}
			},
			back_patch =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure-back-patch.png",
					priority = "extra-high",
					width = 192,
					height = 192,
					scale = 0.5
				}
			},
			front_patch =
			{
				sheet =
				{
					filename = ei_graphics_belt_path.."hr-neo-underground-belt-structure-front-patch.png",
					priority = "extra-high",
					width = 192,
					height = 192,
					scale = 0.5
				}
			}
		}
	},
    {
		type = "splitter",
		name = "ei_neo-splitter",
		icon = ei_graphics_item_path.."neo-splitter.png",
		icon_size = 64,
		flags = {"placeable-neutral", "player-creation"},
		minable = {
            mining_time = 0.2,
            result = "ei_neo-splitter"
        },
		max_health = 250,
		resistances =
		{
			{
				type = "fire",
				percent = 50
			}
		},
		collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
		selection_box = {{-0.9, -0.5}, {0.9, 0.5}},		
		structure_animation_speed_coefficient = 1.2,
		structure_animation_movement_cooldown = 10,
		belt_animation_set = 
        {
            animation_set =
            {
                filename = ei_graphics_belt_path .. "hr-neo-transport-belt.png",
                priority = "extra-high",
                width = 128,
                height = 128,
                scale = 0.5,
                frame_count = 32,
                direction_count = 20
            },
        
            east_index = 1,
            west_index = 2,
            north_index = 3,
            south_index = 4,
        
            east_to_north_index = 5,
            north_to_east_index = 6,
        
            west_to_north_index = 7,
            north_to_west_index = 8,
        
            south_to_east_index = 9,
            east_to_south_index = 10,
        
            south_to_west_index = 11,
            west_to_south_index = 12,
        
            starting_south_index = 13,
            ending_south_index = 14,
        
            starting_west_index = 15,
            ending_west_index = 16,
        
            starting_north_index = 17,
            ending_north_index = 18,
        
            starting_east_index = 19,
            ending_east_index = 20
        },
		fast_replaceable_group = "transport-belt",
		speed = 0.125*3/2,
		animation_speed_coefficient = 32,
		-- structure_animation_movement_cooldown = 10,
      	-- structure_animation_speed_coefficient = 1.2,
		structure =
		{
			north =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-north.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 160,
				height = 70,
				shift = util.by_pixel(7, 0),
				scale = 0.5
			},
			east =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-east.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 90,
				height = 84,
				shift = util.by_pixel(4, 13),
				scale = 0.5
			},
			south =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-south.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 164,
				height = 64,
				shift = util.by_pixel(4, 0),
				scale = 0.5
			},
			west =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-west.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 94,
				height = 86,
				shift = util.by_pixel(6, 12),
				scale = 0.5
			}
		},
		structure_patch =
		{
			north = util.empty_sprite(),
			east =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-east-top_patch.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 90,
				height = 104,
				shift = util.by_pixel(4, -20),
				scale = 0.5
			},
			south = util.empty_sprite(),
			west =
			{
				filename = ei_graphics_belt_path.."hr-neo-splitter-west-top_patch.png",
				frame_count = 32,
				line_length = 8,
				priority = "extra-high",
				width = 94,
				height = 96,
				shift = util.by_pixel(6, -18),
				scale = 0.5
			}
		}
	}
})