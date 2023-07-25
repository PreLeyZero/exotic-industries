local model = {}

--====================================================================================================
--GATE
--====================================================================================================

-- teleport costs in MJ
model.energy_costs = {
    ["player"] = 100,
    ["item"] = 10
}

--DOC
------------------------------------------------------------------------------------------------------

-- placing the gate will place hidden container ontop
-- gui allows selection of exit location
-- item transport is only possible, if exit location is coupled to exit point
-- item transport consumes energy
-- gui allows to set condition for item transport trigger

--UTIL
-----------------------------------------------------------------------------------------------------

function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.check_global_init()

    if not global.ei.gate then
        global.ei.gate = {}
    end

    if not global.ei.gate.gate then
        global.ei.gate.gate = {}
    end

    if not global.ei.gate.exit_platform then
        global.ei.gate.exit_platform = {}
    end

end


function model.get_transfer_inv(transfer)
    -- transfer is either a player index, a robot, or nil
    -- needed to prevent unregistration when the transferer cant mine due to full inv

    if not transfer then
        return nil
    end

    if type(transfer) == "number" then
        -- player index
        local player = game.get_player(transfer)
        return player.get_main_inventory()
    end

    if transfer.valid then
        -- robot
        local robot = transfer
        return robot.get_inventory(defines.inventory.robot_cargo)
    end

    return nil

end


function model.transfer_valid(source, transfer)

    local target_inv = model.get_transfer_inv(transfer)
    
    if not target_inv then
        -- case for when destroyed by gun f.e. -> need to unregister
        return true
    end

    -- check if target has space for gate item
    if target_inv.can_insert({name = "ei_gate", count = 1}) then
        target_inv.insert({name = "ei_gate", count = 1})
        return true
    end

    return false

end


function model.register_gate(gate, container)

    model.check_global_init()
    
    local gate_unit = gate.unit_number

    if global.ei.gate.gate[gate_unit] then
        return
    end

    global.ei.gate.gate[gate_unit] = {}
    global.ei.gate.gate[gate_unit].gate = gate
    global.ei.gate.gate[gate_unit].container = container

    -- set endpoint to (0, 0)
    global.ei.gate.gate[gate_unit].exit = {surface = "gaia", x = 0, y = 0}

end

--GATE LOGIC
-----------------------------------------------------------------------------------------------------

function model.make_gate(gate)

    -- create and register cate-container
    local gate_container = gate.surface.create_entity({
        name = "ei_gate-container",
        position = gate.position,
        force = gate.force
    })

    model.register_gate(gate, container)

end


function model.destroy_gate(gate, container)

    if not gate then
        -- look for gate at container position
        gate = container.surface.find_entity("ei_gate", container.position)
    end

    if not container then
        -- look for container at gate position
        container = gate.surface.find_entity("ei_gate-container", gate.position)
    end

    if not gate or not container then
        return
    end

    local gate_unit = gate.unit_number

    if model.entity_check(gate) then
        gate.destroy()
    end

    if model.entity_check(container) then
        container.destroy()
    end

    if global.ei.gate.gate[gate_unit] then
        global.ei.gate.gate[gate_unit] = nil
    end

end


function model.check_for_teleport()

    -- loop over all gates and check if there is a player in range
    -- if so check if enough power and if endpoint has exit
    -- spawn in exit if not and teleport

    if not global.ei.gate then
        return
    end

    if not global.ei.gate.gate then
        return
    end

    for i,v in pairs(global.ei.gate.gate) do

        local gate = global.ei.gate.gate[i].gate

        if not model.gate_state(gate) then
            goto continue
        end

        -- TODO: change this to only inner gate for flying drones
        local players = gate.surface.find_entities_filtered({
            area = {
                {gate.position.x - 7, gate.position.y - 7},
                {gate.position.x + 7, gate.position.y + 7}
            },
            type = "character"
        })

        if #players == 0 then
            goto continue
        end

        if not model.pay_energy(gate, {"player"}) then
            goto continue
        end

        model.render_exit(gate)

        model.teleport_player(players[1], gate)

        ::continue::

    end

end


function model.gate_state(gate)

    -- will be false if no exit is set

    if not global.ei.gate.gate[gate.unit_number].exit then
        return false
    end

    return true
end


function model.pay_energy(gate, tablein)

    -- check if gate has enough energy to transport all contents of tablein
    -- if so, pay and return true

    local energy = 0
    for i,v in ipairs(tablein) do
        if type(v) == "string" and v == "player" then
            energy = energy + model.energy_costs.player
        end

        if type(v) == "table" then --for item
            energy = energy + model.energy_costs.item * v.count
        end
    end

    -- change to Mj
    energy = energy * 1000000

    if gate.energy < energy then
        return false
    end

    gate.energy = gate.energy - energy
    return true

end


function model.teleport_player(character, gate)

    local player = character.player
    if not player then
        return
    end

    local exit = global.ei.gate.gate[gate.unit_number].exit

    -- teleport player
    player.teleport({exit.x, exit.y}, exit.surface)

end

--RENDERING
-----------------------------------------------------------------------------------------------------

function model.render_exit(gate)

    local gate_unit = gate.unit_number
    local exit = global.ei.gate.gate[gate_unit].exit
    local animation

    -- check if exit already exists, if at same pos and surface extend time to live
    if global.ei.gate.gate[gate_unit].exit_animation then

        animation = global.ei.gate.gate[gate_unit].exit_animation

        -- check if still valid, might be very old
        if rendering.is_valid(animation) then

            -- also test pos and surface
            local target = rendering.get_target(animation)
            local surface = rendering.get_surface(animation)

            if target[1] == exit.x and target[2] == exit.y and surface == exit.surface then
                -- extend time to live
                rendering.set_time_to_live(animation, 180)
                return
            end
        end
    end

    -- create new exit
    animation = rendering.draw_animation{
        animation = "ei_exit-simple",
        target = {exit.x, exit.y},
        surface = exit.surface,
        render_layer = "object",
        animation_speed = 0.6,
        x_scale = 1,
        y_scale = 1,
        time_to_live = 180,
    }

    global.ei.gate.gate[gate_unit].exit_animation = animation
    
end


--GUI
-----------------------------------------------------------------------------------------------------

--HANDLERS
-----------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_gate" then

        model.make_gate(entity)
        ei_gaia.create_gaia()
    end

end


function model.on_destroyed_entity(entity, transfer)

    if model.entity_check(entity) == false then
        return
    end

    if not model.transfer_valid(entity, transfer) then
        return
    end

    if entity.name == "ei_gate" then

        model.destroy_gate(entity, nil)
        return

    end

    -- normaly gate gets mined/destroyed first
    if entity.name == "ei_gate-container" then

        model.destroy_gate(nil, entity)
        return

    end

end


function model.update()

    model.check_for_teleport()

end

--GUI HANDLER
-----------------------------------------------------------------------------------------------------

return model