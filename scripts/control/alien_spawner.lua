
local model = {}

local presets = require("lib/spawner_presets")

--====================================================================================================
--ALIEN SPAWNER
--====================================================================================================

model.allowed_surfaces = {
    ["nauvis"] = true,
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
}

--SPAWNERS
------------------------------------------------------------------------------------------------------

function model.spawn_tiles(preset, surface, pos)
    -- pos is the center of the preset

end


function model.spawn_entities(preset, surface, pos)
    -- pos is the center of the preset
    -- loop over all entities in the preset and spawn them using the given position

    for _, entity in ipairs(preset.structure) do
        local entity_position = {
            ["x"] = pos.x + entity.position["x"],
            ["y"] = pos.y + entity.position["y"]
        }

        -- check if entity can be spawned
        if not surface.can_place_entity({
            name = entity.name,
            position = entity_position,
            force = "neutral"
        }) then
            goto continue
        end

        if model.forbidden_entities[entity.name] then
            goto continue
        end

        -- get tile underneath entity if it includes water continue
        local tile = surface.get_tile(entity_position)
        if string.find(tile.name, "water") then
            goto continue
        end

        local spawned_entity = surface.create_entity({
            name = entity.name,
            position = entity_position,
            force = "neutral"
        })

        local destructible = entity.destructible or true
        spawned_entity.destructible = destructible

        spawned_entity.active = true

        ::continue::
    end
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


function model.spawn_preset(preset, surface, pos)
    
    if presets.entity_presets[preset] then
        tile_preset = model.spawn_entities(presets.entity_presets[preset], surface, pos)

        if tile_preset then
            model.spawn_tiles(tile_preset, surface, pos)
        end
    end

end


--PRESET SELECTION AND QUEING
------------------------------------------------------------------------------------------------------

function model.que_preset(pos, surface, tick)

    local min_range = 320
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

    if rarity < 85 then
        -- common
        preset = model.select_preset("common")
    elseif rarity < 95 then
        -- rare
        preset = model.select_preset("rare")
    elseif rarity < 100 then
        -- very rare
        preset = model.select_preset("very rare")
    else
        -- legendary
        preset = model.select_preset("legendary")
    end

    if not global.ei.spawner_queue then
        global.ei.spawner_queue = {}
    end

    if preset == nil then
        return
    end

    -- que the preset to spawn
    table.insert(global.ei.spawner_queue, {
        ["tick"] = tick,
        ["preset"] = preset,
        ["pos"] = pos,
        ["surface"] = surface 
    })

end


function model.select_preset(rarity)
    -- for given rarity make a list of all presets that match the rarity
    -- select a random preset from the list

    local preset_list = {}

    for preset_name, preset in pairs(presets.entity_presets) do
        if preset.rarity == rarity then
            table.insert(preset_list, preset_name)
        end
    end

    if #preset_list == 0 then
        return nil
    end

    local rand = math.random(1, #preset_list)

    return preset_list[rand]

end


function model.update()

    local tick = game.tick

    if not global.ei.spawner_queue then
        return
    end

    for i, spawner in ipairs(global.ei.spawner_queue) do
        if tick >= spawner.tick then
            -- spawn the preset
            model.spawn_preset(spawner.preset, spawner.surface, spawner.pos)

            -- remove the spawner from the queue
            table.remove(global.ei.spawner_queue, i)
        end
    end

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


function model.on_player_selected_area(event)
    if event.item == "ei_spawner-tool" then
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


return model