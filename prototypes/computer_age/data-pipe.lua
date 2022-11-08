ei_data = require("lib/data")

--====================================================================================================
--DATA PIPE
--====================================================================================================

data:extend({
    {
        name = "ei_data-pipe",
        type = "item",
        icon = ei_graphics_item_path.."data-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy-pipe-distribution",
        order = "b[pipe]-d",
        place_result = "ei_data-pipe",
        stack_size = 100
    },
    {
        name = "ei_data-pipe",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"pipe", 1},
            {"ei_ceramic", 2},
            {"plastic-bar", 2},
        },
        result = "ei_data-pipe",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_data-pipe",
    },
})

local pipe = util.table.deepcopy(data.raw.pipe.pipe)
pipe.name = "ei_data-pipe"
pipe.minable.result = "ei_data-pipe"
pipe.fluid_box.filter = "ei_computing-power"

-- loop over pictures and swap first part of filename with ei_graphics_insulated_path
-- if filename has pipe in it, without the path part:
-- set hr version to nil and double scale, size of normal version
for k, v in pairs(pipe.pictures) do
    v.filename = ei_graphics_data_pipe_path..v.filename:match("^.+/(.+)$")
    if v.hr_version then
        v.hr_version.filename = ei_graphics_data_pipe_path..v.hr_version.filename:match("^.+/(.+)$")
    end

    local name = v.filename:match("^.+/(.+)$")

    if name:match("pipe") then
        if v.hr_version then
            v.hr_version = nil
            v.scale = 0.5
            v.width = v.width * 2
            v.height = v.height * 2
        end
    end
end

data:extend({
    pipe
})
