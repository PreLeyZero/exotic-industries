local model = {}

--====================================================================================================
--MATTER STABILIZER
--====================================================================================================

model.stabilizers = {
    ["ei_alien-stabilizer"] = ei_data.matter_stabilizer.alien_range,
    ["ei_matter-stabilizer"] = ei_data.matter_stabilizer.matter_range
}

model.matter_machines = {
    ["ei_exotic-assembler"] = true
}


--UTIL AND OTHER
------------------------------------------------------------------------------------------------------

function model.check_entity(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true

end


function model.find_in_range(machine_type, surface, pos, range)

    local entities = surface.find_entities_filtered{
        position = pos,
        radius = range,
    }

    local matter_machines = {}

    for _, e in pairs(entities) do

        if machine_type == "stabilizer" then
            if model.stabilizers[e.name] then
                table.insert(matter_machines, e)
            end
        end

        if machine_type == "matter_machine" then
            if model.matter_machines[e.name] then
                table.insert(matter_machines, e)
            end
        end

    end

    return matter_machines

end


function model.update_matter_machine(entity)

    if not model.check_entity(entity) then
        return
    end

    -- get stabilizers in range
    local stabilizers = model.find_in_range("stabilizer", entity.surface, entity.position, ei_data.matter_stabilizer.matter_range)

    if #stabilizers > 0 then
        return
    end

    -- blow machine up if crafting progress is over 50 %
    if entity.crafting_progress > 0.5 then
        entity.die()
    end

end


--REGISTRY
------------------------------------------------------------------------------------------------------

function model.register_stabilizer(entity)

    if storage.ei.matter_stabilizers == nil then
        storage.ei.matter_stabilizers = {}
    end

    storage.ei.matter_stabilizers[entity.unit_number] = entity

end


function model.unregister_stabilizer(entity)

    if storage.ei.matter_stabilizers == nil then
        return
    end

    storage.ei.matter_stabilizers[entity.unit_number] = nil

end


function model.register_matter_machine(entity)

    if storage.ei.matter_machines == nil then
        storage.ei.matter_machines = {}
    end

    storage.ei.matter_machines[entity.unit_number] = entity

end


function model.unregister_matter_machine(entity)

    if storage.ei.matter_machines == nil then
        return
    end

    storage.ei.matter_machines[entity.unit_number] = nil

end


--RENDERING RELATED
------------------------------------------------------------------------------------------------------

function model.draw_connection(source, target, player)

    if not model.check_entity(source) then
        return
    end

    if not model.check_entity(target) then
        return
    end

    if not storage.ei.selected_render then
        storage.ei.selected_render = {}
    end

    -- draw a line between the two entities
    render = rendering.draw_line{
        color = {r = 0, g = 1, b = 0},
        width = 0.2,
        from = source.position,
        to = target.position,
        surface = source.surface,
        players = {player},
        forces = {source.force},
        draw_on_ground = true,
    }

    table.insert(storage.ei.selected_render, {
        ["render"] = render,
        ["source"] = source,
        ["target"] = target,
        ["type"] = "connection"
    })

    -- game.print(source.unit_number)

end


function model.draw_stabilizer_range(entity, player)

    if not model.check_entity(entity) then
        return
    end

    if not storage.ei.selected_render then
        storage.ei.selected_render = {}
    end

    -- check if this entity already has a range circle

    for _, render in pairs(storage.ei.selected_render) do
        if render.type == "range" and render.source == entity then
            return
        end
    end

    local range = model.stabilizers[entity.name]
    local scale = range/4 -- 1 <-> 2.5 + 1.5 tiles = 4 tiles

    -- draw a circle around the entity

    render = rendering.draw_sprite{
        sprite = "ei_stabilizer-radius",
        target = entity,
        surface = entity.surface,
        players = {player},
        forces = {entity.force},
        render_layer = "radius-visualization",
        x_scale = scale,
        y_scale = scale,
    }

    table.insert(storage.ei.selected_render, {
        ["render"] = render,
        ["source"] = entity,
        ["type"] = "range"
    })

end


function model.remove_rendering(entity)

    if not model.check_entity(entity) then
        return
    end

    -- remove this entity from rendering
    -- assume it is a matter machine

    for _, render in pairs(storage.ei.selected_render) do
        if render.type == "connection" and render.target == entity then
            render.render.destroy()
            table.remove(storage.ei.selected_render, _)
        end
    end

    -- assume it is a stabilizer

    for _, render in pairs(storage.ei.selected_render) do
        if render.type == "range" and render.source == entity then
            render.render.destroy()
            table.remove(storage.ei.selected_render, _)
        end

        if render.type == "connection" and render.source == entity then
            render.render.destroy()
            table.remove(storage.ei.selected_render, _)
        end

    end

end


function model.clear_rendering(player)

    if not player.valid then
        return
    end

    if not player.cursor_stack then
        return
    end

    -- dont clear rendering if player has stabilizer or matter machine in cursor
    if player.cursor_stack.valid_for_read then
        if model.stabilizers[player.cursor_stack.name] then
            return
        end

        if model.matter_machines[player.cursor_stack.name] then
            return
        end
    end

    if storage.ei.selected_render then
        for _, render in pairs(storage.ei.selected_render) do
            render = render.render
            render.destroy()
        end
    end

    storage.ei.selected_render = {}

end


function model.stabilizer_selected(player, entity)

    if not model.check_entity(entity) then
        return
    end

    local range = model.stabilizers[entity.name]
    local matter_machines = model.find_in_range("matter_machine",entity.surface, entity.position, range)

    -- draw lines to all matter machines

    for _, e in pairs(matter_machines) do
        model.draw_connection(entity, e, player)
    end

end


--[[
function model.matter_machine_selected(player, entity)

end
]]


function model.stabilizer_on_cursor(player)

    -- get player position and find all stabilizers in screen range

    local position = player.position

    if not position then
        return
    end

    local stabilizers = model.find_in_range("stabilizer", player.surface, position, 100)

    -- draw circle for every stabilizer

    for _, e in pairs(stabilizers) do
        model.draw_stabilizer_range(e, player)

        -- draw lines to all matter machines
        model.stabilizer_selected(player, e)
    end

end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.stabilizers[entity.name] then
        model.register_stabilizer(entity)
    end

    if model.matter_machines[entity.name] then
        model.register_matter_machine(entity)
    end
    
end


function model.on_destroyed_entity(entity)

    if model.stabilizers[entity.name] then
        model.remove_rendering(entity)

        -- remove stabilizer from storage
        model.unregister_stabilizer(entity)
    end

    if model.matter_machines[entity.name] then
        model.remove_rendering(entity)

        -- remove matter machine from storage
        model.unregister_matter_machine(entity)
    end
    
end


function model.on_selected_entity_changed(event)

    local player = game.get_player(event.player_index)
    local new_entity = player.selected

    if player == nil then
        return
    end

    model.clear_rendering(player)

    if new_entity == nil then
        return
    end

    if model.stabilizers[new_entity.name] then
        model.stabilizer_selected(player, new_entity)
    end

    --[[
    if model.matter_machines[new_entity.name] then
        model.matter_machine_selected(player, new_entity)
    end
    ]]

end


function model.on_player_cursor_stack_changed(event)

    local player = game.get_player(event.player_index)

    if player == nil then
        return
    end

    model.clear_rendering(player)

    if player.cursor_stack and player.cursor_stack.valid_for_read then
        
        local item = player.cursor_stack.name

        if model.stabilizers[item] then
            model.stabilizer_on_cursor(player)
        end

        if model.matter_machines[item] then
            model.stabilizer_on_cursor(player)
        end

    end

end


function model.update()

    if not storage.ei.matter_machines then
        return
    end

    -- if no current break point then try to make a new one
    if not storage.ei.stabilizer_break_point and next(storage.ei.matter_machines) then
        storage.ei.stabilizer_break_point,_ = next(storage.ei.matter_machines)
    end

    -- if no current break point then return
    if not storage.ei.stabilizer_break_point then
        return
    end

    -- get current break point
    local break_id = storage.ei.stabilizer_break_point

    model.update_matter_machine(storage.ei.matter_machines[break_id])

    -- get next break point
    if next(storage.ei.matter_machines, break_id) then
        storage.ei.stabilizer_break_point,_ = next(storage.ei.matter_machines, break_id)
    else
        storage.ei.stabilizer_break_point = nil
    end

end


return model