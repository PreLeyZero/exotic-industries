local model = {}

--====================================================================================================
--DRONE PORT
--====================================================================================================

--DOC
------------------------------------------------------------------------------------------------------

-- one drone is associated with one drone port
-- placing a drone port will create a drone, destroying a drone port will destroy the drone associated with it
-- drop items of the drone (note drone has no inventory but the dummy character has)


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

    if not global.ei.drone then
        global.ei.drone = {}
    end

    if not global.ei.drone.port then
        global.ei.drone.port = {}
    end

end

--REGISTER
-----------------------------------------------------------------------------------------------------

function model.create_port(entity)

    model.check_global_init()

    -- register this port and create a new drone
    local drone = entity.surface.create_entity({
        name = "ei_drone",
        position = {entity.position.x, entity.position.y - 2},
        direction = defines.direction.south,
        force = entity.force
    })

    -- also create the dummy character for the drone
    local dummy = entity.surface.create_entity({
        name = "character",
        position = {entity.position.x, entity.position.y - 2},
        force = entity.force
    })

    global.ei.drone.port[entity.unit_number] = {
        entity = entity,
        drone = drone,
        dummy = dummy
    }

    -- let dummy ride the drone
    drone.set_driver(dummy)

end


function model.destroy_port(entity)
    
    model.check_global_init()

    -- blow up the drone and spawn in a crash site chest for items
    local drone = global.ei.drone.port[entity.unit_number].drone
    local dummy = global.ei.drone.port[entity.unit_number].dummy

    -- transfer items to chest
    local drone_inv = dummy.get_inventory(defines.inventory.character_main)

    if not drone_inv.is_empty() then

        local chest = entity.surface.create_entity({
            name = "crash-site-chest-1",
            position = drone.position,
            force = entity.force
        })
        local inv = chest.get_inventory(defines.inventory.chest)
    
        for i = 1, #drone_inv do
            local stack = drone_inv[i]
            if stack.valid_for_read and inv.can_insert(stack) then
                inv.insert(stack)
            end
        end

    end

    -- blow up drone and dummy
    drone.destroy()
    dummy.destroy()

    -- unregister
    global.ei.drone.port[entity.unit_number] = nil

end

--GUI
-----------------------------------------------------------------------------------------------------

function model.open_gui(player)

    if player.gui.relative["ei_drone-port-console"] then
        model.close_gui(player)
    end

    local root = player.gui.relative.add{
        type = "frame",
        name = "ei_drone-port-console",
        anchor = {
            gui = defines.relative_gui_type.assembling_machine_gui,
            name = "ei_drone-port",
            position = defines.relative_gui_position.right,
        },
        direction = "vertical",
    }

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}
        titlebar.add{
            type = "label",
            caption = {"exotic-industries.drone-port-gui-title"},
            style = "frame_title",
        }

        titlebar.add{
            type = "empty-widget",
            style = "ei_titlebar_nondraggable_spacer",
            ignored_by_interaction = true
        }

        titlebar.add{
            type = "sprite-button",
            sprite = "virtual-signal/informatron",
            tooltip = {"exotic-industries.gui-open-informatron"},
            style = "frame_action_button",
            tags = {
                parent_gui = "ei_drone-port-console",
                action = "goto-informatron",
                page = "drone-port"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame",
    }

    do -- Control
        main_container.add{
            type = "frame",
            style = "ei_subheader_frame",
        }.add{
            type = "label",
            caption = {"exotic-industries.drone-port-gui-control-title"},
            style = "subheader_caption_label",
        }
    
        local control_flow = main_container.add{
            type = "flow",
            name = "control-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        -- Target cam
        local camera_frame = control_flow.add{
            type = "frame",
            name = "camera-frame",
            style = "ei_small_camera_frame"
        }
        camera_frame.add{
            type = "camera",
            name = "target-camera",
            position = {0, 0},
            surface_index = 1,
            zoom = 1,
            style = "ei_small_camera"
        }        

        -- Steer button
        control_flow.add{
            type = "label",
            caption = {"exotic-industries.drone-port-gui-control-steer-label"},
        }
        control_flow.add{
            type = "button",
            name = "steer-button",
            caption = {"exotic-industries.drone-port-gui-control-steer-button", "INACTIVE"},
            tooltip = {"exotic-industries.drone-port-gui-control-steer-button-tooltip"},
            style = "ei_small_red_button",
            tags = {
                action = "set-driver",
                parent_gui = "ei_drone-port-console",
            }
        }
    end

    local data = model.get_data(player.opened)
    model.update_gui(player, data)

end


function model.get_data(drone_port)

end


function model.update_gui(player, data)

end


--HANDLERS
-----------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_drone-port" then
        model.create_port(entity)
    end

end


function model.on_destroyed_entity(entity, transfer)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name ~= "ei_drone-port" then
        return
    end

    model.destroy_port(entity)

end


--GUI HANDLER
-----------------------------------------------------------------------------------------------------

function model.close_gui(player)
    if player.gui.relative["ei_drone-port-console"] then
        player.gui.relative["ei_drone-port-console"].destroy()
    end
end


function model.on_gui_opened(event)
    model.open_gui(game.get_player(event.player_index))
end


return model