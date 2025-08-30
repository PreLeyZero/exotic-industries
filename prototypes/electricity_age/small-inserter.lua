-- make big inserters from 

ei_data = require("lib/data")

--====================================================================================================
--BIG INSERTER
--====================================================================================================

data:extend({
    {
        name = "ei_small-inserter",
        type = "item",
        icon = ei_graphics_item_path.."small-inserter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-a-2",
        place_result = "ei_small-inserter",
        stack_size = 50
    },
    {
        name = "ei_small-inserter-normal",
        type = "item",
        icon = ei_graphics_item_path.."small-inserter-normal.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-a-1",
        place_result = "ei_small-inserter-normal",
        stack_size = 50
    },
    {
        name = "ei_small-inserter",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="ei_small-inserter-normal", amount=1},
            {type="item", name="electronic-circuit", amount=4},
        },
        results = {{type="item", name="ei_small-inserter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_small-inserter",
    },
    {
        name = "ei_small-inserter-normal",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="fast-inserter", amount=4},
            {type="item", name="steel-plate", amount=10},
            {type="item", name="electric-engine-unit", amount=8},
        },
        results = {{type="item", name="ei_small-inserter-normal", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_small-inserter-normal",
    },
    {
        name = "ei_small-inserter",
        type = "technology",
        icon = ei_graphics_tech_path.."small-inserter.png",
        icon_size = 128,
        prerequisites = {"fast-inserter", "lubricant"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_small-inserter-normal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_small-inserter"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
})

local inserter = table.deepcopy(data.raw["inserter"]["inserter"])

inserter.name = "ei_small-inserter"
inserter.icon = ei_graphics_item_path.."small-inserter.png"
inserter.icon_size = 64

inserter.minable.result = "ei_small-inserter"

-- make inserter 2x2
--inserter.collision_box = {{-1.3, -0.8}, {1.3, 0.8}}
--inserter.selection_box = {{-1.5, -1}, {1.5, 1}}

inserter.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
inserter.selection_box = {{-1, -1}, {1, 1}}

inserter.pickup_position = {0.5, -2.3}
inserter.insert_position = {-0.5, 2.3}

inserter.fast_replaceable_group = "ei_2x2-inserter"
inserter.next_upgrade = "ei_big-inserter"
inserter.filter_count = 3

-- pictures
inserter.hand_size = 1.5
inserter.hand_base_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-base.png",
    height = 136*2,
    priority = "extra-high",
    scale = 0.25,
    width = 32*2
}
inserter.hand_base_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
    height = 132,
    priority = "extra-high",
    scale = 0.25*2,
    width = 32
}
inserter.hand_closed_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-closed.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 100
}
inserter.hand_closed_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 72
}
inserter.hand_open_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-open.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 100
}
inserter.hand_open_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 72
}
inserter.platform_picture = {
    sheet = {
        filename = ei_graphics_inserter_path.."small-inserter_inserter-platform.png",
        height = 79*2,
        priority = "extra-high",
        scale = 0.5,
        shift = {
            0.046875,
            0.203125
        },
        width = 105*2
    }
}

-- balancing
inserter.energy_per_movement = "100kJ"
inserter.energy_per_rotation = "100kJ"

inserter.stack = true
inserter.rotation_speed = 0.01
inserter.stack_size_bonus = 149

data:extend({inserter})

local inserter = table.deepcopy(data.raw["inserter"]["inserter"])

inserter.name = "ei_small-inserter-normal"
inserter.icon = ei_graphics_item_path.."small-inserter-normal.png"
inserter.icon_size = 64

inserter.minable.result = "ei_small-inserter-normal"

-- make inserter 2x2
--inserter.collision_box = {{-1.3, -0.8}, {1.3, 0.8}}
--inserter.selection_box = {{-1.5, -1}, {1.5, 1}}

inserter.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
inserter.selection_box = {{-1, -1}, {1, 1}}

inserter.pickup_position = {0.5, -2.3}
inserter.insert_position = {-0.5, 2.3}

inserter.fast_replaceable_group = "ei_2x2-inserter"
inserter.next_upgrade = "ei_big-inserter-normal"

-- pictures
inserter.hand_size = 1.5
inserter.hand_base_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-base.png",
    height = 136*2,
    priority = "extra-high",
    scale = 0.25,
    width = 32*2
}
inserter.hand_base_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png",
    height = 132,
    priority = "extra-high",
    scale = 0.25*2,
    width = 32
}
inserter.hand_closed_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-closed.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 100
}
inserter.hand_closed_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 72
}
inserter.hand_open_picture = {
    filename = ei_graphics_inserter_path.."small-inserter_inserter-hand-open.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 100
}
inserter.hand_open_shadow = {
    filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png",
    height = 164,
    priority = "extra-high",
    scale = 0.25*2,
    width = 72
}
inserter.platform_picture = {
    sheet = {
        filename = ei_graphics_inserter_path.."small-inserter-normal_inserter-platform.png",
        height = 79*2,
        priority = "extra-high",
        scale = 0.5,
        shift = {
            0.046875,
            0.203125
        },
        width = 105*2
    }
}

-- balancing
inserter.energy_per_movement = "100kJ"
inserter.energy_per_rotation = "100kJ"

inserter.stack = true
inserter.rotation_speed = 0.01
inserter.stack_size_bonus = 149

data:extend({inserter})