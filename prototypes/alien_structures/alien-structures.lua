-- ====================================================================================================
-- OTHER STRUCTURES/THINGS
-- ====================================================================================================
data:extend({{
    name = "ei_spawner-tool",
    type = "selection-tool",
    stack_size = 1,
    icon_size = 64,
    icon = ei_graphics_other_path .. "spawner-tool.png",
    flags = {"mod-openable"},
    selection_color = {
        r = 0.79,
        g = 0.4,
        b = 0,
        a = 0.5
    },
    selection_mode = {"any-entity", "items"},
    selection_cursor_box_type = "entity",
    alt_selection_color = {
        r = 1,
        g = 0,
        b = 0,
        a = 0.5
    },
    alt_selection_cursor_box_type = "entity",
    alt_selection_mode = {"any-entity"}
}, {
    name = "ei_tile-tool",
    type = "selection-tool",
    stack_size = 1,
    icon_size = 64,
    icon = ei_graphics_other_path .. "spawner-tool.png",
    flags = {"mod-openable"},
    selection_color = {
        r = 0.79,
        g = 0.4,
        b = 0,
        a = 0.5
    },
    selection_mode = {"any-entity", "any-tile", "items"},
    selection_cursor_box_type = "entity",
    alt_selection_color = {
        r = 1,
        g = 0,
        b = 0,
        a = 0.5
    },
    alt_selection_cursor_box_type = "entity",
    alt_selection_mode = {"any-entity"}
}, {
    name = "ei_artifact-flag",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_other_path .. "64_empty.png",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map", "hidden", "hide-alt-info",
             "not-selectable-in-game", "not-repairable", "not-blueprintable", "not-deconstructable", "not-flammable",
             "not-upgradable"},
    picture = {
        filename = ei_graphics_other_path .. "64_empty.png",
        size = {64, 64},
        shift = {0, 0}
    },
    collision_mask = {}
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    -- selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
}, {
    name = "ei_factorio-logo-11tiles",
    type = "item",
    icon = ei_graphics_item_path .. "factorio-icon.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "x1",
    place_result = "factorio-logo-11tiles",
    stack_size = 1
}, {
    name = "ei_alien-resin",
    type = "item",
    icon = ei_graphics_item_path .. "alien-resin.png",
    icon_size = 64,
    subgroup = "ei_alien-items",
    order = "a-a",
    stack_size = 50
}, {
    name = "ei_alien-flowers-1",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-1",
    stack_size = 50
}, {
    name = "ei_alien-flowers-1",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-1.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.5,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.025
    }}
}, {
    name = "ei_alien-flowers-2",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-2",
    stack_size = 50
}, {
    name = "ei_alien-flowers-2",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-2.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 1,
        count_min = 2,
        count_max = 10
    }, {
        item = "ei_gold-chunk",
        probability = 1,
        count_min = 1,
        count_max = 2
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-3",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-3",
    stack_size = 50
}, {
    name = "ei_alien-flowers-3",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-3.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.5,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-4",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-4",
    stack_size = 50
}, {
    name = "ei_alien-flowers-4",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-4.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.5,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-5",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-5",
    stack_size = 50
}, {
    name = "ei_alien-flowers-5",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-5.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.5,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-6",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-6",
    stack_size = 50
}, {
    name = "ei_alien-flowers-6",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-6.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_gold-chunk",
        probability = 1,
        count_min = 1,
        count_max = 4
    }}
}, {
    name = "ei_alien-flowers-7",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-7",
    stack_size = 50
}, {
    name = "ei_alien-flowers-7",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-7.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.5,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-8",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-8",
    stack_size = 50
}, {
    name = "ei_alien-flowers-8",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-8.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 0.25,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-9",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-9",
    stack_size = 50
}, {
    name = "ei_alien-flowers-9",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-9.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 1,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_gold-chunk",
        probability = 1,
        count_min = 1,
        count_max = 4
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-10",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-10",
    stack_size = 50
}, {
    name = "ei_alien-flowers-10",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-10.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 1,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_high-energy-crystal",
        probability = 1,
        count_min = 1,
        count_max = 4
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-flowers-11",
    type = "item",
    icon = ei_graphics_item_path .. "alien-flowers.png",
    icon_size = 64,
    subgroup = "ei_alien-structures",
    order = "b1",
    place_result = "ei_alien-flowers-11",
    stack_size = 50
}, {
    name = "ei_alien-flowers-11",
    type = "simple-entity",
    icon_size = 64,
    icon = ei_graphics_item_path .. "alien-flowers.png",
    flags = {"placeable-neutral", "placeable-off-grid"},
    picture = {
        filename = ei_graphics_entity_path .. "alien-flowers-11.png",
        size = {512 / 2, 512 / 2},
        shift = {0, 0},
        scale = 0.35 * 2
    },
    healing_per_tick = 0.5,
    -- collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    max_health = 20,
    loot = {{
        item = "ei_alien-resin",
        probability = 1,
        count_min = 1,
        count_max = 10
    }, {
        item = "ei_energy-crystal",
        probability = 1,
        count_min = 1,
        count_max = 4
    }, {
        item = "ei_alien-seed",
        probability = 0.1
    }}
}, {
    name = "ei_alien-seed",
    type = "item",
    icon = ei_graphics_item_path .. "alien-seed.png",
    icon_size = 64,
    subgroup = "ei_alien-items",
    order = "a-b",
    stack_size = 1
}, {
    name = "ei_blooming-alien-seed",
    type = "item",
    icon = ei_graphics_item_path .. "blooming-alien-seed.png",
    icon_size = 64,
    subgroup = "ei_alien-items",
    order = "a-c",
    stack_size = 1
}})

data.raw.container["factorio-logo-11tiles"].minable = {
    mining_time = 30,
    result = "ei_factorio-logo-11tiles"
}
