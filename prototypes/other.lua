-- other prototype definitions

data:extend({
    {
        name = "ei_refining",
        type = "item-group",
        icon = ei_graphics_path.."graphics/128_placeholder.png",
        icon_size = 128,
        inventory_order = "c-a",
        order = "c-a",
    },
    {
        name = "ei_refining-raw",
        type = "item-subgroup",
        group = "ei_refining",
        order = "a",
    },
    {
        name = "ei_refining-secondary",
        type = "item-subgroup",
        group = "ei_refining",
        order = "b",
    },
    {
        name = "ei_refining-byproduct",
        type = "item-subgroup",
        group = "ei_refining",
        order = "c",
    },
    {
        name = "ei_refining-ingot",
        type = "item-subgroup",
        group = "ei_refining",
        order = "d",
    },
    {
        name = "ei_refining-plate",
        type = "item-subgroup",
        group = "ei_refining",
        order = "e",
    },
    {
        name = "ei_refining-beam",
        type = "item-subgroup",
        group = "ei_refining",
        order = "f",
    },
    {
        name = "ei_refining-parts",
        type = "item-subgroup",
        group = "ei_refining",
        order = "g",
    },
})