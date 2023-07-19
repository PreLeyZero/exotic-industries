local model = {}

--====================================================================================================
--GAIA
--====================================================================================================

local tile_settings = {
    ["grass-1"] = {frequency = 0.1, size = 1, richness = 1},
}

local entity_settings = {
    ["tree-01"] = {frequency = 0.1, size = 1, richness = 1},
}

local decorative_settings = {
    ["green-pita"] = {frequency = 0.1, size = 1, richness = 1},
}

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

        water = "none",
        starting_area = "none",
        peaceful_mode = true,

        cliff_settings = {
            name = "cliff", -- swap for custom cliffs later
            cliff_elevation_0 = 20, -- elevation of the first row of cliffs
            cliff_elevation_interval = 6, -- elevation difference between each row
            richness = 1,
        },

        default_enable_all_autoplace_controls = false,

        autoplace_settings = {
            tile = { treat_missing_as_default = false, settings = tile_settings},
            entity = { treat_missing_as_default = false, settings = entity_settings},
            decorative = { treat_missing_as_default = false, settings = decorative_settings},
        }
    })

end

--====================================================================================================
--UTIL
--====================================================================================================

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

return model