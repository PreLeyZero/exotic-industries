
local model = {}

local presets = require("lib/spawner_presets")

--====================================================================================================
--ALIEN SPAWNER
--====================================================================================================

model.allowed_surfaces = {
    ["nauvis"] = true,
    ["gaia"] = true
}

model.forbidden_entities = {
    ["spidertron-leg-1"] = true,
    ["spidertron-leg-2"] = true,
    ["spidertron-leg-3"] = true,
    ["spidertron-leg-4"] = true,
    ["spidertron-leg-5"] = true,
    ["spidertron-leg-6"] = true,
    ["spidertron-leg-7"] = true,
    ["spidertron-leg-8"] = true,
    ["teleporter-flying-text"] = true,
}

model.flower_counter_warnings = {
    [3] = {"exotic-industries.flower-count-3"},
    [5] = {"exotic-industries.flower-count-5"},
    [7] = {"exotic-industries.flower-count-7"},
    [10] = {"exotic-industries.flower-count-10"},
}

--FLOWER GUARDIAN
------------------------------------------------------------------------------------------------------

function model.count_flowers(entity)
    -- if entity name conatains "alien-flower" increase count
    if not storage.ei.flower_counter then
        storage.ei.flower_counter = 0
    end

    -- dont count on gaia
    if entity.surface.name == "gaia" then
        return
    end

    if string.find(entity.name, "alien") then

        if string.find(entity.name, "flower") then
            storage.ei.flower_counter = storage.ei.flower_counter + 1
        else
            return
        end

    else
        return
    end

    if model.flower_counter_warnings[storage.ei.flower_counter] then
        local rand = math.random(1, 10)
        if rand > 4 then
            -- spawn floating text
            rendering.draw_text{
                target = entity,
                text = model.flower_counter_warnings[storage.ei.flower_counter],
                color = {r=1, g=0.5, b=0.5},
                surface = entity.surface,
                scale = 1,
                time_to_live = 120
            }
        end
    end

    if storage.ei.flower_counter == 12 then
        -- spawn text
        rendering.draw_text{
            target = entity,
            text = {"exotic-industries.flower-count-12"},
            color = {r=1, g=0.2, b=0.2},
            surface = entity.surface,
            scale = 1,
            time_to_live = 120
        }
        storage.ei.flower_counter = 0

        model.spawn_guardian(entity.surface, entity.position)
    end

end


function model.spawn_guardian(surface, pos)
    -- spawn a worm or group of worms at the given position
    -- according to the current evolution factor

    -- dont spawn on gaia
    if surface.name == "gaia" then
        return
    end

    local evolution_factor = game.forces["enemy"].get_evolution_factor(surface)

    local worm_name = "small-worm-turret"
    local biter_name = "small-biter"
    if evolution_factor > 0.5 then
        worm_name = "medium-worm-turret"
        biter_name = "medium-biter"
    elseif evolution_factor > 0.75 then
        worm_name = "big-worm-turret"
        biter_name = "big-biter"
    elseif evolution_factor > 0.9 then
        worm_name = "behemoth-worm-turret"
        biter_name = "behemoth-biter"
    end

    local worm_positions = {
        {["x"] = pos.x, ["y"] = pos.y}
    }

    local rand = math.random(1, 100)
    if rand > 50 then
        -- spawn a group of 3 worms around the given position
        table.insert(worm_positions, {["x"] = pos.x - 2, ["y"] = pos.y - 2})
        table.insert(worm_positions, {["x"] = pos.x + 3, ["y"] = pos.y + 2})
    end

    if rand > 90 then
        -- spawn 2 more worms
        table.insert(worm_positions, {["x"] = pos.x - 4, ["y"] = pos.y + 2})
        table.insert(worm_positions, {["x"] = pos.x + 2, ["y"] = pos.y - 3})
    end

    for _, worm_pos in ipairs(worm_positions) do
        -- create huge blood explotions
        surface.create_entity{
            name = "blood-explosion-huge",
            position = worm_pos
        }

        -- spawn worm
        surface.create_entity{
            name = worm_name,
            position = worm_pos,
            force = "enemy"
        }
    end

    -- also get all huge rocks in the area, and turn them into biters

    rocks = surface.find_entities_filtered{
        area = {
            {pos.x - 30, pos.y - 30},
            {pos.x + 30, pos.y + 30}
        },
        name = "huge-rock"
    }

    for _, rock in ipairs(rocks) do
        local pos = rock.position

        rock.destroy()
        
        -- create huge blood explotions
        surface.create_entity{
            name = "blood-explosion-huge",
            position = pos
        }

        -- spawn biter
        surface.create_entity{
            name = biter_name,
            position = pos,
            force = "enemy"
        }

    end

