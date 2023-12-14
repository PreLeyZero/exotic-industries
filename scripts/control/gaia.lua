local model = {}

--====================================================================================================
--GAIA
--====================================================================================================

local tile_settings = {
}

local entity_settings = {
    ["tree-01"] = {frequency = 0, size = 0, richness = 0},
    ["tree-02"] = {frequency = 0, size = 0, richness = 0},
    ["tree-05"] = {frequency = 0, size = 0, richness = 0},
    ["tree-09"] = {frequency = 0, size = 0, richness = 0},
}

local decorative_settings = {
    ["green-pita"] = {frequency = 0.1, size = 1, richness = 1},
}

-- buildings that will get destroyed on gaia
model.destroy_gaia = {
    ["offshore-pump"] = true,
}

-- buildings that will get destroyed on non gaia
model.destroy_non_gaia = {
    ["ei_gaia-pmup"] = true,
    ["ei_bio-chamber"] = true,
    ["ei_bio-reactor"] = true,
}

local presets = require("lib/spawner_presets")

--====================================================================================================
--SURFACE CREATION
--====================================================================================================

--CREATE GAIA SURFACE
------------------------------------------------------------------------------------------------------

function model.create_gaia()

    -- check if the surface already exists
    if game.surfaces["gaia"] then
        return
    end
    
    -- create the surface
    local gaia = game.create_surface("gaia", {

        terrain_segmentation = 2,
        water = 20,
        starting_area = "none",
        peaceful_mode = true,

        cliff_settings = {
            name = "cliff", -- swap for custom cliffs later
            cliff_elevation_0 = 10, -- elevation of the first row of cliffs
            cliff_elevation_interval = 5, -- elevation difference between each row
            richness = 3,
        },

        autoplace_controls = {
            -- on gaia no iron, copper, coal, lead, uranium, neodym
            ["iron-ore"] = {frequency = 0, size = 0, richness = 0},
            ["copper-ore"] = {frequency = 0, size = 0, richness = 0},
            ["coal"] = {frequency = 0, size = 0, richness = 0},

            -- veins
            ["ei_coal-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_copper-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_iron-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_lead-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_neodym-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_gold-patch"] = {frequency = 0, size = 0, richness = 0},
            ["ei_uranium-patch"] = {frequency = 0, size = 0, richness = 0},

            -- ["ei_core-patch"] = {frequency = 200, size = 2, richness = 1},
            ["ei_phytogas-patch"] = {frequency = 400, size = 1, richness = 1},
            ["ei_cryoflux-patch"] = {frequency = 400, size = 1, richness = 1},
            ["ei_ammonia-patch"] = {frequency = 200, size = 1, richness = 1},
            ["ei_dirty-water-patch"] = {frequency = 800, size = 1, richness = 1},
            ["ei_coal-gas-patch"] = {frequency = 400, size = 1, richness = 1},
        },

        default_enable_all_autoplace_controls = true,

        autoplace_settings = {
            tile = { treat_missing_as_default = true, settings = tile_settings},
            entity = { treat_missing_as_default = true, settings = entity_settings},
            decorative = { treat_missing_as_default = true, settings = decorative_settings},
        },

        property_expression_names = {
            enemy_base_probability = 0,

            -- make gaia high in plant life
            ["control-setting:moisture:bias"] = 0.7,
            --["control-setting:temperature:bias"] = 0.8,
            ["control-setting:moisture:frequency:multiplier"] = -10,
        },
    })

    -- generate chunks around starting pos
    gaia.request_to_generate_chunks({0,0}, 5)

    -- create initial gaia base

    -- que the preset to spawn
    table.insert(global.ei.spawner_queue, {
        ["tick"] = game.tick + 120,
        ["preset"] = "gaia-station",
        ["pos"] = {["x"] = 0, ["y"] = 0},
        ["surface"] = gaia,
        ["tiles"] = false 
    })

end

--====================================================================================================
--UTIL
--====================================================================================================

function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end

--NON GAIA BUILDING DESTRUCTION
------------------------------------------------------------------------------------------------------

function model.destroy_building(entity)

    local destroy_gaia = model.destroy_gaia
    local destroy_non_gaia = model.destroy_non_gaia
    local surface = entity.surface

    if destroy_gaia[entity.name] then

        if surface.name == "gaia" then

            -- create flying text
            surface.create_entity({
                name = "flying-text",
                position = entity.position,
                text = "Can't build on Gaia!",
                color = {r=1, g=0, b=0}
            })
            entity.destroy()
            return
        end

    end

    if destroy_non_gaia[entity.name] then

        if surface.name ~= "gaia" then

            -- create flying text
            surface.create_entity({
                name = "flying-text",
                position = entity.position,
                text = "Can only be built on Gaia!",
                color = {r=1, g=0, b=0}
            })
            entity.destroy()
            return
        end

    end
end

--DEV COMMANDS
------------------------------------------------------------------------------------------------------

-- give the player the spawner tool, when creating a new player
function model.spawn_command(event)

    if not event.player_index then
        return
    end

    local player = game.get_player(event.player_index)
    
    if event.command == "gaia" then
        game.print("Spawning Gaia")

        model.create_gaia()
        player.teleport({0,0}, "gaia")
    end
    
end

--====================================================================================================
--HANDLERS
--====================================================================================================

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.destroy_building(entity)

end

return model