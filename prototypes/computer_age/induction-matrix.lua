ei_data = require("lib/data")

--====================================================================================================
-- INDUCTION MATRIX
--====================================================================================================

data:extend({
    {
        name = "ei_induction-matrix-core",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-core.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_result = "ei_induction-matrix-core:1",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-core",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"lab", 4},
            {"ei_electronic-parts", 40},
            {"ei_energy-crystal", 20},
            {"ei_steel-mechanical-parts", 16}
        },
        result = "ei_induction-matrix-core",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-core",
    },
    {
        name = "ei_induction-matrix",
        type = "technology",
        icon = ei_graphics_tech_path.."grower.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-core"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-basic-coil"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-basic-solenoid"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-basic-converter"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-tile"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    -- coils
    {
        name = "ei_induction-matrix-basic-coil",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-coil.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_result = "ei_induction-matrix-basic-coil",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-coil",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"lab", 4},
            {"ei_electronic-parts", 40},
            {"ei_energy-crystal", 20},
            {"ei_steel-mechanical-parts", 16}
        },
        result = "ei_induction-matrix-basic-coil",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-coil",
    },
    {
        name = "ei_induction-matrix-basic-coil",
        type = "simple-entity",
        icon = ei_graphics_item_path.."induction-matrix-basic-coil.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-coil"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."insulated-tank.png",
            width = 512,
            height = 512,
            shift = {0,-0.2},
            scale = 0.44/5,
        },
    },

    -- solenoids
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-solenoid.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_result = "ei_induction-matrix-basic-solenoid",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"lab", 4},
            {"ei_electronic-parts", 40},
            {"ei_energy-crystal", 20},
            {"ei_steel-mechanical-parts", 16}
        },
        result = "ei_induction-matrix-basic-solenoid",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-solenoid",
    },
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "simple-entity",
        icon = ei_graphics_item_path.."induction-matrix-basic-solenoid.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-solenoid"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."burner-heater.png",
            width = 512,
            height = 512,
            shift = {0,-0.2},
            scale = 0.44/4,
        },
    },

    -- converters
    {
        name = "ei_induction-matrix-basic-converter",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-converter.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_result = "ei_induction-matrix-basic-converter",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-converter",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"lab", 4},
            {"ei_electronic-parts", 40},
            {"ei_energy-crystal", 20},
            {"ei_steel-mechanical-parts", 16}
        },
        result = "ei_induction-matrix-basic-converter",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-converter",
    },
    {
        name = "ei_induction-matrix-basic-converter",
        type = "simple-entity",
        icon = ei_graphics_item_path.."induction-matrix-basic-converter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-converter"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        picture = {
            filename = ei_graphics_entity_path.."castor.png",
            width = 512,
            height = 512,
            shift = {0,-0.2},
            scale = 0.44/5,
        },
    },
    
    -- tile
    {
        name = "ei_induction-matrix-tile",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-tile.png",
        icon_size = 64,
        subgroup = "ei_labs",
        order = "b1",
        place_as_tile =
        {
            result = "ei_induction-matrix-tile",
            condition_size = 1,
            condition = { "water-tile" }
        },
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-tile",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"lab", 4},
            {"ei_electronic-parts", 40},
            {"ei_energy-crystal", 20},
            {"ei_steel-mechanical-parts", 16}
        },
        result = "ei_induction-matrix-tile",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-tile",
    },
})


-- induction matrix cores with different out/input limits
-- with 0 converters: 1MW I/O
-- with 1 converter: 2MW I/O
-- with 2 converters: 4MW I/O
-- with 3 converters: 8MW I/O
-- with 4 converters: 16MW I/O
-- > I/O = 2^converters in MW, cap at 16 converters = 2^16 = 65.536MW

local base = {
    name = "ei_induction-matrix-core:1",
    type = "electric-energy-interface",
    icon = ei_graphics_item_path.."induction-matrix-core.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    map_color = ei_data.colors.assembler,
    minable = {mining_time = 1, result = "ei_induction-matrix-core"},
    gui_mode = "all",
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
    energy_source = {
        type = "electric",
        buffer_capacity = "1MW",
        usage_priority = "tertiary",
        input_flow_limit = "1MW",
        output_flow_limit = "1MW",
    },
}

local function make_matrix_core(i)

    local matrix = table.deepcopy(base)

    matrix.name = "ei_induction-matrix-core:"..i

    -- matrix.energy_source.buffer_capacity = (2^i).."MW"
    matrix.energy_source.input_flow_limit = (2^i).."MW"
    matrix.energy_source.output_flow_limit = (2^i).."MW"

    data:extend({matrix})
end

for i = 1, 16 do
    make_matrix_core(i)
end

-- make ground tiles
local tile = table.deepcopy(data.raw["tile"]["tutorial-grid"])
tile.name = "ei_induction-matrix-tile"
tile.minable = {mining_time = 1, result = "ei_induction-matrix-tile"}
tile.placeable_by = {item = "ei_induction-matrix-tile", count = 1}

data:extend({tile})