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
        name = "ei_insulated-tank",
        type = "item",
        icon = ei_graphics_item_path.."insulated-tank.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "storage",
        order = "c-a",
        place_result = "ei_insulated-tank",
        stack_size = 50
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
        name = "ei_insulated-tank",
        type = "recipe",
        category = "crafting",
        energy_required = 1,
        ingredients =
        {
            {"ei_insulated-pipe", 20},
            {"steel-plate", 10},
            {"ei_lead-plate", 20},
            {"plastic-bar", 40},
        },
        result = "ei_insulated-tank",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_insulated-tank",
    },
    {
        name = "ei_insulated-tank",
        type = "storage-tank",
        icon = ei_graphics_item_path.."insulated-tank.png",
        icon_size = 64,
        flags = {"player-creation","placeable-neutral","not-upgradable"},
        max_health = 500,
        corpse = "big-remnants",
        collision_box = {{-1.4,-1.4},{1.4,1.4}},
        selection_box = {{-1.5,-1.5},{1.5,1.5}},
        map_color = ei_data.colors.assembler,
        minable = {
            mining_time = 1,
            result = "ei_insulated-tank",
        },
        circuit_wire_connection_points = circuit_connector_definitions["storage-tank"].points,
		circuit_connector_sprites = circuit_connector_definitions["storage-tank"].sprites,
		circuit_wire_max_distance = 20,
        flow_length_in_ticks = 1,
        window_bounding_box = {{0,0},{1,1}},
        pictures = {
            picture = {
                filename = ei_graphics_entity_path.."insulated-tank.png",
                width = 512,
                height = 512,
                shift = {0,-0.2},
	            scale = 0.44/2,
            },
            window_background = {
                filename = ei_graphics_other_path.."64_empty.png",
                width = 64,
                height = 64,
                scale = 1,
            },
            fluid_background = {
                filename = ei_graphics_other_path.."64_empty.png",
                width = 64,
                height = 64,
                scale = 1,
            },
            flow_sprite = {
                filename = ei_graphics_other_path.."64_empty.png",
                width = 64,
                height = 64,
                scale = 1,
            },
            gas_flow = {
                filename = ei_graphics_other_path.."64_empty.png",
                width = 64,
                height = 64,
                scale = 1,
                line_length = 1,
                frame_count = 1,
                animation_speed = 1,
            }
        },
        fluid_box = {   
            base_area = 20,
            base_level = 0,
            height = 1,
            pipe_covers = pipecoverspictures(),
            pipe_picture = ei_pipe_insulated_tank,
            pipe_connections = {
                {type = "input-output", position = {2, 0}},
                {type = "input-output", position = {-2, 0}},
                {type = "input-output", position = {0, 2}},
                {type = "input-output", position = {0, -2}},
            },
            production_type = "input-output",
            filter = "ei_liquid-nitrogen",
        },
    }
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