end


--SPAWNERS
------------------------------------------------------------------------------------------------------

function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true

end


function model.spawn_tiles(preset, surface, pos)
    -- pos is the center of the preset

    if not preset.tiles then
        return
    end

    local tiles = preset.tiles
    local new_tiles = {}
    
    -- correct tile positions by pos
    for i, tile in ipairs(tiles) do

        new_tiles[i] = {
            ["name"] = tile.name,
            ["position"] = {
                ["x"] = tile.position["x"] + pos.x,
                ["y"] = tile.position["y"] + pos.y
            }
        }

       -- get area around tile
        local area = {
            {new_tiles[i].position["x"] - 1, new_tiles[i].position["y"] - 1},
            {new_tiles[i].position["x"] + 1, new_tiles[i].position["y"] + 1}
        }

        -- get entities in area
        local entities = surface.find_entities(area)

        -- destroy entities
        for _, entity in ipairs(entities) do
            entity.destroy()
        end

    end

    -- set tiles
    surface.set_tiles(new_tiles)

end


function model.prepare_entities(preset, surface, pos)
    -- remove colliding entities and place tiles underneath each entitypos

    for _, entity in ipairs(preset.structure) do
        local entity_position = {
            ["x"] = pos.x + entity.position["x"],
            ["y"] = pos.y + entity.position["y"]
        }

        -- are there colliding entities?
        local entities = surface.find_entities_filtered({
            position = entity_position,
            radius = 0.5,
            type = {"tree", "cliff", "resource", "simple-entity"},
        })
        -- destroy them
        for _, entity in ipairs(entities) do
            if model.entity_check(entity) then
                entity.destroy()
            end
        end 

    end

end


function model.spawn_entities(preset, surface, pos)
    -- pos is the center of the preset
    -- loop over all entities in the preset and spawn them using the given position

    if not preset.structure then
        return
    end

    force = "neutral"

    if preset.force then
        force = preset.force
    end

    model.prepare_entities(preset, surface, pos)

    for _, entity in ipairs(preset.structure) do
        local entity_position = {
            ["x"] = pos.x + entity.position["x"],
            ["y"] = pos.y + entity.position["y"]
        }

        if model.forbidden_entities[entity.name] then
            goto continue
        end

        -- check if entity can be spawned
        if not surface.can_place_entity({
            name = entity.name,
            position = entity_position,
            force = force
        }) then
            goto continue
        end

        -- get tile underneath entity if it includes water continue
        local tile = surface.get_tile(entity_position)

        -- if tile is invalid continue
        if not tile.valid then
            goto continue
        end

        if string.find(tile.name, "water") then
            goto continue
        end

        local spawned_entity = surface.create_entity({
            name = entity.name,
            position = entity_position,
            force = force,
            raise_built = true
        })

        local destructible = entity.destructible or true

        if spawned_entity == nil then
            goto continue
        end
        
        spawned_entity.destructible = destructible

        spawned_entity.active = true

        ::continue::
    end
    
    -- spawn a artifact flag entity to mark the artifact as spawned
    local flag = surface.create_entity({
        name = "ei_artifact-flag",
        position = pos,
        force = force,
    })

end


function model.get_spawn_position(area)

    local middle_point = {
        ["x"] = area.left_top.x + (area.right_bottom.x - area.left_top.x) / 2,
        ["y"] = area.left_top.y + (area.right_bottom.y - area.left_top.y) / 2
    }

    -- add some randomness to the spawn position
    local random_point = {
        ["x"] = middle_point.x + math.random(-32, 32),
        ["y"] = middle_point.y + math.random(-32, 32)
    }

    return random_point
