ei_data = require("lib/data")

--====================================================================================================
--INSULATED PIPE
--====================================================================================================

data:extend({
    {
        name = "ei_insulated-pipe",
        type = "item",
        icon = ei_graphics_item_path.."insulated-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy-pipe-distribution",
        order = "a[pipe]-c",
        place_result = "ei_insulated-pipe",
        stack_size = 100
    },
    {
        name = "ei_insulated-underground-pipe",
        type = "item",
        icon = ei_graphics_item_path.."insulated-underground-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy-pipe-distribution",
        order = "a[pipe]-d",
        place_result = "ei_insulated-underground-pipe",
        stack_size = 20
    },
    {
        name = "ei_insulated-pipe",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"pipe", 1},
            {"ei_ceramic", 2},
            {"plastic-bar", 2},
        },
        result = "ei_insulated-pipe",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_insulated-pipe",
    },
    {
        name = "ei_insulated-underground-pipe",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"ei_insulated-pipe", 10},
            {"steel-plate", 2},
        },
        result = "ei_insulated-underground-pipe",
        result_count = 2,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_insulated-underground-pipe",
    },
    {
        name = "ei_insulated-pipe",
        type = "technology",
        icon = ei_graphics_tech_path.."high-temperature-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_insulated-pipe"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_insulated-underground-pipe"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
})

local pipe = util.table.deepcopy(data.raw.pipe.pipe)
pipe.name = "ei_insulated-pipe"
pipe.minable.result = "ei_insulated-pipe"
pipe.fluid_box.filter = "ei_liquid-nitrogen"

-- loop over pictures and swap first part of filename with ei_graphics_insulated_path
-- also treat the hr version of the picture
for k, v in pairs(pipe.pictures) do
    v.filename = ei_graphics_insulated_path..v.filename:match("^.+/(.+)$")
    if v.hr_version then
        v.hr_version.filename = ei_graphics_insulated_path..v.hr_version.filename:match("^.+/(.+)$")
    end
end

local pipeToGround = util.table.deepcopy(data.raw["pipe-to-ground"]["pipe-to-ground"])
pipeToGround.name = "ei_insulated-underground-pipe"
pipeToGround.minable.result = "ei_insulated-underground-pipe"

for k, v in pairs(pipeToGround.pictures) do
    v.filename = ei_graphics_insulated_path..v.filename:match("^.+/(.+)$")
    if v.hr_version then
        v.hr_version.filename = ei_graphics_insulated_path..v.hr_version.filename:match("^.+/(.+)$")
    end
end

data:extend({
    pipe,
    pipeToGround,
})
