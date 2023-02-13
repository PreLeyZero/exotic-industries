local model = {}

--====================================================================================================
--INDUCTION MATRIX
--====================================================================================================

function model.table_concat(t1, t2)
    for i,v in pairs(t2) do
        t1[i] = v
    end

    return t1
end

model.coils = {
    ["ei_induction-matrix-basic-coil"] = true,
}


model.solenoids = {
    ["ei_induction-matrix-basic-solenoid"] = true,
}


model.converters = {
    ["ei_induction-matrix-basic-converter"] = true,
}


model.core = {
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


model.only_on_tile = {}
model.only_on_tile = model.table_concat(model.only_on_tile, model.coils)
model.only_on_tile = model.table_concat(model.only_on_tile, model.solenoids)
model.only_on_tile = model.table_concat(model.only_on_tile, model.converters)
model.only_on_tile = model.table_concat(model.only_on_tile, model.core)

model.but_cores = {}
model.but_cores = model.table_concat(model.but_cores, model.coils)
model.but_cores = model.table_concat(model.but_cores, model.solenoids)
model.but_cores = model.table_concat(model.but_cores, model.converters)

--DOC
------------------------------------------------------------------------------------------------------

-- placing a induction matrix core or hitting its assemble matrix button
-- runs check_connected_tiles which recalculates the matrix states
-- and marks this matrix dirty, the update script will then update the matrix
-- removing a induction matrix building will first attempt to find its matrix core
-- and then runs check_connected_tiles on that core, which recalculates the matrix states

-- if check_connected_tiles is not given a core id it will instead try to find a connected core

--CHECKS
-----------------------------------------------------------------------------------------------------

function model.check_global_init()

    if not global.ei.induction_matrix then
        global.ei.induction_matrix = {}
    end

    if not global.ei.induction_matrix.render_que then
        global.ei.induction_matrix.render_que = {}
    end

    if not global.ei.induction_matrix.core then
        global.ei.induction_matrix.core = {}
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

    -- for matrix core and converter the footprint is 2x2

    if model.core[entity.name] or model.converters[entity.name] then

        local tiles = entity.surface.count_tiles_filtered({
            area = {{entity.position.x - 0.5, entity.position.y - 0.5}, {entity.position.x + 0.5, entity.position.y + 0.5}},
            name = "ei_induction-matrix-tile",
        })

        if tiles ~= 4 then
            entity.surface.create_entity{
                name = "flying-text",
                position = entity.position,
                text = "This entity must be placed on a induction matrix tile",
                color = {r=1, g=0, b=0},
            }
            return false
        end

        return true

    else

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
end


function model.check_connected_tiles(pos, surface, render, matrix_id)

    local max_connected_tiles = 14*14
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
    local matrix_id = matrix_id

    -- add tile to todo que
    table.insert(tile_que, pos)
    known_tiles[pos.x .. "," .. pos.y] = true

    -- if matrix_id is give nthen reset the matrix table first
    if matrix_id then
        model.reset_matrix_table(matrix_id)
    end

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
        
        if matrix_id then
            -- look if there is a entity on tile and if so add it to the matrix table
            model.lookup_tile_for_entity(tile_pos, surface, matrix_id)
        else
            -- is a core ontop of this tile? if yes then return the matrix id
            matrix_id = model.is_core(tile_pos, surface)
        end

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

        return {["state"] = false, ["matrix_id"] = matrix_id, ["tiles"] = known_lenght}
    end

    if render == true then
        model.que_tile_render(surface, progress_list, {r=0, g=1, b=0, a=0.001})
    end

    return {["state"] = true, ["matrix_id"] = matrix_id, ["tiles"] = known_lenght}

end


function model.reset_matrix_table(matrix_id)

    model.check_global_init()

    -- preserve old stats
    local stats = {}
    if global.ei.induction_matrix.core[matrix_id] then
        stats = global.ei.induction_matrix.core[matrix_id].stats
    end
    
    -- reset the table
    global.ei.induction_matrix.core[matrix_id] = {}
    global.ei.induction_matrix.core[matrix_id].coils = {}
    global.ei.induction_matrix.core[matrix_id].converters = {}
    global.ei.induction_matrix.core[matrix_id].solenoids = {}
    global.ei.induction_matrix.core[matrix_id].stats = {}
    global.ei.induction_matrix.core[matrix_id].core = {}

    -- restore stats
    global.ei.induction_matrix.core[matrix_id].stats = stats

end


function model.is_core(pos, surface)

    local entities = surface.find_entities({
        {pos.x-0.25, pos.y-0.25},
        {pos.x+0.25, pos.y+0.25}
    })

    for _, entity in ipairs(entities) do
        if model.core[entity.name] then
            return entity.unit_number
        end
    end

    return nil

end


function model.lookup_tile_for_entity(pos, surface, matrix_id)

    model.check_global_init()

    -- get entity above this tile and add it to the core table
    local entities = surface.find_entities({
        {pos.x-0.25, pos.y-0.25},
        {pos.x+0.25, pos.y+0.25}
    })

    for _, entity in ipairs(entities) do

        local unit = entity.unit_number
        -- check for every entity if it is already known, if not add it

        if model.coils[entity.name] then
            if not global.ei.induction_matrix.core[matrix_id].coils[unit] then
                global.ei.induction_matrix.core[matrix_id].coils[unit] = entity
            end
        end

        if model.converters[entity.name] then
            if not global.ei.induction_matrix.core[matrix_id].converters[unit] then
                global.ei.induction_matrix.core[matrix_id].converters[unit] = entity
            end
        end

        if model.solenoids[entity.name] then
            if not global.ei.induction_matrix.core[matrix_id].solenoids[unit] then
                global.ei.induction_matrix.core[matrix_id].solenoids[unit] = entity
            end
        end

        if model.core[entity.name] then

            if not global.ei.induction_matrix.core[matrix_id].core[unit] then
                global.ei.induction_matrix.core[matrix_id].core[unit] = entity
            end

            local core_count = 0
            for _,_ in pairs(global.ei.induction_matrix.core[matrix_id].core) do
                core_count = core_count + 1
            end

            if core_count > 1 then
                
                -- get old core (the one that isnt the matrix id)
                local old_core = nil

                for unit, entity in pairs(global.ei.induction_matrix.core[matrix_id].core) do
                    if entity.unit_number ~= matrix_id then
                        old_core = entity
                    end
                end

                -- remove old core table and entry
                global.ei.induction_matrix.core[old_core.unit_number] = nil
                global.ei.induction_matrix.core[matrix_id].core[old_core.unit_number] = nil

                surface.create_entity{
                    name = "flying-text",
                    position = pos,
                    text = "Only one core per matrix allowed",
                    color = {r=1, g=0, b=0},
                }

                -- also let the new core explode
                entity.surface.spill_item_stack(entity.position, {name="ei_induction-matrix-core", count=1}, true)
                
                rendering.draw_animation({
                    animation="ei_overload-animation",
                    target={pos.x, pos.y},
                    surface=entity.surface,
                    render_layer=139,
                    time_to_live=60,
                    x_scale=2,
                    y_scale=2,
                })

                entity.destroy({raise_destroy=false})

            end

        end

    end

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
        draw_on_ground = true,
    }

