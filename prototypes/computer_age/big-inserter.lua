-- make big inserters from 

ei_data = require("lib/data")

--====================================================================================================
--BIG INSERTER
--====================================================================================================

data:extend({
    {
        name = "ei_big-inserter",
        type = "item",
        icon = ei_graphics_item_path.."big-inserter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-b-2",
        place_result = "ei_big-inserter",
        stack_size = 50
    },
    {
        name = "ei_big-inserter-normal",
        type = "item",
        icon = ei_graphics_item_path.."big-inserter-normal.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-b-1",
        place_result = "ei_big-inserter-normal",
        stack_size = 50
    },
    {
        name = "ei_big-inserter",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_big-inserter-normal", amount=1},
            {type="item", name="electronic-circuit", amount=4},
        },
        results = {{type="item", name="ei_big-inserter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_big-inserter",
    },
    {
        name = "ei_big-inserter-normal",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_small-inserter-normal", amount=1},
            {type="item", name="bulk-inserter", amount=4},
            {type="item", name="low-density-structure", amount=6},
        },
        results = {{type="item", name="ei_big-inserter-normal", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_big-inserter-normal",
    },
    {
        name = "ei_big-inserter",
        type = "technology",
        icon = ei_graphics_tech_path.."big-inserter.png",
        icon_size = 128,
        prerequisites = {"bulk-inserter", "low-density-structure"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_big-inserter-normal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_big-inserter"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
})

local inserter = table.deepcopy(data.raw["inserter"]["inserter"])

inserter.name = "ei_big-inserter"
inserter.icon = ei_graphics_item_path.."big-inserter.png"
inserter.icon_size = 64

inserter.minable.result = "ei_big-inserter"

-- make inserter 2x2
--inserter.collision_box = {{-1.3, -0.8}, {1.3, 0.8}}
--inserter.selection_box = {{-1.5, -1}, {1.5, 1}}

inserter.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
inserter.selection_box = {{-1, -1}, {1, 1}}

inserter.pickup_position = {0.5, -2.3}
inserter.insert_position = {-0.5, 2.3}

inserter.fast_replaceable_group = "ei_2x2-inserter"
inserter.next_upgrade = nil
inserter.filter_count = 5

-- pictures
inserter.hand_size = 1.5
inserter.hand_base_picture = {
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-base.png",
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
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-closed.png",
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
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-open.png",
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
        filename = ei_graphics_inserter_path.."big-inserter_inserter-platform.png",
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
inserter.energy_per_movement = "500kJ"
inserter.energy_per_rotation = "500kJ"

inserter.stack = true
inserter.rotation_speed = 0.03
inserter.stack_size_bonus = 250

data:extend({inserter})


local inserter = table.deepcopy(data.raw["inserter"]["inserter"])

inserter.name = "ei_big-inserter-normal"
inserter.icon = ei_graphics_item_path.."big-inserter-normal.png"
inserter.icon_size = 64

inserter.minable.result = "ei_big-inserter-normal"

-- make inserter 2x2
--inserter.collision_box = {{-1.3, -0.8}, {1.3, 0.8}}
--inserter.selection_box = {{-1.5, -1}, {1.5, 1}}

inserter.collision_box = {{-0.8, -0.8}, {0.8, 0.8}}
inserter.selection_box = {{-1, -1}, {1, 1}}

inserter.pickup_position = {0.5, -2.3}
inserter.insert_position = {-0.5, 2.3}

inserter.fast_replaceable_group = "ei_2x2-inserter"
inserter.next_upgrade = nil

-- pictures
inserter.hand_size = 1.5
inserter.hand_base_picture = {
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-base.png",
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
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-closed.png",
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
    filename = ei_graphics_inserter_path.."big-inserter_inserter-hand-open.png",
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
        filename = ei_graphics_inserter_path.."big-inserter-normal_inserter-platform.png",
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
inserter.energy_per_movement = "500kJ"
inserter.energy_per_rotation = "500kJ"

inserter.stack = true
inserter.rotation_speed = 0.03
inserter.stack_size_bonus = 250

data:extend({inserter})