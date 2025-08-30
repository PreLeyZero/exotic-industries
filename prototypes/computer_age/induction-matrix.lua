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
        subgroup = "ei_induction-matrix",
        order = "a-a",
        place_result = "ei_induction-matrix-core__0",
        stack_size = 1
    },
    {
        name = "ei_induction-matrix-core",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="lab", amount=2},
            {type="item", name="ei_electronic-parts", amount=30},
            {type="item", name="ei_energy-crystal", amount=40},
            {type="item", name="ei_gold-plate", amount=24}
        },
        results = {{type="item", name="ei_induction-matrix-core", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-core",
    },
    {
        name = "ei_induction-matrix",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-core.png",
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
            },
            { 
                type = "nothing",
                effect_description = {"description.induction-matrix"},
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_advanced-induction-matrix",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-core.png",
        icon_size = 256,
        prerequisites = {"ei_induction-matrix", "processing-unit"},
        effects = {
            { 
                type = "nothing",
                effect_description = {"description.advanced-induction-matrix"},
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_superior-induction-matrix",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-core.png",
        icon_size = 256,
        prerequisites = {"ei_advanced-induction-matrix", "ei_odd-plating"},
        effects = {
            { 
                type = "nothing",
                effect_description = {"description.superior-induction-matrix"},
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    -- coils
    {
        name = "ei_induction-matrix-advanced-coil",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-advanced-coil.png",
        icon_size = 256,
        prerequisites = {"ei_advanced-induction-matrix"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-advanced-coil"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_induction-matrix-superior-coil",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-superior-coil.png",
        icon_size = 256,
        prerequisites = {"ei_superior-induction-matrix", "ei_magnet-data"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-superior-coil"
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
        name = "ei_induction-matrix-basic-coil",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-coil.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "coils-a",
        place_result = "ei_induction-matrix-basic-coil",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-advanced-coil",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-advanced-coil.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "coils-b",
        place_result = "ei_induction-matrix-advanced-coil",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-superior-coil",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-superior-coil.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "coils-c",
        place_result = "ei_induction-matrix-superior-coil",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-coil",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="plastic-bar", amount=10},
            {type="item", name="ei_insulated-wire", amount=40},
            {type="item", name="ei_ceramic", amount=8},
            {type="item", name="steel-plate", amount=4}
        },
        results = {{type="item", name="ei_induction-matrix-basic-coil", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-coil",
    },
    {
        name = "ei_induction-matrix-advanced-coil",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_induction-matrix-basic-coil", amount=2},
            {type="item", name="ei_insulated-wire", amount=20},
            {type="item", name="ei_energy-crystal", amount=6},
        },
        results = {{type="item", name="ei_induction-matrix-advanced-coil", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-advanced-coil",
    },
    {
        name = "ei_induction-matrix-superior-coil",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="ei_induction-matrix-advanced-coil", amount=2},
            {type="item", name="ei_magnet", amount=6},
            {type="item", name="ei_magnet-data", amount=4},
            {type="item", name="ei_odd-plating", amount=12},
            {type="item", name="ei_cryo-container-nitrogen", amount=1}
        },
        results = {{type="item", name="ei_induction-matrix-superior-coil", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-superior-coil",
    },
    {
        name = "ei_induction-matrix-basic-coil",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-basic-coil.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-coil"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-basic-coil.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16,
        },
        inventory_size = 0,
        map_color = ei_data.colors["coil"],
        fast_replaceable_group = "induction-matrix-coil",
    },
    {
        name = "ei_induction-matrix-advanced-coil",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-advanced-coil.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-advanced-coil"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-advanced-coil.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16,
        },
        inventory_size = 0,
        map_color = ei_data.colors["coil"],
        fast_replaceable_group = "induction-matrix-coil",
    },
    {
        name = "ei_induction-matrix-superior-coil",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-superior-coil.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-superior-coil"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-superior-coil.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16,
        },
        inventory_size = 0,
        map_color = ei_data.colors["coil"],
        fast_replaceable_group = "induction-matrix-coil",
    },

    -- solenoids
    --[[
    {
        name = "ei_induction-matrix-advanced-solenoid",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-advanced-solenoid.png",
        icon_size = 256,
        prerequisites = {"ei_advanced-induction-matrix"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-advanced-solenoid"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    ]]
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-solenoid.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "solenoids-a",
        place_result = "ei_induction-matrix-basic-solenoid",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-advanced-solenoid",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-advanced-solenoid.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "solenoids-b",
        place_result = "ei_induction-matrix-advanced-solenoid",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {type="item", name="ei_iron-beam", amount=10},
            {type="item", name="ei_ceramic", amount=4},
        },
        results = {{type="item", name="ei_induction-matrix-basic-solenoid", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-solenoid",
    },
    {
        name = "ei_induction-matrix-advanced-solenoid",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {type="item", name="lab", amount=4},
            {type="item", name="ei_electronic-parts", amount=40},
            {type="item", name="ei_energy-crystal", amount=20},
            {type="item", name="ei_steel-mechanical-parts", amount=16}
        },
        results = {{type="item", name="ei_induction-matrix-advanced-solenoid", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-advanced-solenoid",
    },
    {
        name = "ei_induction-matrix-basic-solenoid",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-basic-solenoid.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-solenoid"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-basic-solenoid.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16,
        },
        inventory_size = 0,
        map_color = ei_data.colors["solenoid"],
    },
    {
        name = "ei_induction-matrix-advanced-solenoid",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-advanced-solenoid.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-advanced-solenoid"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-advanced-solenoid.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16,
        },
        inventory_size = 0,
        map_color = ei_data.colors["solenoid"],
    },

    -- converters
    {
        name = "ei_induction-matrix-advanced-converter",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-advanced-converter.png",
        icon_size = 256,
        prerequisites = {"ei_advanced-induction-matrix"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-advanced-converter"
            }
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_induction-matrix-superior-converter",
        type = "technology",
        icon = ei_graphics_tech_path.."induction-matrix-superior-converter.png",
        icon_size = 256,
        prerequisites = {"ei_superior-induction-matrix"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_induction-matrix-superior-converter"
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
        name = "ei_induction-matrix-basic-converter",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-basic-converter.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "converters-a",
        place_result = "ei_induction-matrix-basic-converter",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-advanced-converter",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-advanced-converter.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "converters-b",
        place_result = "ei_induction-matrix-advanced-converter",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-superior-converter",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-superior-converter.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "converters-c",
        place_result = "ei_induction-matrix-superior-converter",
        stack_size = 50
    },
    {
        name = "ei_induction-matrix-basic-converter",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_electronic-parts", amount=10},
            {type="item", name="ei_energy-crystal", amount=6},
            {type="item", name="battery", amount=16}
        },
        results = {{type="item", name="ei_induction-matrix-basic-converter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-basic-converter",
    },
    {
        name = "ei_induction-matrix-advanced-converter",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="ei_induction-matrix-basic-converter", amount=4},
            {type="item", name="processing-unit", amount=10},
            {type="item", name="ei_high-energy-crystal", amount=20},
            {type="item", name="ei_lithium-crystal", amount=6},
        },
        results = {{type="item", name="ei_induction-matrix-advanced-converter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-advanced-converter",
    },
    {
        name = "ei_induction-matrix-superior-converter",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_induction-matrix-advanced-converter", amount=4},
            {type="item", name="ei_superior-data", amount=20},
            {type="item", name="ei_odd-plating", amount=100},
            {type="item", name="ei_carbon-structure", amount=40},
            {type="item", name="ei_rocket-control-unit", amount=10},
        },
        results = {{type="item", name="ei_induction-matrix-superior-converter", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_induction-matrix-superior-converter",
    },
    {
        name = "ei_induction-matrix-basic-converter",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-basic-converter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-basic-converter"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-basic-converter.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16*2,
        },
        inventory_size = 0,
        map_color = ei_data.colors["converter"],
        fast_replaceable_group = "induction-matrix-converter",
    },
    {
        name = "ei_induction-matrix-advanced-converter",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-advanced-converter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-advanced-converter"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-advanced-converter.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16*2,
        },
        inventory_size = 0,
        map_color = ei_data.colors["converter"],
        fast_replaceable_group = "induction-matrix-converter",
    },
    {
        name = "ei_induction-matrix-superior-converter",
        type = "container",
        icon = ei_graphics_item_path.."induction-matrix-superior-converter.png",
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 1, result = "ei_induction-matrix-superior-converter"},
        max_health = 100,
        corpse = "small-remnants",
        collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
        selection_box = {{-1, -1}, {1, 1}},
        picture = {
            filename = ei_graphics_entity_path.."induction-matrix-superior-converter.png",
            width = 256,
            height = 256,
            shift = {0, 0},
            scale = 0.16*2,
        },
        inventory_size = 0,
        map_color = ei_data.colors["converter"],
        fast_replaceable_group = "induction-matrix-converter",
    },
    
    -- tile
    {
        name = "ei_induction-matrix-tile",
        type = "item",
        icon = ei_graphics_item_path.."induction-matrix-tile.png",
        icon_size = 64,
        subgroup = "ei_induction-matrix",
        order = "a",
        place_as_tile =
        {
            result = "ei_induction-matrix-tile",
            condition_size = 1,
            condition = {layers={water_tile=true}}
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
            {type="item", name="concrete", amount=4},
            {type="item", name="ei_electronic-parts", amount=2},
        },
        results = {{type="item", name="ei_induction-matrix-tile", amount=1}},
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
    name = "ei_induction-matrix-core__1",
    type = "electric-energy-interface",
    icon = ei_graphics_item_path.."induction-matrix-core.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable"},
    max_health = 300,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selection_box = {{-1, -1}, {1, 1}},
    map_color = ei_data.colors.assembler,
    minable = {mining_time = 1, result = "ei_induction-matrix-core"},
    gui_mode = "all",
    animation = {
        filename = ei_graphics_entity_path.."induction-matrix-core_animation.png",
        width = 256,
        height = 256,
        shift = {0, -0.3},
        scale = 0.16*2,
        line_length = 4,
        lines_per_file = 4,
        frame_count = 16,
        animation_speed = 0.3,
    },
    continuous_animation = true,
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

    matrix.name = "ei_induction-matrix-core__"..i

    -- matrix.energy_source.buffer_capacity = (2^i).."MW"
    matrix.energy_source.input_flow_limit = (2^i).."MW"
    matrix.energy_source.output_flow_limit = (2^i).."MW"

    data:extend({matrix})
end

for i = 0, 16 do
    make_matrix_core(i)
end

-- make ground tiles
local tile = table.deepcopy(data.raw["tile"]["tutorial-grid"])
tile.name = "ei_induction-matrix-tile"
tile.minable = {mining_time = 1, result = "ei_induction-matrix-tile"}
tile.placeable_by = {item = "ei_induction-matrix-tile", count = 1}
tile.layer = 70

data:extend({tile})