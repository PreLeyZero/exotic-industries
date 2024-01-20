ei_data = require("lib/data")

--====================================================================================================
--STEAM MINER
--====================================================================================================

data:extend({
    {
        name = "ei_steam-miner",
        type = "item",
        icon = ei_graphics_item_path.."steam-miner.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "extraction-machine",
        order = "a[items]-a[burner-mining-drill]-a",
        place_result = "ei_steam-miner",
        stack_size = 50
    },
    {
        name = "ei_steam-miner",
        type = "recipe",
        category = "crafting",
        energy_required = 3,
        ingredients =
        {
            {"burner-mining-drill", 1},
            {"ei_steam-engine", 2},
            {"ei_copper-mechanical-parts", 4},
            {"ei_copper-beam", 4}
        },
        result = "ei_steam-miner",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-miner",
    },
})

table.insert(data.raw["technology"]["ei_steam-power"].effects, {type = "unlock-recipe", recipe = "ei_steam-miner"})

local miner = util.table.deepcopy(data.raw["mining-drill"]["burner-mining-drill"])

miner.name = "ei_steam-miner"
miner.icon = ei_graphics_item_path.."steam-miner.png"
miner.icon_size = 64
miner.icon_mipmaps = 1
miner.minable.result = "ei_steam-miner"
miner.mining_speed = 0.35

-- set energy source
miner.energy_source = {
    type = "fluid",
    fluid_box = {   
        filter = "steam",
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        pipe_picture = ei_pipe_miner,
        pipe_connections = {
            {type = "input-output", position = {1.5, -0.5}},
            {type = "input-output", position = {-1.5, -0.5}},
        },
        production_type = "input-output",
    },
    effectivity = 1,
    scale_fluid_usage = true,
}
miner.fast_replaceable_group = "burner-mining-drill"
miner.radius_visualisation_picture = data.raw["mining-drill"]["electric-mining-drill"].radius_visualisation_picture
miner.resource_searching_radius = 2

data:extend({miner})

data.raw["mining-drill"]["burner-mining-drill"].next_upgrade = "ei_steam-miner"
data.raw["mining-drill"]["burner-mining-drill"].fast_replaceable_group = "burner-mining-drill"