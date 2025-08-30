ei_data = require("lib/data")

--====================================================================================================
--SOLAR PANEL 2
--====================================================================================================

data:extend({
    {
        name = "ei_solar-panel-3",
        type = "item",
        icon = ei_graphics_item_path.."solar-panel-3.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy",
        order = "d[solar-panel]-b[ei_solar-panel-3]",
        place_result = "ei_solar-panel-3",
        stack_size = 50
    },
    {
        name = "ei_solar-panel-3",
        type = "technology",
        icon = ei_graphics_tech_path.."solar-panel-3.png",
        icon_size = 256,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_solar-panel-3"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_solar-panel-3",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="ei_solar-panel-2", amount=2},
            {type="item", name="ei_high-energy-crystal", amount=6},
            {type="item", name="ei_neodym-plate", amount=4},
            {type="item", name="ei_odd-plating", amount=2}
        },
        results = {{type="item", name="ei_solar-panel-3", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_solar-panel-3",
    },
})

-- deep copy the solar panel and modify it
local panel = table.deepcopy(data.raw["solar-panel"]["solar-panel"])

panel.name = "ei_solar-panel-3"
panel.icon = ei_graphics_item_path.."solar-panel-3.png"
panel.icon_size = 64
panel.minable.result = "ei_solar-panel-3"

panel.production = "320kW"
panel.fast_replaceable_group = "solar-panel"

-- use new graphics
panel.picture.layers[1].filename = ei_graphics_entity_path.."solar-panel-3.png"
panel.picture.layers[1].width = 116
panel.picture.layers[1].height = 112
panel.picture.layers[1].scale = 1

data:extend({panel})