end


function model.spawn_preset(preset, surface, pos, tiles, tick, old_index)
    
    if presets.entity_presets[preset] then

        if tiles then
            model.spawn_tiles(presets.entity_presets[preset], surface, pos)

            -- remove the spawner from the queue
            table.remove(storage.ei.spawner_queue, old_index)

            -- and que the entity spawn
            table.insert(storage.ei.spawner_queue, {
                ["tick"] = tick+1,
                ["preset"] = preset,
                ["pos"] = pos,
                ["surface"] = surface,
                ["tiles"] = false 
            })
        else
            model.spawn_entities(presets.entity_presets[preset], surface, pos)

            -- remove the spawner from the queue
            table.remove(storage.ei.spawner_queue, old_index)
        end
    end

end


--PRESET SELECTION AND QUEING
------------------------------------------------------------------------------------------------------

function model.que_preset(pos, surface, tick)

    local min_range = 500
    local legendary_range = 900
    local min_artifact_distance = 200
    local treshold = 96
    local rand = math.random(1, 100)

    if rand < treshold then
        return
    end

    -- check if the pos is outside the min_range of the spawn
    -- spawn alwyas in the middle of the map at (0, 0)
    if math.sqrt(pos.x^2 + pos.y^2) < min_range then
        return
    end

    -- select a entity preset to spawn
    -- rarity:
    -- 70 = common, 80 = rare, 90 = very rare, 100 = legendary
    -- create random number between 1 and 100 and

    local rarity = math.random(1, 100)
    local preset = nil

    if rarity < 65 then
        -- common
        preset = model.select_preset("common")
    elseif rarity < 92 then
        -- rare
        preset = model.select_preset("rare")
    elseif rarity < 100 then
        -- very rare
        preset = model.select_preset("very rare")
    else
        -- legendary

        -- game.print("legendary spawned")

        -- only spawn each legendary once per game
        -- and only spawn if range is bigger then legendary range

        if math.sqrt(pos.x^2 + pos.y^2) < legendary_range then
            return
        end

        preset = model.select_preset("legendary")
    end

    if not storage.ei.spawner_queue then
        storage.ei.spawner_queue = {}
    end

    if preset == nil then
        return
    end

    -- check if a artifact is already in the area
    local flags = surface.find_entities_filtered({
        position = pos,
        radius = min_artifact_distance,
        name = "ei_artifact-flag"
    })

    if flags[1] then
        return
    end

    -- que the preset to spawn
    table.insert(storage.ei.spawner_queue, {
        ["tick"] = tick,
        ["preset"] = preset,
        ["pos"] = pos,
        ["surface"] = surface,
        ["tiles"] = true 
    })

end


