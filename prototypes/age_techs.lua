-- store prototypes for age techs here to use them in control scripting

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--AGE TECHS
--====================================================================================================

local science = ei_data.science

data:extend({
    {
        name = "ei_temp",
        type = "technology",
        icon = ei_graphics_path.."graphics/128_placeholder.png",
        icon_size = 128,
        prerequisites = {

        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_dark-age",
        type = "technology",
        icon = ei_graphics_tech_path.."dark-age.png",
        icon_size = 128,
        prerequisites = {

        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 10
        },
        enabled = true,
        visible_when_disabled = true,
    },
    {
        name = "ei_steam-age",
        type = "technology",
        icon = ei_graphics_tech_path.."steam-age.png",
        icon_size = 128,
        prerequisites = {
            -- "ei_dark-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 20
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_electricity-age",
        type = "technology",
        icon = ei_graphics_tech_path.."electricity-age.png",
        icon_size = 128,
        prerequisites = {
            -- "ei_steam-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["steam-age"],
            time = 30
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_computer-age",
        type = "technology",
        icon = ei_graphics_tech_path.."computer-age.png",
        icon_size = 128,
        prerequisites = {
            -- "ei_electricity-age",
        },
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["electricity-age"],
            time = 40
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_quantum-age",
        type = "technology",
        icon = ei_graphics_tech_path.."quantum-age.png",
        icon_size = 128,
        prerequisites = {},
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["both-computer-age"],
            time = 50
        },
        enabled = false,
        visible_when_disabled = true,
    },
    {
        name = "ei_exotic-age",
        type = "technology",
        icon = ei_graphics_tech_path.."exotic-age.png",
        icon_size = 128,
        prerequisites = {},
        effects = {

        },
        unit = {
            count = "100",
            ingredients = science["both-quantum-age"],
            time = 60
        },
        enabled = false,
        visible_when_disabled = true,
    },


    -- dummy techs to have all of their age as prerequisites for storage of "age-marks"
    {
        name = "ei_steam-age__dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_electricity-age__dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_computer-age__dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_quantum-age__dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
    {
        name = "ei_exotic-age__dummy",
        type = "technology",
        icon = ei_lib.empty_sprite(256),
        icon_size = 256,
        prerequisites = {},
        effects = {},
        unit = {
            count = "100",
            ingredients = science["dark-age"],
            time = 100
        },
        hidden = true,
    },
})

-- if in dev mode unhidde dummy techs
if ei_mod.dev_mode == true then

    for _, tech in pairs(data.raw.technology) do
        if string.find(tech.name, "__dummy") then
            tech.hidden = false
        end

        if tech.name == "ei_dark-age" then
            tech.enabled = true
        end
        if tech.name == "ei_steam-age" then
            tech.enabled = true
        end
        if tech.name == "ei_electricity-age" then
            tech.enabled = true
        end
        if tech.name == "ei_computer-age" then
            tech.enabled = true
        end
        if tech.name == "ei_quantum-age" then
            tech.enabled = true
        end
        if tech.name == "ei_exotic-age" then
            tech.enabled = true
        end
    end
   
    if not ei_mod.show_dummy then
        for _, tech in pairs(data.raw.technology) do
            if string.find(tech.name, "__dummy") then
                tech.hidden = true
            end
        end
    end

end