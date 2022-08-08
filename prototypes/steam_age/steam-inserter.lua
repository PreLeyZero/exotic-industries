

--====================================================================================================
--STEAM INSERTER
--====================================================================================================

data:extend({
    {
        name = "ei_steam-inserter",
        type = "item",
        icon = ei_graphics_item_path.."steam-inserter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "a[burner-inserter]-a",
        place_result = "ei_steam-inserter",
        stack_size = 50
    },
    {
        name = "ei_steam-inserter",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"burner-inserter", 1},
            {"ei_steam-engine", 1},
        },
        result = "ei_steam-inserter",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-inserter",
    },
    {
        name = "ei_steam-long-inserter",
        type = "item",
        icon = ei_graphics_item_path.."steam-long-inserter.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "a[burner-inserter]-b",
        place_result = "ei_steam-long-inserter",
        stack_size = 50
    },
    {
        name = "ei_steam-long-inserter",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"burner-inserter", 1},
            {"ei_steam-engine", 1},
        },
        result = "ei_steam-long-inserter",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_steam-long-inserter",
    },
    {
        name = "ei_steam-inserter",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-inserter.png",
        icon_size = 128,
        prerequisites = {"ei_steam-power"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_steam-inserter"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_steam-long-inserter"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["steam-age"],
            time = 20
        },
        age = "steam-age",
    }, 
})

-- deep copy burner inserter
local inserter = table.deepcopy(data.raw["inserter"]["inserter"])

-- set name and icon
inserter.name = "ei_steam-inserter"
inserter.icon = ei_graphics_item_path.."steam-inserter.png"

-- set new platform picture
inserter.platform_picture = {
    sheet = {
        filename = ei_graphics_entity_path.."steam-inserter_platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        scale = 0.5
    }
}

-- shift all hand pictures by some pixels
local hand_shift = util.by_pixel(0, -7)

local pictures_to_shift = {
    "hand_base_shadow",
    "hand_closed_shadow",
    "hand_open_shadow",
    "hand_base_picture",
    "hand_closed_picture",
    "hand_open_picture",
}


for _, picture in ipairs(pictures_to_shift) do
    inserter[picture].shift = hand_shift
    inserter[picture].hr_version.shift = hand_shift
end

-- set energy source to steam fluid box
inserter.energy_source = {
    type = "fluid",
    fluid_box = {   
        filter = "steam",
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        --pipe_picture = ei_pipe_steam,
        pipe_connections = {
            {type = "input-output", position = {1, 0}},
            {type = "input-output", position = {-1, 0}}
        },
        production_type = "input-output",
    },
    effectivity = 1,
    scale_fluid_usage = true,
}

-- steam long handed inserter
local long_inserter = table.deepcopy(data.raw["inserter"]["long-handed-inserter"])

-- set name and icon
long_inserter.name = "ei_steam-long-inserter"
long_inserter.icon = ei_graphics_item_path.."steam-long-inserter.png"

-- set new platform picture
long_inserter.platform_picture = {
    sheet = {
        filename = ei_graphics_entity_path.."steam-inserter_platform.png",
        priority = "extra-high",
        width = 105,
        height = 79,
        scale = 0.5
    }
}

for _, picture in ipairs(pictures_to_shift) do
    long_inserter[picture].shift = hand_shift
    long_inserter[picture].hr_version.shift = hand_shift
end

-- set energy source to steam fluid box
long_inserter.energy_source = {
    type = "fluid",
    fluid_box = {   
        filter = "steam",
        base_area = 1,
        base_level = -1,
        height = 2,
        pipe_covers = pipecoverspictures(),
        --pipe_picture = ei_pipe_steam,
        pipe_connections = {
            {type = "input-output", position = {1, 0}},
            {type = "input-output", position = {-1, 0}}
        },
        production_type = "input-output",
    },
    effectivity = 1,
    scale_fluid_usage = true,
}

-- add to data
data:extend({inserter, long_inserter})