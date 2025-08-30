-- add lab for dark age here
-- is available from game start

ei_data = require("lib/data")

--====================================================================================================
--DARK AGE LAB
--====================================================================================================
local lab = table.deepcopy(data.raw["lab"]["lab"])

-- set name and icon
lab.name = "ei_dark-age-lab"
lab.icon = ei_graphics_item_path.."dark-age-lab.png"

-- set new animation
lab.off_animation = {
    layers = {
      {
        filename = ei_graphics_entity_path.."dark-age-lab_animation.png",
        frame_count = 1,
        height = 174,
        scale = 0.5,
        shift = {0, 0.046875},
        width = 194,
      },
      {
        filename = "__base__/graphics/entity/lab/lab-integration.png",
        frame_count = 1,
        height = 162,
        scale = 0.5,
        shift = {0, 0.484375
        },
        width = 242
      },
      {
        
        draw_as_shadow = true,
        filename = "__base__/graphics/entity/lab/lab-shadow.png",
        frame_count = 1,
        height = 136,
        scale = 0.5,
        shift = {0.40625, 0.34375},
        width = 242
      }
    }
}
lab.on_animation = {
    layers = {
      {
        animation_speed = 0.3333333333333333,
        filename = ei_graphics_entity_path.."dark-age-lab_animation.png",
        frame_count = 33,
        height = 174,
        line_length = 11,
        scale = 0.5,
        shift = {0, 0.046875},
        width = 194
      },
      {
        animation_speed = 0.3333333333333333,
        filename = "__base__/graphics/entity/lab/lab-integration.png",
        frame_count = 1,
        height = 162,
        line_length = 1,
        repeat_count = 33,
        scale = 0.5,
        shift = {0, 0.484375},
        width = 242
      },
      {
        animation_speed = 0.3333333333333333,
        blend_mode = "additive",
        draw_as_light = true,
        filename = "__base__/graphics/entity/lab/lab-light.png",
        frame_count = 33,
        height = 194,
        line_length = 11,
        scale = 0.5,
        shift = {0, 0},
        width = 216
      },
      {
        animation_speed = 0.3333333333333333,
        draw_as_shadow = true,
        filename = "__base__/graphics/entity/lab/lab-shadow.png",
        frame_count = 1,
        height = 136,
        line_length = 1,
        repeat_count = 33,
        scale = 0.5,
        shift = {0.40625, 0.34375},
        width = 242
      }
    }
}

-- set new energy and stuff
lab.energy_source = {
    type = "burner",
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = {pollution = 6 },
    burnt_inventory_size = 1,
    fuel_categories = {"chemical"},
}

lab.energy_usage = "100kW"
lab.researching_speed = 1
lab.module_slots = 0
lab.inputs = ei_data.lab_inputs["dark-age-lab"]
lab.map_color = ei_data.colors.assembler
lab.minable.result = "ei_dark-age-lab"
lab.next_upgrade = "lab"
lab.fast_replaceable_group = "lab"

data:extend({
    {
        name = "ei_dark-age-lab",
        type = "item",
        icon = ei_graphics_item_path.."dark-age-lab.png",
        icon_size = 64,
        icon_mipmaps = 4,
        stack_size = 10,
        place_result = "ei_dark-age-lab",
        subgroup = "ei_labs",
        order = "a1",
    },
    {
        name = "ei_dark-age-lab",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="iron-plate", amount=6},
            {type="item", name="ei_copper-mechanical-parts", amount=4},
            {type="item", name="stone-brick", amount=4},
        },
        results = {{type="item", name="ei_dark-age-lab", amount=1}},
        enabled = true,
        always_show_made_in = true,
        main_product = "ei_dark-age-lab",
    },
    lab
    --[[
    {
        name = "ei_dark-age-lab",
        type = "lab",
        icon = ei_graphics_item_path.."dark-age-lab.png",
        icon_size = 64,
        flags = {"placeable-player", "player-creation"},
        minable = {
            mining_time = 1, 
            result = "ei_dark-age-lab"
        },
        max_health = 250,
        corpse = "big-remnants",
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        energy_source = {
            type = "burner",
            effectivity = 1,
            fuel_inventory_size = 1,
            emissions_per_minute = {pollution = 6 },
            burnt_inventory_size = 1,
            fuel_categories = {"chemical"},
        },
        energy_usage = "200KW",
        researching_speed = 0.5,
        on_animation = {
            filename = ei_graphics_path.."graphics/256_empty.png",
            width = 256,
            height = 256,
            frame_count = 1,
            line_length = 1,
            shift = {0, 0},
            animation_speed = 1,    
        },
        off_animation = {
            filename = ei_graphics_path.."graphics/256_empty.png",
            width = 256,
            height = 256,
            frame_count = 1,
            line_length = 1,
            shift = {0, 0},
            animation_speed = 1,    
        },
        inputs = ei_data.lab_inputs["dark-age"],
        map_color = ei_data.colors.assembler
    }
    ]]--
})