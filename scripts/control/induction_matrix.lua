local model = {}

--====================================================================================================
--INDUCTION MATRIX
--====================================================================================================

model.only_on_tile = {
    ["ei_induction-matrix-basic-coil"] = true,
    ["ei_induction-matrix-basic-solenoid"] = true,
    ["ei_induction-matrix-basic-converter"] = true,
    ["ei_induction-matrix-core:1"] = true,
    ["ei_induction-matrix-core:2"] = true,
    ["ei_induction-matrix-core:3"] = true,
    ["ei_induction-matrix-core:4"] = true,
    ["ei_induction-matrix-core:5"] = true,
    ["ei_induction-matrix-core:6"] = true,
    ["ei_induction-matrix-core:7"] = true,
    ["ei_induction-matrix-core:8"] = true,
    ["ei_induction-matrix-core:9"] = true,
    ["ei_induction-matrix-core:10"] = true,
    ["ei_induction-matrix-core:11"] = true,
    ["ei_induction-matrix-core:12"] = true,
    ["ei_induction-matrix-core:13"] = true,
    ["ei_induction-matrix-core:14"] = true,
    ["ei_induction-matrix-core:15"] = true,
    ["ei_induction-matrix-core:16"] = true,
}

--CHECKS
-----------------------------------------------------------------------------------------------------

function model.check_global_init()

    if not global.ei.induction_matrix then
        global.ei.induction_matrix = {}
    end

    if not global.ei.induction_matrix.render_que then
        global.ei.induction_matrix.render_que = {}
    end

end


function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.check_tile(entity)

    -- is this entity on the "ei_induction-matrix-tile" tile?
    -- if not make a flying text

    -- exclude ghost entities
    if entity.type == "entity-ghost" or entity.type == "tile-ghost" then
        return false
    end

    local tile = entity.surface.get_tile(entity.position)

    if tile.name ~= "ei_induction-matrix-tile" then
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "This entity must be placed on a induction matrix tile",
            color = {r=1, g=0, b=0},
        }
        return false
    end

    return true
end


function model.check_connected_tiles(pos, surface, render)

    local max_connected_tiles = 14*14

    -- get the total number of connected tiles at this position
    -- if it is more than max_connected_tiles make a flying text and return false

    -- get tile at pos
    -- local pos = {x=pos.x - 0.5, y=pos.y - 0.5}

    local tile = surface.get_tile({x=pos.x - 0.25, y=pos.y - 0.25})
    local pos = tile.position

    if not tile then
        return false
    end

    if tile.name ~= "ei_induction-matrix-tile" then
        return false
    end

    local tile_que = {}
    local known_tiles = {}
    local progress_list = {}

    -- add tile to todo que
    table.insert(tile_que, pos)
    known_tiles[pos.x .. "," .. pos.y] = true

    while true do

        if #tile_que == 0 then
            break
        end

        -- get first tile in que
        local tile_pos = tile_que[1]

        -- get all adjacent tiles that are induction matrix tiles
        adjacent_tiles = model.get_adjacent_tiles(tile_pos, surface)

        -- add adjacent tiles to que
        for _, adjacent_tile in ipairs(adjacent_tiles) do
            if known_tiles[adjacent_tile.position.x .. "," .. adjacent_tile.position.y] == nil then
                table.insert(tile_que, adjacent_tile.position)
                known_tiles[adjacent_tile.position.x .. "," .. adjacent_tile.position.y] = true
            end
        end

        -- remove tile from que
        table.remove(tile_que, 1)

        -- add the tile to the progress list
        table.insert(progress_list, tile_pos)
        
    end

    -- get lenght of known tiles
    known_lenght = 0
    for _,_ in pairs(known_tiles) do
        known_lenght = known_lenght + 1
    end
    
    if known_lenght > max_connected_tiles then
        surface.create_entity{
            name = "flying-text",
            position = pos,
            text = "Too many induction matrix tiles connected",
            color = {r=1, g=0, b=0},
        }

        if render == true then
            model.que_tile_render(surface, progress_list, {r=1, g=0, b=0, a=0.001})
        end

        return false
    end

    if render == true then
        model.que_tile_render(surface, progress_list, {r=0, g=1, b=0, a=0.001})
    end

    return true

end


function model.get_adjacent_tiles(pos, surface)

    local tiles = {}
    -- get tiles to north, east, south, west
    local north_tile = surface.get_tile({pos.x, pos.y-1})
    local east_tile = surface.get_tile({pos.x+1, pos.y})
    local south_tile = surface.get_tile({pos.x, pos.y+1})
    local west_tile = surface.get_tile({pos.x-1, pos.y})

    if north_tile.name == "ei_induction-matrix-tile" then
        table.insert(tiles, north_tile)
    end

    if east_tile.name == "ei_induction-matrix-tile" then
        table.insert(tiles, east_tile)
    end

    if south_tile.name == "ei_induction-matrix-tile" then
        table.insert(tiles, south_tile)
    end

    if west_tile.name == "ei_induction-matrix-tile" then
        table.insert(tiles, west_tile)
    end

    return tiles
end


function model.que_tile_render(surface, progress_list, color)

    model.check_global_init()

    if #progress_list == 0 then
        return
    end


    local speed = 8
    local tick = game.tick
    local Dt = #progress_list/speed + 10

    -- loop over all tiles in the progress list and add them to the render que
    for i, pos in ipairs(progress_list) do

        -- add tile to render que
        table.insert(global.ei.induction_matrix.render_que, {
            tick = tick + math.floor(i/speed),
            surface = surface,
            position = pos,
            color = color,
            rtype = "tile-box",
        })

        -- also add the "reflection"
        table.insert(global.ei.induction_matrix.render_que, {
            tick = tick + Dt + math.floor((#progress_list - i)/speed),
            surface = surface,
            position = pos,
            color = color,
            rtype = "tile-box",
        })
        

    end

end


function model.update_tile_render_que(tick)

    model.check_global_init()

    if #global.ei.induction_matrix.render_que == 0 then
        return
    end

    for i, v in ipairs(global.ei.induction_matrix.render_que) do

        if v.tick <= tick then

            if v.rtype == "tile-box" then
                model.render_tile_box(v)
            end

            table.remove(global.ei.induction_matrix.render_que, i)

        end

    end

end


function model.render_tile_box(data)

    local surface = data.surface
    local pos = data.position
    local color = data.color

    local box = {
        left_top = {pos.x, pos.y},
        right_bottom = {pos.x+1, pos.y+1},
    }

    rendering.draw_rectangle{
        color = color,
        filled = true,
        left_top = box.left_top,
        right_bottom = box.right_bottom,
        surface = surface,
        time_to_live = 20,
    }

end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if not model.only_on_tile[entity.name]  then
        return
    end

    if model.check_tile(entity) == false then
        return
    end

    if model.check_connected_tiles(entity.position, entity.surface, true) == false then
        return
    end

end


function model.on_built_tile(event)

    local surface = game.surfaces[event.surface_index]
    local tiles = event.tiles
    local tile = event.tile

    --if tile.name ~= "ei_induction-matrix-tile" then
    --    return
    --end

    for _, v in ipairs(tiles) do

        local pos = v.position

        surface.destroy_decoratives{
            area = {{pos.x-1, pos.y-1}, {pos.x+1, pos.y+1}},
        }

    end

end


function model.update()

    local tick = game.tick

    model.update_tile_render_que(tick)

end


return model
