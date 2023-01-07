
local model = {}

local presets = require("lib/spawner_presets")

--====================================================================================================
--ALIEN SPAWNER
--====================================================================================================

model.allowed_surfaces = {
    ["nauvis"] = true,
}

--UTIL
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


        local spawned_entity = surface.create_entity({
            name = entity.name,
            position = entity_position,
            force = "neutral"
        })

        local destructible = entity.destructible or true
        spawned_entity.destructible = destructible

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

    model.spawn_preset("beacon-site_small-1", surface, pos)
end


return model