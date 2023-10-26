--====================================================================================================
--GAIA PUMP
--====================================================================================================

data:extend({
    {
        name = "ei_gaia-pump",
        type = "item",
        icon = ei_graphics_item_path.."gaia-pump.png",
        icon_size = 64,
        subgroup = "extraction-machine",
        order = "b[fluids]-a[offshore-pump]-a",
        place_result = "ei_gaia-pump",
        stack_size = 20
    },
    {
        name = "ei_gaia-pump",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"offshore-pump", 1},
            {"ei_alien-resin", 2},
        },
        result = "ei_gaia-pump",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_gaia-pump",
    },
})

local pump = util.table.deepcopy(data.raw["offshore-pump"]["offshore-pump"])

pump.name = "ei_gaia-pump"
pump.fluid = "ei_gaia-water"
pump.minable.result = "ei_gaia-pump"

data:extend({pump})
