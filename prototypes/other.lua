-- other prototype definitions

data:extend({
    {
        name = "ei_refining",
        type = "item-group",
        icon = ei_graphics_other_path.."refining-group.png",
        icon_size = 64,
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
    {
        name = "ei_refining-crushed",
        type = "item-subgroup",
        group = "ei_refining",
        order = "h",
    },
    {
        name = "ei_refining-purified",
        type = "item-subgroup",
        group = "ei_refining",
        order = "i",
    },
    {
        name = "ei_refining-molten",
        type = "item-subgroup",
        group = "ei_refining",
        order = "j",
    },
    {
        name = "ei_refining-tech",
        type = "item-subgroup",
        group = "ei_refining",
        order = "k",
    },
    {
        name = "ei_labs",
        type = "item-subgroup",
        group = "production",
        order = "e-a",
    },
    {
        name = "ei_trains",
        type = "item-subgroup",
        group = "logistics",
        order = "e-a",
    },


    -- nuclear group
    {
        name = "ei_nuclear",
        type = "item-group",
        icon = ei_graphics_other_path.."nuclear-group.png",
        icon_size = 128,
        inventory_order = "c-b",
        order = "c-b",
    },
    {
        name = "ei_nuclear-buildings",
        type = "item-subgroup",
        group = "ei_nuclear",
        order = "a",
    },
    {
        name = "ei_nuclear-fission-fuel",
        type = "item-subgroup",
        group = "ei_nuclear",
        order = "c",
    },
    {
        name = "ei_nuclear-processing",
        type = "item-subgroup",
        group = "ei_nuclear",
        order = "b",
    },

    -- fuel categories
    {
        name = "ei_diesel-fuel",
        type = "fuel-category",
    },
    {
        name = "ei_rocket-fuel",
        type = "fuel-category",
    },
    {
        name = "ei_nuclear-fuel",
        type = "fuel-category",
    },
})