
local resource_autoplace = require("__core__/lualib/resource-autoplace")

--====================================================================================================
--DRILL DEPOSITS
--====================================================================================================

data:extend({
    {
        type = "resource",
        name = "ei_gold-patch",
        icon = ei_graphics_item_path.."gold-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_gold-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_gold-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."gold-patch.png",
            priority = "extra-high",
            width = 975,
            height = 664,
            scale = 0.2,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=1, g=0.82, b=0.28},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_gold-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_gold-patch"
	},
    {
        type = "resource",
        name = "ei_lead-patch",
        icon = ei_graphics_item_path.."lead-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_lead-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_lead-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."lead-patch.png",
            priority = "extra-high",
            width = 594,
            height = 634,
            scale = 0.2,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.28, g=0.29, b=0.58},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_lead-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_lead-patch"
	},
    {
        type = "resource",
        name = "ei_neodym-patch",
        icon = ei_graphics_item_path.."neodym-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_neodym-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_neodym-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."neodym-patch.png",
            priority = "extra-high",
            width = 519,
            height = 331,
            scale = 0.3,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.76, g=0.25, b=0.79},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_neodym-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_neodym-patch"
	},
    {
        type = "resource",
        name = "ei_iron-patch",
        icon = ei_graphics_item_path.."iron-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_iron-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_iron-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."iron-patch.png",
            priority = "extra-high",
            width = 285,
            height = 243,
            scale = 0.55,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.25, g=0.48, b=0.79},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_iron-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_iron-patch"
	},
    {
        type = "resource",
        name = "ei_copper-patch",
        icon = ei_graphics_item_path.."copper-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_copper-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_copper-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."copper-patch.png",
            priority = "extra-high",
            width = 233,
            height = 197,
            scale = 0.6,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.86, g=0.50, b=0.16},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_copper-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_copper-patch"
	},
    {
        type = "resource",
        name = "ei_coal-patch",
        icon = ei_graphics_item_path.."coal-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_coal-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_coal-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."coal-patch.png",
            priority = "extra-high",
            width = 1016,
            height = 720,
            scale = 0.2,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.20, g=0.20, b=0.20},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_coal-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_coal-patch"
	},
    {
        type = "resource",
        name = "ei_uranium-patch",
        icon = ei_graphics_item_path.."uranium-patch.png",
        icon_size = 64,
        flags = {"placeable-neutral"},
        category = "ei_drilling",
        order = "a-b-a",
        infinite = false,
        highlight = true,
        minimum = 600000,
        normal = 1200000,
        --infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 1,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
            mining_time = 1,
            result = "ei_uranium-chunk",
        },
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = "ei_uranium-patch",
			order = "x1",
			base_density = 1,
			richness_multiplier = 1,
			richness_multiplier_distance_bonus = 1.5,
			base_spots_per_km2 = 0.2,
			has_starting_area_placement = false,
			random_spot_size_minimum = 0.01,
			random_spot_size_maximum = 0.1,
			regular_blob_amplitude_multiplier = 1,
			richness_post_multiplier = 1.0,
			additional_richness = 350000,
			regular_rq_factor_multiplier = 0.1,
			candidate_spot_count = 22
		},
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."uranium-patch.png",
            priority = "extra-high",
            width = 567,
            height = 565,
            scale = 0.3,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.12, g=0.77, b=0.10},
        map_grid = false
    },
    {
		type = "autoplace-control",
		name = "ei_uranium-patch",
		richness = true,
		order = "x1",
		category = "resource"
	},
	{
		type = "noise-layer",
		name = "ei_uranium-patch"
	},
})