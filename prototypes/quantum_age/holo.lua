ei_data = require("lib/data")

--====================================================================================================
--HOLO
--====================================================================================================

local blank = {
    ["category"] = {
        name = "ei_holo-moon",
        type = "recipe-category",
    },

    ["item"] = {
        name = "ei_holo-moon",
        type = "item",
        icon = ei_graphics_destination_path.."moon.png",
        icon_size = 128,
        subgroup = "ei_holo",
        order = "a",
        place_result = "ei_holo-moon",
        stack_size = 10
    },

    ["recipe"] = {
        name = "ei_holo-moon",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="small-lamp", amount=2},
            {type="item", name="ei_energy-crystal", amount=2},
        },
        results = {{type="item", name="ei_holo-moon", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_holo-moon",
    },

    ["entity"] = {
        name = "ei_holo-moon",
        type = "assembling-machine",
        circuit_wire_max_distance = 9,
        icon = ei_graphics_destination_path.."moon.png",
        icon_size = 128,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {
            mining_time = 1,
            result = "ei_holo-moon"
        },
        max_health = 300,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        map_color = ei_data.colors.assembler,
        fixed_recipe = "ei_holo-moon__running",
        crafting_categories = {"ei_holo-moon"},
        crafting_speed = 1,
        energy_source = {
            type = 'electric',
            usage_priority = 'secondary-input',
        },
        energy_usage = "100kW",
        graphics_set = {
            animation = {
                filename = ei_graphics_entity_path.."holo-base.png",
                size = {83,70},
                shift = {0, 0},
    	        scale = 1,
                line_length = 1,
                --lines_per_file = 2,
                frame_count = 1,
                -- animation_speed = 0.2,
            },
            working_visualisations = {
                {
                  animation = 
                  {
                    filename = ei_graphics_destination_path.."moon_animation.png",
                    size = {128,128},
                    shift = {0, -1.3},
    	            scale = 0.65,
                    line_length = 8,
                    lines_per_file = 8,
                    frame_count = 64,
                    animation_speed = 0.5,
                    run_mode = "forward",
                  }
                }
            },
        },
    },

    ["running"] = {
        name = "ei_holo-moon__running",
        type = "recipe",
        category = "ei_holo-moon",
        energy_required = 1000,
        ingredients = {},
        results = {},
        enabled = false,
        hidden = true,
        icon = ei_graphics_other_path.."64_empty.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b4",
    },
}

-- table.insert(data.raw["technology"]["ei_moon-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-moon"})

local function make_holo(dest, icon_size, ani_size, lenght, scale)

    local holo = table.deepcopy(blank)

    holo.category.name = "ei_holo-"..dest

    holo.item.name = "ei_holo-"..dest
    holo.item.icon = ei_graphics_destination_path..dest..".png"
    holo.item.icon_size = icon_size
    holo.item.place_result = "ei_holo-"..dest

    holo.recipe.name = "ei_holo-"..dest
    holo.recipe.results = {{type="item", name="ei_holo-"..dest, amount=1}}
    holo.recipe.main_product = "ei_holo-"..dest

    holo.entity.name = "ei_holo-"..dest
    holo.entity.icon = ei_graphics_destination_path..dest..".png"
    holo.entity.icon_size = icon_size
    holo.entity.minable.result = "ei_holo-"..dest
    holo.entity.fixed_recipe = "ei_holo-"..dest.."__running"
    holo.entity.crafting_categories = {"ei_holo-"..dest}
    holo.entity.graphics_set.working_visualisations[1].animation.filename = ei_graphics_destination_path..dest.."_animation.png"
    holo.entity.graphics_set.working_visualisations[1].animation.size = {ani_size,ani_size}
    holo.entity.graphics_set.working_visualisations[1].animation.line_length = lenght
    holo.entity.graphics_set.working_visualisations[1].animation.lines_per_file = lenght
    holo.entity.graphics_set.working_visualisations[1].animation.frame_count = lenght*lenght
    holo.entity.graphics_set.working_visualisations[1].animation.scale = holo.entity.graphics_set.working_visualisations[1].animation.scale * scale

    holo.running.name = "ei_holo-"..dest.."__running"
    holo.running.category = "ei_holo-"..dest

    data:extend({holo.category, holo.item, holo.recipe, holo.entity, holo.running})
end

make_holo("moon", 128, 128, 8, 1)
table.insert(data.raw["technology"]["ei_moon-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-moon"})
make_holo("mars", 128, 128, 8, 1)
table.insert(data.raw["technology"]["ei_mars-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-mars"})
make_holo("sulf", 128, 128, 8, 1)
table.insert(data.raw["technology"]["ei_sulf-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-sulf"})
make_holo("uran", 128, 128, 8, 1)
table.insert(data.raw["technology"]["ei_uran-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-uran"})
make_holo("gas-giant", 256, 384, 8, 0.5)
table.insert(data.raw["technology"]["ei_gas-giant-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-gas-giant"})
make_holo("nauvis-orbit", 128, 128, 8, 1)
table.insert(data.raw["technology"]["rocket-silo"].effects, {type = "unlock-recipe", recipe = "ei_holo-nauvis-orbit"})
make_holo("sun", 128, 256, 8, 0.7)
table.insert(data.raw["technology"]["ei_sun-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-sun"})
make_holo("asteroid", 128, 128, 1, 1)
table.insert(data.raw["technology"]["ei_asteroid-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-asteroid"})
make_holo("black-hole", 256, 256, 8, 0.7)
table.insert(data.raw["technology"]["ei_black-hole-exploration"].effects, {type = "unlock-recipe", recipe = "ei_holo-black-hole"})
make_holo("galaxy", 128, 128, 8, 1.2)

