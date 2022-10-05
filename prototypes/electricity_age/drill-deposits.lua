ei_data = require("lib/data")

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
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "item",
              name = "ei_gold-chunk",
              amount_min = 1,
              amount_max = 1,
              probability = 1
            }
          }
        },
        --collision_box = {{ -4, -4}, {4, 4}},
        --collision_mask = {"item-layer", "water-tile"},
        selection_box = {{-2, -2}, {2, 2}},
        --[[
        autoplace = resource_autoplace.resource_autoplace_settings{
          name = "columbit_deposit",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          base_density = 8.2,
          base_spots_per_km2 = 1.8,
          random_probability = 1/48,
          random_spot_size_minimum = 1,
          random_spot_size_maximum = 1, -- don't randomize spot size
          additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
          has_starting_area_placement = false,
          resource_index = resource_autoplace.resource_indexes["columbit_deposit"],
          regular_rq_factor_multiplier = 1
        },
        --]]
        stage_counts = {0},
        stages =
        {
          sheet =
          {
            filename = ei_graphics_entity_path.."gold-patch.png",
            priority = "extra-high",
            width = 975,
            height = 664,
            scale = 0.3,
            frame_count = 1,
            variation_count = 1
          }
        },
        map_color = {r=0.29, g=0.82, b=0.22},
        map_grid = false
    },
})