end


function model.mark_dirty(matrix_id)

    model.check_global_init()

    if not global.ei.induction_matrix.core[matrix_id] then
        return
    end

    global.ei.induction_matrix.core[matrix_id].dirty = true

end


function model.set_core_state(matrix_id, state)

    if not global.ei.induction_matrix.core[matrix_id] then
        return
    end

    global.ei.induction_matrix.core[matrix_id].state = state

end


function model.update_dirty()

    -- loop over all cores and update those which are marked as dirty
    model.check_global_init()

    if not global.ei.induction_matrix.core then
        return
    end

    for matrix_id,_ in pairs(global.ei.induction_matrix.core) do

        if global.ei.induction_matrix.core[matrix_id].dirty then

            model.update_core(matrix_id)

            global.ei.induction_matrix.core[matrix_id].dirty = false

        end

    end

end


function model.update_core(matrix_id)

    local core = model.get_core_entity(matrix_id)

    if core == nil then
        return
    end

    -- first redo the floodfill to be sure that all entities are picked up
    local dict = model.check_connected_tiles(core.position, core.surface, true, matrix_id)

    local coils = global.ei.induction_matrix.core[matrix_id].coils
    local solenoids = global.ei.induction_matrix.core[matrix_id].solenoids
    local converters = global.ei.induction_matrix.core[matrix_id].converters
    local tiles = dict["tiles"]
    local state = dict["state"]

    -- calculate new induction matrix stats and set them accordingly

    local stats = model.calculate_stats(coils, solenoids, converters)

    -- if state is false then deactivate the core


end


function model.get_core_entity(matrix_id)

    local core = nil

    for _, entity in pairs(global.ei.induction_matrix.core[matrix_id].core) do

        if core == nil then
            core = entity
        else
            game.print("ERROR: multiple cores found for matrix_id: " .. matrix_id)
            return nil
        end

    end

    return core

end


function model.calculate_stats(coils, solenoids, converters)



end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if not model.only_on_tile[entity.name] then
        return
    end

    if model.check_tile(entity) == false then
        return
    end

    if entity.name == "ei_induction-matrix-core:1" then

        local dict = model.check_connected_tiles(entity.position, entity.surface, true, entity.unit_number)

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)
        
    end

    if model.but_cores[entity.name] then

        local dict = model.check_connected_tiles(entity.position, entity.surface, false, nil)

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)

    end

end


function model.on_destroyed_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if not model.only_on_tile[entity.name] then
        return
    end

    if model.core[entity.name] then

        -- remove core from global
        if global.ei.induction_matrix.core[entity.unit_number] then
            global.ei.induction_matrix.core[entity.unit_number] = nil
        end

    end

    if model.check_tile(entity) == false then
        return
    end

    if model.but_cores[entity.name] then

        local dict = model.check_connected_tiles(entity.position, entity.surface, false, nil)

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)

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
    model.update_dirty()


end


return model


-- TODO
-- dirty marking system + stat calc
-- mark dirty when destroy of entity/tiles

-- implement calc of stats