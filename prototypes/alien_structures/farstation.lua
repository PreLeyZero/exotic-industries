--====================================================================================================
--FARSTATION
--====================================================================================================

data:extend({
    {
        name = "ei_farstation",
        type = "item",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        subgroup = "ei_alien-structures-2",
        order = "a-c",
        place_result = "ei_farstation",
        stack_size = 10
    },
    {
        name = "ei_farstation",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="steel-plate", amount=20},
            {type="item", name="ei_steel-mechanical-parts", amount=32},
            {type="item", name="ei_electronic-parts", amount=20},
            {type="item", name="ei_computer-core", amount=1},
        },
        results = {{type="item", name="ei_farstation", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_farstation",
    },
    {
        name = "ei_farstation",
        type = "electric-pole",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 0.5,
            result = "ei_farstation"
        },
        max_health = 500,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
        selection_box = {{-2, -2}, {2, 2}},
        map_color = data.raw["electric-pole"]["substation"].map_color,
        maximum_wire_distance = 64,
        supply_area_distance = 64,
        pictures = {
            filename = ei_graphics_entity_2_path.."farstation.png",
            priority = "high",
            width = 512,
            height = 512,
            direction_count = 1,
            scale = 0.57,
            shift = {0, -0.5}
        },
        copper_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		green_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		radius_visualisation_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
			width = 12,
			height = 12,
			priority = "extra-high-no-scale",
		},
		red_wire_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
			priority = "high",
			width = 224,
			height = 46
		},
		wire_shadow_picture =
		{
			filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
			priority = "high",
			width = 224,
			height = 46
		},
        connection_points =
		{
			{
				shadow =
				{
					copper = {3.5, 0},
					green = {3.5, 0},
					red = {3.5, 0}
				},
				wire =
				{
					copper = {0, -4.8},
					green = {-0.2,-4.8},
					red = {0.2,-4.8}
				}
			},
		},
    },
    -- add destroyed beacons as containers
    {
        name = "ei_farstation_off-1",
        type = "item",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "b1",
        place_result = "ei_farstation_off-1",
        stack_size = 1,
    },
    {
        name = "ei_farstation_off-2",
        type = "item",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "b2",
        place_result = "ei_farstation_off-2",
        stack_size = 1,
    },
    {
        name = "ei_farstation_off-3",
        type = "item",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        subgroup = "ei_alien-structures",
        order = "b2",
        place_result = "ei_farstation_off-3",
        stack_size = 1,
    },
    {
        name = "ei_farstation_off-1",
        type = "container",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
        max_health = 300,
        corpse = "big-remnants",
        collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
        selection_box = {{-2, -2}, {2, 2}},
        map_color = ei_data.colors.alien,
        inventory_size = 0,
        picture = {
            filename = ei_graphics_entity_2_path.."farstation_off-1.png",
            size = {512,512},
            scale = 0.57,
            shift = {0, -0.5}
        },
        minable = {
            mining_time = 2,
            result = "ei_farstation_off-1",
        },
    },
    {
        name = "ei_farstation_off-2",
        type = "container",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
        max_health = 300,
        corpse = "big-remnants",
        collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
        selection_box = {{-2, -2}, {2, 2}},
        map_color = ei_data.colors.alien,
        inventory_size = 0,
        picture = {
            filename = ei_graphics_entity_2_path.."farstation_off-2.png",
            size = {512,512},
            scale = 0.57,
            shift = {0, -0.5}
        },
        minable = {
            mining_time = 2,
            result = "ei_farstation_off-2",
        },
    },
    {
        name = "ei_farstation_off-3",
        type = "container",
        icon = ei_graphics_item_2_path.."farstation.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "not-deconstructable", "not-blueprintable"},
        max_health = 300,
        corpse = "big-remnants",
        collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
        selection_box = {{-2, -2}, {2, 2}},
        map_color = ei_data.colors.alien,
        inventory_size = 0,
        picture = {
            filename = ei_graphics_entity_2_path.."farstation_off-3.png",
            size = {512,512},
            scale = 0.57,
            shift = {0, -0.5}
        },
        minable = {
            mining_time = 2,
            result = "ei_farstation_off-3",
        },
    },

    {
        name = "ei_farstation-repair",
        type = "selection-tool",
        stack_size = 1,
        icon_size = 64,
        icon = ei_graphics_item_2_path.."farstation-repair.png",
        -- flags = {"mod-openable"},
        select = {
            border_color = {r=0.79, g=0.4, b=0, a=0.5 },
            mode = {"any-entity"},
            cursor_box_type = "entity",
        },
        alt_select = {
            border_color = {r=0, g=1, b=0, a=0.5 },
            cursor_box_type = "entity",
            mode = {"any-entity"},
        },
        entity_filter_mode = "whitelist",
        entity_filters = ei_data.repair_tool_entity_filter("ei_farstation-repair"),
        subgroup = "ei_repairs",
        order = "a-b",
    },
    {
        name = "ei_farstation-repair",
        type = "technology",
        icon = ei_graphics_tech_2_path.."farstation-repair.png",
        icon_size = 256,
        prerequisites = {"ei_sus-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_farstation-repair"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
        -- age = "computer-age",
    },
    {
        name = "ei_farstation",
        type = "technology",
        icon = ei_graphics_tech_2_path.."farstation.png",
        icon_size = 256,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_farstation"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-3"],
            time = 20
        },
        -- age = "computer-age",
    },
    {
        name = "ei_farstation-repair",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients = {
            {type = "item", name = "ei_sus-plating", amount = 10},
            {type = "item", name = "ei_electronic-parts", amount = 6},
            {type = "item", name = "ei_high-energy-crystal", amount = 10},
        },
        results = {
            {type = "item", name = "ei_farstation-repair", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_farstation-repair",
    },
    {
        name = "ei_farstation",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients = {
            {type = "item", name = "ei_odd-plating", amount = 100},
            {type = "item", name = "ei_carbon-structure", amount = 25},
            {type = "item", name = "processing-unit", amount = 8},
            {type = "item", name = "ei_insulated-wire", amount = 32},
            {type = "item", name = "substation", amount = 1},
        },
        results = {
            {type = "item", name = "ei_farstation", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_farstation",
    },
})
