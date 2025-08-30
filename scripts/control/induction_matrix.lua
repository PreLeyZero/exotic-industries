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

-- given capacitance of infuction coils in MJ
model.coils = {
    ["ei_induction-matrix-basic-coil"] = 25,
    ["ei_induction-matrix-advanced-coil"] = 100,
    ["ei_induction-matrix-superior-coil"] = 1000,
}


model.solenoids = {
    ["ei_induction-matrix-basic-solenoid"] = true,
}


-- better converters may count as more than one converter
model.converters = {
    ["ei_induction-matrix-basic-converter"] = 1,
    ["ei_induction-matrix-advanced-converter"] = 2,
    ["ei_induction-matrix-superior-converter"] = 4,
}


model.core = {
    ["ei_induction-matrix-core__0"] = true,
    ["ei_induction-matrix-core__1"] = true,
    ["ei_induction-matrix-core__2"] = true,
    ["ei_induction-matrix-core__3"] = true,
    ["ei_induction-matrix-core__4"] = true,
    ["ei_induction-matrix-core__5"] = true,
    ["ei_induction-matrix-core__6"] = true,
    ["ei_induction-matrix-core__7"] = true,
    ["ei_induction-matrix-core__8"] = true,
    ["ei_induction-matrix-core__9"] = true,
    ["ei_induction-matrix-core__10"] = true,
    ["ei_induction-matrix-core__11"] = true,
    ["ei_induction-matrix-core__12"] = true,
    ["ei_induction-matrix-core__13"] = true,
    ["ei_induction-matrix-core__14"] = true,
    ["ei_induction-matrix-core__15"] = true,
    ["ei_induction-matrix-core__16"] = true,
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

    if not storage.ei.induction_matrix then
        storage.ei.induction_matrix = {}
    end

    if not storage.ei.induction_matrix.render_queue then
        storage.ei.induction_matrix.render_queue = {}
    end

    if not storage.ei.induction_matrix.core then
        storage.ei.induction_matrix.core = {}
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
            rendering.draw_text{
                target = entity,
                text = "This entity must be placed on a induction matrix tile",
                color = {r=1, g=0, b=0},
                surface = entity.surface,
                scale = 1,
                time_to_live = 120
            }
            return false
        end

        return true

    else

        local tile = entity.surface.get_tile(entity.position)

        if tile.name ~= "ei_induction-matrix-tile" then
            rendering.draw_text{
                target = entity,
                text = "This entity must be placed on a induction matrix tile",
                color = {r=1, g=0, b=0},
                surface = entity.surface,
                scale = 1,
                time_to_live = 120
            }
            return false
        end

        return true

    end
end


--FLOODFIL LOGIC RELATED
-----------------------------------------------------------------------------------------------------

function model.check_connected_tiles(pos, surface, render, matrix_id, force)

    local max_connected_tiles = model.get_max_connected_tiles(force)
    local tile = surface.get_tile({x=pos.x - 0.25, y=pos.y - 0.25})
    local pos = tile.position

    if not tile then
        return false
    end

    if tile.name ~= "ei_induction-matrix-tile" then
        return false
    end

    local tile_queue = {}
    local known_tiles = {}
    local progress_list = {}
    local matrix_id = matrix_id

    -- add tile to todo que
    table.insert(tile_queue, pos)
    known_tiles[pos.x .. "," .. pos.y] = true

    -- if matrix_id is give nthen reset the matrix table first
    if matrix_id then
        model.reset_matrix_table(matrix_id)
    end

    while true do

        if #tile_queue == 0 then
            break
        end

        -- get first tile in que
        local tile_pos = tile_queue[1]

        -- get all adjacent tiles that are induction matrix tiles
        local adjacent_tiles = model.get_adjacent_tiles(tile_pos, surface)

        -- add adjacent tiles to que
        for _, adjacent_tile in ipairs(adjacent_tiles) do
            if known_tiles[adjacent_tile.position.x .. "," .. adjacent_tile.position.y] == nil then
                table.insert(tile_queue, adjacent_tile.position)
                known_tiles[adjacent_tile.position.x .. "," .. adjacent_tile.position.y] = true
            end
        end

        -- remove tile from que
        table.remove(tile_queue, 1)

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
    local known_lenght = 0
    for _,_ in pairs(known_tiles) do
        known_lenght = known_lenght + 1
    end

    if known_lenght > max_connected_tiles then
        rendering.draw_text{
            target = pos,
            text = "Matrix overflow!",
            color = {r=1, g=0, b=0},
            surface = surface,
            scale = 1,
            time_to_live = 120
        }

        rendering.draw_text{
            target = {x=pos.x, y=pos.y + 0.5},
            text = "Max supported tiles are: " .. max_connected_tiles,
            color = {r=1, g=0, b=0},
            surface = surface,
            scale = 1,
            time_to_live = 120
        }

        if render == true then
            model.queue_tile_render(surface, progress_list, {r=1, g=0, b=0, a=0.001})
        end

        return {["state"] = false, ["matrix_id"] = matrix_id, ["tiles"] = known_lenght}
    end

    if render == true then
        model.queue_tile_render(surface, progress_list, {r=0, g=1, b=0, a=0.001})
    end

    return {["state"] = true, ["matrix_id"] = matrix_id, ["tiles"] = known_lenght}

end

---@param surface LuaSurface
function model.lookup_tile_for_entity(pos, surface, matrix_id)

    model.check_global_init()

    -- get entity above this tile and add it to the core table
    local entities = surface.find_entities({
        {pos.x-0.25, pos.y-0.25},
        {pos.x+0.25, pos.y+0.25}
    })

    for _, entity in ipairs(entities) do

        if not storage.ei.induction_matrix.core[matrix_id] then
            goto contin
        end

        if not entity.valid then
            goto contin
        end

        local unit = entity.unit_number
        -- check for every entity if it is already known, if not add it

        if model.coils[entity.name] then
            if not storage.ei.induction_matrix.core[matrix_id].coils[unit] then
                storage.ei.induction_matrix.core[matrix_id].coils[unit] = entity
            end
        end

        if model.converters[entity.name] then
            if not storage.ei.induction_matrix.core[matrix_id].converters[unit] then
                storage.ei.induction_matrix.core[matrix_id].converters[unit] = entity
            end
        end

        if model.solenoids[entity.name] then
            if not storage.ei.induction_matrix.core[matrix_id].solenoids[unit] then
                storage.ei.induction_matrix.core[matrix_id].solenoids[unit] = entity
            end
        end

        if model.core[entity.name] then

            if not storage.ei.induction_matrix.core[matrix_id] then
                goto continue
            end

            if not storage.ei.induction_matrix.core[matrix_id].core[unit] then
                storage.ei.induction_matrix.core[matrix_id].core[unit] = entity
            end

            local core_count = 0
            for _,_ in pairs(storage.ei.induction_matrix.core[matrix_id].core) do
                core_count = core_count + 1
            end

            if core_count > 1 then

                -- get old core (the one that isnt the matrix id)
                local old_core = nil

                for unit, entity in pairs(storage.ei.induction_matrix.core[matrix_id].core) do
                    if entity.unit_number ~= matrix_id then
                        old_core = entity
                    end
                end

                -- remove old core table and entry
                storage.ei.induction_matrix.core[old_core.unit_number] = nil
                storage.ei.induction_matrix.core[matrix_id].core[old_core.unit_number] = nil

                rendering.draw_text{
                    target = entity,
                    text = "Only one core per matrix allowed",
                    color = {r=1, g=0, b=0},
                    surface = entity.surface,
                    scale = 1,
                    time_to_live = 120
                }

                -- also let the new core explode
                entity.surface.spill_item_stack{position=entity.position, stack={name="ei_induction-matrix-core", count=1}, enable_looted=true}

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

            ::continue::

        end

        ::contin::

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


--UTIL
-----------------------------------------------------------------------------------------------------

function model.remove_old_cores()

    if not storage.ei.induction_matrix.to_remove then
        return
    end

    -- loop over storage.ei.induction_matrix.to_remove
    for _, matrix_id in ipairs(storage.ei.induction_matrix.to_remove) do

        if storage.ei.induction_matrix.core[matrix_id] then
            storage.ei.induction_matrix.core[matrix_id] = nil
        end

    end

    storage.ei.induction_matrix.to_remove = {}

end


function model.swap_core(old_id, core, max_IO)

    -- silently remove old core and spawn new one
    -- set the new core as core entity
    -- return the new core id

    local new_core = core.surface.create_entity{
        name = "ei_induction-matrix-core__"..math.floor(max_IO),
        position = core.position,
        force = core.force,
        create_build_effect_smoke = false,
        raise_built = false,
    }

    core.destroy({raise_destroy=false})

    storage.ei.induction_matrix.core[old_id].core = {}
    storage.ei.induction_matrix.core[old_id].core[new_core.unit_number] = new_core

    for _, player in pairs(game.connected_players) do
        local root = model.get_gui(player)
        if root and root.tags.matrix_id == old_id then
            root.tags = {matrix_id = new_core.unit_number}
        end
    end

    return new_core.unit_number

end


function model.swap_global_table(old_id, new_id)

    -- swap the storage table entry for the old core id with the new one

    local old_table = storage.ei.induction_matrix.core[old_id]

    storage.ei.induction_matrix.core[new_id] = old_table

    if not storage.ei.induction_matrix.to_remove then
        storage.ei.induction_matrix.to_remove = {}
    end

    table.insert(storage.ei.induction_matrix.to_remove, old_id)

end


function model.apply_stats(matrix_id, old_stats, new_stats, core, state)

    -- get current energy stored in the core
    local energy = core.energy
    local matrix_id = matrix_id
    local new_id = nil
    local core = core

    -- first check if the core needs to be swapped for another one
    if old_stats.max_IO ~= new_stats.max_IO or state == false then

        if state == false then
            new_id = model.swap_core(matrix_id, core, 0)
        else
            new_id = model.swap_core(matrix_id, core, new_stats.max_IO)
        end

        model.swap_global_table(matrix_id, new_id)
        storage.ei.induction_matrix.core[new_id].stats = new_stats

        -- set the new cores energy to the old one
        core = storage.ei.induction_matrix.core[new_id].core[new_id]

    else
        -- just update the stats
        storage.ei.induction_matrix.core[matrix_id].stats = new_stats

    end

    -- set the capacity of the core
    core.electric_buffer_size = new_stats.capacity*1000000

    if new_id then
        core.energy = energy
        return new_id
    else
        return matrix_id
    end

end


function model.reset_matrix_table(matrix_id)

    model.check_global_init()

    -- preserve old stats
    local stats = {}
    if storage.ei.induction_matrix.core[matrix_id] then
        stats = storage.ei.induction_matrix.core[matrix_id].stats
    end

    -- reset the table
    storage.ei.induction_matrix.core[matrix_id] = {}
    storage.ei.induction_matrix.core[matrix_id].coils = {}
    storage.ei.induction_matrix.core[matrix_id].converters = {}
    storage.ei.induction_matrix.core[matrix_id].solenoids = {}
    storage.ei.induction_matrix.core[matrix_id].stats = {}
    storage.ei.induction_matrix.core[matrix_id].core = {}

    -- restore stats
    storage.ei.induction_matrix.core[matrix_id].stats = stats

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


function model.mark_dirty(matrix_id)

    model.check_global_init()

    if not storage.ei.induction_matrix.core[matrix_id] then
        return
    end

    storage.ei.induction_matrix.core[matrix_id].dirty = true

end


function model.set_core_state(matrix_id, state)

    if not storage.ei.induction_matrix.core[matrix_id] then
        return
    end

    storage.ei.induction_matrix.core[matrix_id].state = state

end


function model.calculate_stats(coils, solenoids, converters)

    local capacity = 0
    local connected_solenoids = 0
    local coil_number = 0
    local converter_number = 0

    -- calculate capacitity for each coil
    for _,coil in pairs(coils) do

        local single_capacity = model.coils[coil.name]
        local solenoids_around = 0

        coil_number = coil_number + 1


        -- count solenoids in 3x3 area around coil
        local coil_solenoids = coil.surface.find_entities({
            {coil.position.x-1, coil.position.y-1},
            {coil.position.x+1, coil.position.y+1}
        })

        for _, solenoid in pairs(coil_solenoids) do

            if model.solenoids[solenoid.name] then
                solenoids_around = solenoids_around + 1
            end

        end

        -- add the buff through solenoids around coil
        if solenoids_around > 0 then
            single_capacity = single_capacity * (2 - 0.057*(solenoids_around-1))
        end

        capacity = capacity + single_capacity

    end

    -- add the buff for solenoids in series
    for _, solenoid in pairs(solenoids) do

        -- how many solenoids are connected to this one
        local in_series = model.get_connected_solenoid_count(solenoid)

        connected_solenoids = connected_solenoids + in_series

    end

    -- count the converter value
    for _, converter in pairs(converters) do

        local converter_value = model.converters[converter.name]

        converter_number = converter_number + converter_value

    end

    -- buff capacity
    local coil_avg = capacity / coil_number
    capacity = capacity + connected_solenoids * model.buff_function(connected_solenoids) * coil_avg

    -- calc max IO
    if converter_number > 16 then
        converter_number = 16
    end

    if coil_number == 0 then
        capacity = 0
    end

    return {
        ["capacity"] = capacity,
        ["max_IO"] = converter_number,
    }

end


function model.get_connected_solenoid_count(entity)

    -- find north, south, east and west entities
    local north_entities = entity.surface.find_entities_filtered({
        position = {entity.position.x, entity.position.y-1},
    })

    local south_entities = entity.surface.find_entities_filtered({
        position = {entity.position.x, entity.position.y+1},
    })

    local east_entities = entity.surface.find_entities_filtered({
        position = {entity.position.x+1, entity.position.y},
    })

    local west_entities = entity.surface.find_entities_filtered({
        position = {entity.position.x-1, entity.position.y},
    })

    local north_entity = nil
    local south_entity = nil
    local east_entity = nil
    local west_entity = nil

    -- make sure theses entities are solenoids
    for _, entity in ipairs(north_entities) do
        if model.solenoids[entity.name] then
           north_entity = entity 
        end
    end

    for _, entity in ipairs(south_entities) do
        if model.solenoids[entity.name] then
           south_entity = entity 
        end
    end

    for _, entity in ipairs(east_entities) do
        if model.solenoids[entity.name] then
           east_entity = entity 
        end
    end

    for _, entity in ipairs(west_entities) do
        if model.solenoids[entity.name] then
           west_entity = entity 
        end
    end

    if north_entity == nil and south_entity == nil then

        if east_entity == nil and west_entity == nil then
            return 0
        end

        return 1

    end

    if east_entity == nil and west_entity == nil then

        if north_entity == nil and south_entity == nil then
            return 0
        end

        return 1

    end

    if east_entity == nil and north_entity == nil then

        if south_entity ~= nil and west_entity ~= nil then
            return 1.2
        end

        return 1

    end

    if east_entity == nil and south_entity == nil then

        if north_entity ~= nil and west_entity ~= nil then
            return 1.2
        end

        return 1

    end

    if west_entity == nil and north_entity == nil then

        if south_entity ~= nil and east_entity ~= nil then
            return 1.2
        end

        return 1

    end

    if west_entity == nil and south_entity == nil then

        if north_entity ~= nil and east_entity ~= nil then
            return 1.2
        end

        return 1

    end

    return 0

end


function model.buff_function(n)

    if n <= 48 then
        return 1/24 * n
    end

    if n <= 96 then
        return 2 - 1/48 * (n-48)
    end

    return 1
end


function model.get_max_connected_tiles(force)

    if not force then
        return 8*8
    end

    if force.technologies["ei_superior-induction-matrix"].researched then
        return 12*12
    end

    if force.technologies["ei_advanced-induction-matrix"].researched then
        return 10*10
    end

    if force.technologies["ei_induction-matrix"].researched then
        return 8*8
    end

    return 8*8

end


--UPDATE RELATED
-----------------------------------------------------------------------------------------------------

function model.update_core(matrix_id)

    local core = model.get_core_entity(matrix_id)

    if core == nil then
        return
    end

    if core.valid == false then
        return
    end

    -- first redo the floodfill to be sure that all entities are picked up
    local dict = model.check_connected_tiles(core.position, core.surface, false, matrix_id, core.force)

    local coils = storage.ei.induction_matrix.core[matrix_id].coils
    local solenoids = storage.ei.induction_matrix.core[matrix_id].solenoids
    local converters = storage.ei.induction_matrix.core[matrix_id].converters

    if dict == false then
        return
    end

    local tiles = dict["tiles"]
    local state = dict["state"]
    local matrix_id = dict["matrix_id"]

    -- calc new stats and apply them if needed
    local new_stats = model.calculate_stats(coils, solenoids, converters)

    model.show_stats(core.surface, core.position, new_stats)
    model.set_core_state(matrix_id, state)

    local old_stats = storage.ei.induction_matrix.core[matrix_id].stats
    local new_id = model.apply_stats(matrix_id, old_stats, new_stats, core, state)

    storage.ei.induction_matrix.core[new_id].dirty = false

end


function model.update_dirty()

    -- loop over all cores and update those which are marked as dirty
    model.check_global_init()

    if not storage.ei.induction_matrix.core then
        return
    end

    for matrix_id,_ in pairs(storage.ei.induction_matrix.core) do

        if storage.ei.induction_matrix.core[matrix_id].dirty then

            model.update_core(matrix_id)

        end

    end

    model.remove_old_cores()

end


--RENDERING
-----------------------------------------------------------------------------------------------------

function model.queue_tile_render(surface, progress_list, color)

    model.check_global_init()

    if #progress_list == 0 then
        return
    end


    local speed = 8
    local tick = game.tick
    local Dt = #progress_list/speed + 10

    -- loop over all tiles in the progress list and add them to the render que
    for i, pos in ipairs(progress_list) do

        -- add tile to render queue
        table.insert(storage.ei.induction_matrix.render_queue, {
            tick = tick + math.floor(i/speed),
            surface = surface,
            position = pos,
            color = color,
            rtype = "tile-box",
        })

        -- also add the "reflection"
        table.insert(storage.ei.induction_matrix.render_queue, {
            tick = tick + Dt + math.floor((#progress_list - i)/speed),
            surface = surface,
            position = pos,
            color = color,
            rtype = "tile-box",
        })

    end

end


function model.update_render_queue(tick)

    model.check_global_init()

    if next(storage.ei.induction_matrix.render_queue) == nil then
        return
    end

    for i, v in ipairs(storage.ei.induction_matrix.render_queue) do

        if v.tick <= tick then

            if v.rtype == "tile-box" then
                model.render_tile_box(v)
            end

            if v.rtype == "stat-text" then
                model.remove_stat_text(v)
            end

            table.remove(storage.ei.induction_matrix.render_queue, i)

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


function model.show_stats(surface, pos, stats)

    -- first look trough the render queue for all stat-texts and if they are for this entity
    -- then update the entry with the new rendering

    local capacity_text = nil
    local IO_text = nil
    local queue_index = false

    for i,v in ipairs(storage.ei.induction_matrix.render_queue) do

        if v.rtype == "stat-text" then

            if v.pos.x == pos.x and v.pos.y == pos.y and v.surface == surface then
                capacity_text = v.capacity_text
                IO_text = v.IO_text
                queue_index = i
                break
            end

        end

    end

    if capacity_text then
        capacity_text.destroy()
    end

    if IO_text then
        IO_text.destroy()
    end

    capacity_text = rendering.draw_text{
        text = "Capacity: " .. math.floor(stats.capacity) .. "MJ",
        surface = surface,
        target = {pos.x, pos.y - 1.5},
        color = {r=0, g=1, b=0},
        scale = 0.75,
        font = "default-game",
        alignment = "center",
        scale_with_zoom = false,
    }

    IO_text = rendering.draw_text{
        text = "Max IO: " .. math.floor(2^stats.max_IO) .. "MW",
        surface = surface,
        target = {pos.x, pos.y - 2.5},
        color = {r=1, g=1, b=1},
        scale = 0.75,
        font = "default-game",
        alignment = "center",
        scale_with_zoom = false,
    }

    if not queue_index then
        table.insert(storage.ei.induction_matrix.render_queue, {
            tick = game.tick + 120,
            capacity_text = capacity_text,
            IO_text = IO_text,
            pos = pos,
            surface = surface,
            rtype = "stat-text",
        })
    else
        storage.ei.induction_matrix.render_queue[queue_index].tick = game.tick + 120
        storage.ei.induction_matrix.render_queue[queue_index].capacity_text = capacity_text
        storage.ei.induction_matrix.render_queue[queue_index].IO_text = IO_text
    end

end


function model.remove_stat_text(data)

    data.capacity_text.destroy()
    data.IO_text.destroy()

end

--GETTERS
-----------------------------------------------------------------------------------------------------

function model.get_matrix_capacity(matrix_id)

    model.check_global_init()

    if not storage.ei.induction_matrix.core[matrix_id] then
        return 0
    end

    -- in MJ
    return storage.ei.induction_matrix.core[matrix_id].stats.capacity

end


function model.get_matrix_max_IO(matrix_id)

    model.check_global_init()

    if not storage.ei.induction_matrix.core[matrix_id] then
        return 0
    end

    -- in MW
    return 2^storage.ei.induction_matrix.core[matrix_id].stats.max_IO

end

function model.get_matrix_current_stored_power(matrix_id)

    model.check_global_init()

    if not storage.ei.induction_matrix.core[matrix_id] then
        return 0
    end

    local core = model.get_core_entity(matrix_id)

    if core == nil then
        return
    end

    -- in MJ
    return core.energy/1000000

end


function model.force_visual_update(matrix_id)

    model.check_global_init()

    if not storage.ei.induction_matrix.core[matrix_id] then
        return
    end

    local core = model.get_core_entity(matrix_id)

    if core == nil then
        return
    end

    local dict = model.check_connected_tiles(core.position, core.surface, true, matrix_id, core.force)

    if dict == false then
        return
    end

    model.set_core_state(dict.matrix_id, dict.state)

    model.mark_dirty(dict.matrix_id)

end


function model.get_core_entity(matrix_id)

    local core = nil

    for _, entity in pairs(storage.ei.induction_matrix.core[matrix_id].core) do

        if core == nil then
            core = entity
        else
            game.print("ERROR: multiple cores found for matrix_id: " .. matrix_id)
            return nil
        end

    end

    return core

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

    if entity.name == "ei_induction-matrix-core__0" then

        local dict = model.check_connected_tiles(entity.position, entity.surface, true, entity.unit_number, entity.force)

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)

    end

    if model.but_cores[entity.name] then

        local dict = model.check_connected_tiles(entity.position, entity.surface, false, nil, entity.force)

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

        -- remove core from storage
        if storage.ei.induction_matrix.core[entity.unit_number] then
            storage.ei.induction_matrix.core[entity.unit_number] = nil
        end

    end

    if model.check_tile(entity) == false then
        return
    end

    if model.but_cores[entity.name] then

        local dict = model.check_connected_tiles(entity.position, entity.surface, false, nil, entity.force)

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)

    end

end


function model.on_built_tile(event)

    local surface = game.surfaces[event.surface_index]
    local tiles = event.tiles
    local tile = event.tile
    local source = event.robot or game.get_player(event.player_index)

    --if tile.name ~= "ei_induction-matrix-tile" then
    --    return
    --end

    for _, v in ipairs(tiles) do

        local pos = v.position

        surface.destroy_decoratives{
            area = {{pos.x-1, pos.y-1}, {pos.x+1, pos.y+1}},
        }

    end

    if tile.name ~= "ei_induction-matrix-tile" then
        return
    end

    for _, v in ipairs(tiles) do

        local pos = v.position

        pos = {x = pos.x + 0.25, y = pos.y + 0.25}

        local dict = model.check_connected_tiles(pos, surface, false, nil, source.force)

        if dict == false then
            goto continue
        end

        model.set_core_state(dict.matrix_id, dict.state)

        model.mark_dirty(dict.matrix_id)

        ::continue::

    end

end


function model.on_destroyed_tile(event)

    local surface = game.surfaces[event.surface_index]
    local tiles = event.tiles
    local source = event.robot or game.get_player(event.player_index)

    for _, v in ipairs(tiles) do

        if v.old_tile.name ~= "ei_induction-matrix-tile" then
            goto continue
        end

        local pos = v.position

        -- check if there is a core on the tile
        -- if so spill it and remove it from storage

        local core = surface.find_entities_filtered{
            position = pos,
        }

        for _, entity in ipairs(core) do

            if model.core[entity.name] then

                -- remove core from storage
                if storage.ei.induction_matrix.core[entity.unit_number] then
                    table.insert(storage.ei.induction_matrix.to_remove, entity.unit_number)
                end

                -- spill core
                entity.surface.spill_item_stack{position=entity.position, stack={name = "ei_induction-matrix-core", count = 1}, enable_looted=true}

                -- destroy core
                entity.destroy()

            end

        end

        -- also check all tiles around if a core is on them
        -- and if so if it is connected to this tile (its 2x2)

        core = surface.find_entities_filtered{
            area = {{pos.x-1.5, pos.y-1.5}, {pos.x+1.5, pos.y+1.5}},
        }

        for _, entity in ipairs(core) do

            if model.core[entity.name] then

                -- get the 4 positions of tiles under the core
                -- if one of them matches the destroyed tile then
                -- destroy the core and spill it

                local core_pos = entity.position
                -- north tile
                local north_pos = {x = core_pos.x, y = core_pos.y - 1}
                -- north west tile
                local north_west_pos = {x = core_pos.x - 1, y = core_pos.y - 1}
                -- west tile
                local west_pos = {x = core_pos.x - 1, y = core_pos.y}
                -- core tile
                local core_tile_pos = {x = core_pos.x, y = core_pos.y}

                if (north_pos.x == pos.x and north_pos.y == pos.y) or (north_west_pos.x == pos.x and north_west_pos.y == pos.y) or (west_pos.x == pos.x and west_pos.y == pos.y) or (core_tile_pos.x == pos.x and core_tile_pos.y == pos.y) then
                
                    -- remove core from storage
                    if storage.ei.induction_matrix.core[entity.unit_number] then
                        table.insert(storage.ei.induction_matrix.to_remove, entity.unit_number)
                    end

                    -- spill core
                    entity.surface.spill_item_stack{position=entity.position, stack={name = "ei_induction-matrix-core", count = 1}, enable_looted=true}

                    -- destroy core
                    entity.destroy()
                    
                end

            end

        end

        -- do the same check for 2x2 converters

        local converter = surface.find_entities_filtered{
            area = {{pos.x-1.5, pos.y-1.5}, {pos.x+1.5, pos.y+1.5}},
        }

        for _, entity in ipairs(converter) do

            if model.converters[entity.name] then

                -- get the 4 positions of tiles under the core
                -- if one of them matches the destroyed tile then
                -- destroy the core and spill it

                local converter_pos = entity.position
                -- north tile
                local north_pos = {x = converter_pos.x, y = converter_pos.y - 1}
                -- north west tile
                local north_west_pos = {x = converter_pos.x - 1, y = converter_pos.y - 1}
                -- west tile
                local west_pos = {x = converter_pos.x - 1, y = converter_pos.y}
                -- core tile
                local converter_tile_pos = {x = converter_pos.x, y = converter_pos.y}

                if (north_pos.x == pos.x and north_pos.y == pos.y) or (north_west_pos.x == pos.x and north_west_pos.y == pos.y) or (west_pos.x == pos.x and west_pos.y == pos.y) or (converter_tile_pos.x == pos.x and converter_tile_pos.y == pos.y) then
                
                    -- spill item
                    entity.surface.spill_item_stack{position=entity.position, stack={name = entity.name, count = 1}, enable_looted=true}

                    -- destroy core
                    entity.destroy()
                    
                end

            end

        end


        -- get north, south, east, west induction matrix tiles
        -- and do the check for them
        local adjacent_tiles = model.get_adjacent_tiles(pos, surface)

        for _, y in ipairs(adjacent_tiles) do

            if y.name == "ei_induction-matrix-tile" then

                local shifted_pos = {x = y.position.x + 0.25, y = y.position.y + 0.25}
                local dict = model.check_connected_tiles(shifted_pos, surface, false, nil, source.force)

                if dict == false then
                    goto contin
                end

                model.set_core_state(dict.matrix_id, dict.state)

                model.mark_dirty(dict.matrix_id)

            end

            ::contin::

        end

        ::continue::
    end

end


function model.update()

    local tick = game.tick

    model.update_render_queue(tick)
    model.update_dirty()
    if tick % 10 == 0 then
        model.update_player_guis()
    end

end


--GUI HANDLERS
------------------------------------------------------------------------------------------------------

function model.get_gui(player)
    return player.gui.screen["ei_induction-matrix-console"]
end

---Opens the induction matrix core GUI.
---@param player LuaPlayer Player
function model.open_gui(player)
    if model.get_gui(player) then
        model.update_gui(player)
        return
    end

    local entity = player.opened_gui_type == defines.gui_type.entity and player.opened --[[@as LuaEntity]]
    if not entity or not entity.name:find("ei_induction-matrix-core", 0, true) then return end

    local root = player.gui.screen.add{
        type = "frame",
        name = "ei_induction-matrix-console",
        direction = "vertical",
        tags = {
            matrix_id = entity.unit_number
        }
    } --[[@as LuaGuiElement]]
    root.force_auto_center()
    root.style.width = 330

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}  --[[@as LuaGuiElement]]
        titlebar.drag_target = root
        titlebar.add{
            type = "label",
            caption = {"exotic-industries.induction-matrix-gui-title"},
            style = "frame_title",
            ignored_by_interaction = true
        }
        titlebar.add{
            type = "empty-widget",
            style = "ei_titlebar_draggable_spacer",
            ignored_by_interaction = true
        }
        titlebar.add{
            type = "sprite-button",
            sprite = "virtual-signal/informatron",
            tooltip = {"exotic-industries.gui-open-informatron"},
            style = "frame_action_button",
            tags = {
                parent_gui = "ei_induction-matrix-console",
                action = "goto-informatron",
                page = "induction_matrix"
            }
        }
        titlebar.add{
            type = "sprite-button",
            style = "close_button",
            sprite = "utility/close",
            hovered_sprite = "utility/close_black",
            clicked_sprite = "utility/close_black",
            tags = {
                parent_gui = "ei_induction-matrix-console",
                action = "close-gui"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame"
    } --[[@as LuaGuiElement]]

    main_container.add{ -- Console subheader
        type = "frame",
        style = "ei_subheader_frame"
    }.add{
        type = "label",
        caption = {"exotic-industries.induction-matrix-gui-console-title"},
        style = "subheader_caption_label"
    }

    local console_flow = main_container.add{
        type = "flow",
        name = "console-flow",
        direction = "vertical",
        style = "ei_inner_content_flow"
    } --[[@as LuaGuiElement]]

    local camera_frame = console_flow.add{
        type = "frame",
        name = "camera-frame",
        style = "ei_camera_frame"
    } --[[@as LuaGuiElement]]

    camera_frame.add{
        type = "camera",
        name = "camera",
        position = entity.position,
        surface_index = entity.surface.index,
        style = "ei_camera"
    }



    local max_et = console_flow.add{type = "flow", name = "max-et-flow", direction = "horizontal"} --[[@as LuaGuiElement]]
    max_et.add{
        type = "label",
        caption = {"exotic-industries.induction-matrix-gui-max-energy-transfer"},
        tooltip = {"exotic-industries.induction-matrix-gui-max-energy-transfer-tooltip"}
    }
    max_et.add{type = "empty-widget", style = "ei_horizontal_pusher"}
    max_et.add{
        type = "label",
        name = "max-et-value"
    }
    local capacity = console_flow.add{type = "flow", name = "capacity-flow", direction = "vertical"} --[[@as LuaGuiElement]]
    capacity.add{type = "line"}
    capacity.add{
        type = "label",
        caption = {"exotic-industries.induction-matrix-gui-capacity"},
        tooltip = {"exotic-industries.induction-matrix-gui-capacity-tooltip"}
    }
    local power_bar = capacity.add{
        type = "progressbar",
        name = "stored-power-value",
        style = "ei_status_progressbar",
        tooltip = {"exotic-industries.induction-matrix-gui-capacity-tooltip"}
    }
    power_bar.style.horizontal_align = "right"

    console_flow.add{
        type = "empty-widget",
        style = "ei_vertical_pusher"
    }

    local button_flow = console_flow.add{type = "flow"} --[[@as LuaGuiElement]]
    button_flow.style.horizontal_align = "right"
    button_flow.style.horizontally_stretchable = true
    button_flow.add{
        type = "button",
        caption = {"exotic-industries.induction-matrix-gui-reanalyze-caption"},
        tooltip = {"exotic-industries.induction-matrix-gui-reanalyze-tooltip"},
        tags = {
            parent_gui = "ei_induction-matrix-console",
            action = "reanalyze-matrix"
        }
    }

    player.opened = root

    -- Verify that root is still valid since another mod may have destroyed it
    if root.valid then model.update_gui(player) end
end


function model.update_player_guis()

    for _, player in pairs(game.players) do
        if player.gui.screen["ei_induction-matrix-console"] then
            if not player.opened then
                model.close_gui(player)
                return
            end

            local unit = player.opened.unit_number
            model.update_gui(player)
        end
    end

end

---Updates the induction matrix GUI.
---@param player LuaPlayer Player
function model.update_gui(player)
    local root = model.get_gui(player)
    if not root then return end

    local matrix_id = root.tags.matrix_id

    local info = root["main-container"]["console-flow"] --[[@as LuaGuiElement]]

    local max_et = info["max-et-flow"]["max-et-value"]
    local stored_power = info["capacity-flow"]["stored-power-value"]

    local max_power = model.get_matrix_capacity(matrix_id)
    local current_power = model.get_matrix_current_stored_power(matrix_id)

    max_et.caption = string.format("[font=default-bold]%.0f MW[/font]", model.get_matrix_max_IO(matrix_id))

    stored_power.caption = string.format("[font=default-bold]%0.f/%.0f MJ[/font]", current_power,max_power)
    if max_power == 0 then 
        stored_power.value = 0
    else
        stored_power.value = current_power/max_power 
    end

end

function model.close_gui(player)
    local root = player.gui.screen["ei_induction-matrix-console"]
    if root then root.destroy() end
end

---Handles buttons clicks for the induction matrix GUI.
---@param event EventData.on_gui_click Event data
function model.on_gui_click(event)
    local action = event.element.tags.action

    if action == "close-gui" then
        model.close_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
    elseif action == "goto-informatron" then
        remote.call("informatron", "informatron_open_to_page", {
            player_index = event.player_index,
            interface = "exotic-industries-informatron",
            page_name = event.element.tags.page,
          })
    elseif action == "reanalyze-matrix" then
        local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
        local root = player.gui.screen["ei_induction-matrix-console"] --[[@as LuaGuiElement]]

        model.force_visual_update(root.tags.matrix_id)
        model.update_gui(player)
    end
end

return model
