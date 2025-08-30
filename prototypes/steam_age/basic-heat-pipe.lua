-- add basic heat pipes
-- with max temp of 275 dec
-- but way better heat transfer

ei_data = require("lib/data")

--====================================================================================================
--BASIC HEAT PIPE
--====================================================================================================

data:extend({
    {
        name = "ei_basic-heat-pipe",
        type = "item",
        icon = ei_graphics_item_path.."basic-heat-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "energy",
        order = "f[nuclear-energy]-b[basic-heat-pipe]",
        place_result = "ei_basic-heat-pipe",
        stack_size = 50
    },
    {
        name = "ei_basic-heat-pipe",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="steel-plate", amount=1},
            {type="item", name="ei_iron-ingot", amount=2},
            {type="item", name="ei_copper-ingot", amount=2},
        },
        results = {{type="item", name="ei_basic-heat-pipe", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_basic-heat-pipe",
    },
})

local pipe = table.deepcopy(data.raw["heat-pipe"]["heat-pipe"])

pipe.name = "ei_basic-heat-pipe"
pipe.icon = ei_graphics_item_path.."basic-heat-pipe.png"
pipe.icon_size = 64
pipe.minable.result = "ei_basic-heat-pipe"
pipe.mining_speed = 0.5

pipe.heat_buffer.max_temperature = 275
pipe.heat_buffer.specific_heat = ei_data.specific_heat
pipe.heat_buffer.minimum_glow_temperature = pipe.heat_buffer.max_temperature * 0.5

-- loop over connection sprites and change the filename

for i,v in pairs(pipe.connection_sprites) do

    -- loop over all sprite variants
    for j,k in ipairs(pipe.connection_sprites[i]) do
        -- remove the path from filename
        local file = k.filename:gsub("^(.*/)", "")
        -- change the filename and hr version

        pipe.connection_sprites[i].filename = ei_graphics_heat_path.."cold_connections/".."hr-"..file
        pipe.connection_sprites[i].scale = 0.5
        pipe.connection_sprites[i].height = 64
        pipe.connection_sprites[i].width = 64
        
    end
end

for i,v in pairs(pipe.heat_glow_sprites) do

    for j,k in ipairs(pipe.heat_glow_sprites[i]) do
        -- if layers
        if pipe.heat_glow_sprites[i][j].layers then
            -- remove the path from filename
            local file = pipe.heat_glow_sprites[i][j].layers[1].filename:gsub("^(.*/)", "")
            -- change the filename and hr version
            pipe.heat_glow_sprites[i][j].layers[1].filename = ei_graphics_heat_path.."heated_connections/".."hr-"..file
            pipe.heat_glow_sprites[i][j].layers[1].scale = 0.5
            pipe.heat_glow_sprites[i][j].layers[1].height = 64
            pipe.heat_glow_sprites[i][j].layers[1].width = 64
        

            pipe.heat_glow_sprites[i][j].layers[2].filename = ei_graphics_heat_path.."heated_connections/".."hr-"..file
            pipe.heat_glow_sprites[i][j].layers[2].scale = 0.5
            pipe.heat_glow_sprites[i][j].layers[2].height = 64
            pipe.heat_glow_sprites[i][j].layers[2].width = 64
            pipe.heat_glow_sprites[i][j].layers[2].draw_as_light = true
        end
    end
end

data:extend({pipe})