function model.select_preset(rarity)
    -- for given rarity make a list of all presets that match the rarity
    -- select a random preset from the list

    if not storage.ei.legendary_spawns then
        storage.ei.legendary_spawns = {}
    end

    local preset_list = {}

    for preset_name, preset in pairs(presets.entity_presets) do
        if preset.rarity == rarity then

            if preset.mod then
                if not script.active_mods[preset.mod] then
                    goto continue
                end
            end

            if rarity == "legendary" then
                if storage.ei.legendary_spawns[preset_name] then
                    goto continue
                end
            end

            table.insert(preset_list, preset_name)
        end

        ::continue::
    end

    if #preset_list == 0 then
        return nil
    end

    local rand = math.random(1, #preset_list)

    return preset_list[rand]

end


--IMPORT TOOL 
------------------------------------------------------------------------------------------------------

-- give the player the spawner tool, when creating a new player
function model.give_tool(event)

    if not event.player_index then
        return
    end

    local player = game.get_player(event.player_index)
    
    if event.command == "etool" then
        player.insert({name = "ei_spawner-tool", count = 1})
    end

    if event.command == "etool2" then
        player.insert({name = "ei_tile-tool", count = 1})
    end
    
end


function model.dump(o)

    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. model.dump(v) .. ','
       end
       return s .. '} '
    else
        if type(o) == "string" then
            return '"' .. o .. '"'
        else
            return tostring(o)
        end
    end

end
 

function model.entity_select(event)

    local area = event.area
    local entities = event.entities

    -- make a spawner preset out of the selected entities
    local preset = {}

    for _, entity in pairs(entities) do
        local entity_position = {
            ["x"] = entity.position.x - area.left_top.x,
            ["y"] = entity.position.y - area.left_top.y
        }

        local entity_data = {
            ["name"] = entity.name,
            ["position"] = entity_position,
            ["destructible"] = entity.destructible
        }

        table.insert(preset, entity_data)
    end

    -- make a txt file with the preset data in lua format
    game.write_file("spawner_preset.txt", model.dump(preset))

end


function model.tile_select(event)

    local area = event.area
    
    -- get all tiles in the area
    local tiles = event.surface.find_tiles_filtered{area = area}

    -- tiles is array of selected tiles -> make a preset out of it
    -- prest: { {"position" = pos, "name" = tile_name} }

    local preset = {}

    for i,tile in ipairs(tiles) do

        game.print(tile.name)

        -- exclude lab tiles
        if tile.name == "lab-dark-1" or tile.name == "lab-dark-2" then
            goto continue
        end

        local tile_position = {
            ["x"] = tile.position.x - area.left_top.x,
            ["y"] = tile.position.y - area.left_top.y
        }

        local tile_data = {
            ["name"] = tile.name,
            ["position"] = tile_position
        }

        table.insert(preset, tile_data)

        ::continue::

    end

    -- make a txt file with the preset data in lua format
    game.write_file("tile_preset.txt", model.dump(preset))

end


function model.on_player_selected_area(event)
    if event.item == "ei_spawner-tool" then
        model.entity_select(event)
    end

    if event.item == "ei_tile-tool" then
        model.tile_select(event)

        model.entity_select(event)
    end

end


--HANDLERS 
------------------------------------------------------------------------------------------------------

function model.on_chunk_generated(event)
    
    if not model.allowed_surfaces[event.surface.name] then
        return
    end

    local pos = model.get_spawn_position(event.area)
    local surface = event.surface


    -- select a preset and que it for spawning in the next tick
    local tick = event.tick + 1

    model.que_preset(pos, surface, tick)

end


function model.update()

    local tick = game.tick

    if not storage.ei.spawner_queue then
        return
    end

    for i, spawner in ipairs(storage.ei.spawner_queue) do
        if tick >= spawner.tick then
            -- spawn the preset
            model.spawn_preset(spawner.preset, spawner.surface, spawner.pos, spawner.tiles, tick, i)

            -- if the preset is legendary, mark it as spawned
            if presets.entity_presets[spawner.preset].rarity == "legendary" then
                if spawner.tiles == false then
                    storage.ei.legendary_spawns[spawner.preset] = true
                end
            end
        end

        -- remove all spawners that are older than 10 ticks
        if tick - spawner.tick > 10 then
            table.remove(storage.ei.spawner_queue, i)
        end
    end

end


function model.on_destroyed_entity(entity)

    model.count_flowers(entity)

    if entity.name == "ei_alien-stabilizer" then
        -- only spawn guardian if the beacons was not placed by the player
        if entity.last_user == nil then
            model.spawn_guardian(entity.surface, entity.position)
        end
    end

    if entity.name == "ei_alien-beacon" then
        -- only spawn guardian if the beacons was not placed by the player
        if entity.last_user == nil then
            model.spawn_guardian(entity.surface, entity.position)
        end
    end

    if entity.name == "ei_crystal-accumulator" then
        -- only spawn guardian if the beacons was not placed by the player
        if entity.last_user == nil then
            model.spawn_guardian(entity.surface, entity.position)
        end
    end

    if entity.name == "ei_farstation" then
        -- only spawn guardian if the beacons was not placed by the player
        if entity.last_user == nil then
            model.spawn_guardian(entity.surface, entity.position)
        end
    end

end

return model