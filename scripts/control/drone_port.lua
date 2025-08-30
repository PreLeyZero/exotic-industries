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

    if not storage.ei.drone then
        storage.ei.drone = {}
    end

    if not storage.ei.drone.port then
        storage.ei.drone.port = {}
    end

    if not storage.ei.drone.driver then
        storage.ei.drone.driver = {}
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
        name = "ei_drone-character",
        position = {entity.position.x, entity.position.y - 2},
        force = entity.force
    })

    storage.ei.drone.port[entity.unit_number] = {
        entity = entity,
        drone = drone,
        dummy = dummy
    }

    -- let dummy ride the drone
    drone.set_driver(dummy)

    -- make drone "op"
    -- drone.operable = false
    drone.destructible = false

end


function model.destroy_port(entity)
    
    model.check_global_init()

    if not storage.ei.drone.port[entity.unit_number] then return end

    -- try to blow up drone and dummy
    if not storage.ei.drone.port[entity.unit_number].dummy then
        storage.ei.drone.port[entity.unit_number] = nil
        return
    end
    if not storage.ei.drone.port[entity.unit_number].drone then
        storage.ei.drone.port[entity.unit_number] = nil
        return
    end

    if not storage.ei.drone.port[entity.unit_number].dummy.valid then
        storage.ei.drone.port[entity.unit_number] = nil
        return
    end
    if not storage.ei.drone.port[entity.unit_number].drone.valid then
        storage.ei.drone.port[entity.unit_number] = nil
        return
    end

    -- blow up the drone and spawn in a crash site chest for items
    local drone = storage.ei.drone.port[entity.unit_number].drone
    local dummy = storage.ei.drone.port[entity.unit_number].dummy

    -- transfer items to chest
    local drone_inv = dummy.get_inventory(defines.inventory.character_main)

    if not drone_inv.is_empty() then

        local size = 0
        -- sort and resize inv and then count size
        drone_inv.sort_and_merge()
        for i = 1, #drone_inv do
            local stack = drone_inv[i]
            if stack.valid_for_read then
                size = size + 1
            end
        end

        local corpse = drone.surface.create_entity({
            name = "ei_drone-corpse",
            position = drone.position,
            force = drone.force,
            inventory_size = size
        })

        -- transfer all items to corpse
        for i = 1, #drone_inv do
            local stack = drone_inv[i]
            if stack.valid_for_read then
                corpse.insert(stack)
            end
        end

    end

    -- blow up drone and dummy
    drone.destroy()
    dummy.destroy()

    -- unregister
    storage.ei.drone.port[entity.unit_number] = nil

end


function model.create_drone_user_permission_group()

    local group = game.permissions.create_group("drone-user")

    -- copy default permissions
    local default = game.permissions.get_group("Default")

    -- loop over defines.input_action and set group permissions to default
    for _, action in pairs(defines.input_action) do
        group.set_allows_action(action, default.allows_action(action))
    end

    local false_actions = {
        defines.input_action.toggle_driving,
        defines.input_action.change_shooting_state,
        --defines.input_action.craft     
    }

    for _, action in ipairs(false_actions) do
        group.set_allows_action(action, false)
    end


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
                page = "gate"
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
            name = "drone-camera",
            position = {0, 0},
            surface_index = 1,
            zoom = 2,
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
                action = "set-uplink",
                parent_gui = "ei_drone-port-console",
            }
        }
    end

    local data = model.get_data(player.opened)
    model.update_gui(player, data)

end


function model.get_data(drone_port)

    if not drone_port then return end

    -- check if drone port is registered
    model.check_global_init()

    if not storage.ei.drone.port[drone_port.unit_number] then return end

    local data = {}

    data.drone = storage.ei.drone.port[drone_port.unit_number].drone
    data.steer_state = false

    if storage.ei.drone.port[drone_port.unit_number].driver then
        data.steer_state = true
    end

    return data

end


function model.update_gui(player, data)

    if not data then return end

    local root = player.gui.relative["ei_drone-port-console"]
    local control = root["main-container"]["control-flow"]

    local camera = control["camera-frame"]["drone-camera"]
    local steer_button = control["steer-button"]

    -- fix camera to drone
    camera.entity = data.drone
    camera.surface_index = data.drone.surface.index

    -- update steer button
    if data.steer_state then
        steer_button.caption = {"exotic-industries.drone-port-gui-control-steer-button", "ACTIVE"}
        steer_button.style = "ei_small_green_button"
    else
        steer_button.caption = {"exotic-industries.drone-port-gui-control-steer-button", "INACTIVE"}
        steer_button.style = "ei_small_red_button"
    end

end


function model.make_uplink(player)

    local entity = player.opened
    local root = player.gui.relative["ei_drone-port-console"]
    if not root then return end
    if not entity.valid then return end

    if entity.name ~= "ei_drone-port" then return end
    if player.vehicle then return end

    if storage.ei.drone.port[entity.unit_number].driver then return end

    local current_character = player.character
    if not current_character then return end

    -- check if port has enough energy
    if entity.energy < 1000 then return end

    local dummy = storage.ei.drone.port[entity.unit_number].dummy

    -- make old player character "op" and then swap to dummy in drone
    current_character.destructible = false
    -- current_character.operable = false

    -- ensure dummy and player are on same surface
    player.character = nil
    player.teleport(dummy.position, dummy.surface)

    player.character = dummy

    -- register driver
    storage.ei.drone.port[entity.unit_number].driver = player
    storage.ei.drone.port[entity.unit_number].original_character = current_character
    storage.ei.drone.driver[player.index] = entity.unit_number

    -- change player permission group to "drone-user", normal is "Default"
    if not game.permissions.get_group("drone-user") then
        model.create_drone_user_permission_group()
    end

    --game.permissions.get_group("drone-user").add_player(player)
    --game.permissions.get_group("Default").remove_player(player)
    player.permission_group = game.permissions.get_group("drone-user")

    model.add_exit_gui(player)

end


function model.add_exit_gui(player)

    -- add to left of screen
    local left_gui = player.gui.left

    local root = left_gui.add{
        type = "frame",
        name = "ei_drone-exit-console",
        direction = "vertical",
    }

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
            caption = {"exotic-industries.drone-exit-gui-control-title"},
            style = "subheader_caption_label",
        }
    
        local control_flow = main_container.add{
            type = "flow",
            name = "control-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        -- Exit button
        control_flow.add{
            type = "label",
            caption = {"exotic-industries.drone-exit-gui-control-exit-label"},
        }
        control_flow.add{
            type = "button",
            name = "exit-button",
            caption = {"exotic-industries.drone-exit-gui-control-exit-button", "EXIT"},
            tooltip = {"exotic-industries.drone-exit-gui-control-exit-button-tooltip"},
            style = "ei_small_red_button",
            tags = {
                action = "exit-uplink",
                parent_gui = "ei_drone-port-console", -- easier then handling to button functions
            }
        }

        -- Reset button
        control_flow.add{
            type = "label",
            caption = {"exotic-industries.drone-exit-gui-control-reset-label"},
        }
        control_flow.add{
            type = "button",
            name = "reset-button",
            caption = {"exotic-industries.drone-exit-gui-control-reset-button"},
            tooltip = {"exotic-industries.drone-exit-gui-control-reset-button-tooltip"},
            style = "ei_small_red_button",
            tags = {
                action = "reset-uplink",
                parent_gui = "ei_drone-port-console", -- easier then handling to button functions
            }
        }

    end

end


function model.exit_uplink(player)

    -- remove exit gui and restore player
    local left_gui = player.gui.left
    if left_gui["ei_drone-exit-console"] then
        left_gui["ei_drone-exit-console"].destroy()
    end

    -- search in driver for port number
    if not storage.ei.drone.driver[player.index] then return end
    local port_unit = storage.ei.drone.driver[player.index]

    -- restore player permissions
    --game.permissions.get_group("drone-user").remove_player(player)
    --game.permissions.get_group("Default").add_player(player)
    player.permission_group = game.permissions.get_group("Default")

    -- restore original player character
    local original_character = storage.ei.drone.port[port_unit].original_character
    local dummy = storage.ei.drone.port[port_unit].dummy
    local drone = storage.ei.drone.port[port_unit].drone

    -- get dummy out of drone and tp player to original character (ensure their on the same surface)
    drone.set_driver(nil)
    player.character = nil
    player.teleport(original_character.position, original_character.surface)

    -- check if dummy still exists (it should), if not make a new one
    if not dummy.valid then
        -- try to destroy old dummy
        -- dummy.destroy()

        -- print message that this should not happen and should be reported
        game.print("WARNING: An entity in the EI script was destroyed and had to be recreated. Please report this to the mod author, if possible also include your previous save file and the current session saved differently.")

        dummy = drone.surface.create_entity({
            name = "ei_drone-character",
            position = {player.position.x, player.position.y},
            force = player.force
        })
        storage.ei.drone.port[port_unit].dummy = dummy
    end

    -- fixup dummy surface, move dummy to drone surface
    if dummy.surface.index ~= drone.surface.index then
        dummy.destroy()
        dummy = drone.surface.create_entity({
            name = "ei_drone-character",
            position = {player.position.x, player.position.y},
            force = player.force
        })
    end

    -- swap and get dummy back into
    player.character = original_character
    drone.set_driver(dummy)
    
    -- deop original character
    original_character.destructible = true
    -- original_character.operable = true

    -- cleanup
    storage.ei.drone.port[port_unit].driver = nil
    storage.ei.drone.port[port_unit].original_character = nil
    storage.ei.drone.driver[player.index] = nil

    local center_gui = player.gui.center
    if center_gui["ei_drone-exit-confirm-console"] then
        center_gui["ei_drone-exit-confirm-console"].destroy()
    end

end


function model.try_reset_uplink(player)

    -- open up new gui to confirm reset
    model.make_confirm_gui(player)

end


function model.stop_reset_uplink(player)

    -- remove confirm gui
    local center_gui = player.gui.center
    if center_gui["ei_drone-exit-confirm-console"] then
        center_gui["ei_drone-exit-confirm-console"].destroy()
    end

end


function model.reset_uplink(player)

    -- teleport drone to its drone port

    -- search in driver for port number
    if not storage.ei.drone.driver[player.index] then return end
    local port_unit = storage.ei.drone.driver[player.index]

    local drone = storage.ei.drone.port[port_unit].drone
    local port = storage.ei.drone.port[port_unit].entity

    drone.teleport(port.position, port.surface)

    -- spawn a gate animation at the drone port
    rendering.draw_animation{
        animation = "ei_exit-simple",
        target = drone.position,
        surface = drone.surface,
        render_layer = "object",
        animation_speed = 0.6,
        x_scale = 1,
        y_scale = 1,
        time_to_live = 180,
    }

    local center_gui = player.gui.center
    if center_gui["ei_drone-exit-confirm-console"] then
        center_gui["ei_drone-exit-confirm-console"].destroy()
    end

end


function model.make_confirm_gui(player)

    local center_gui = player.gui.center
    if center_gui["ei_drone-exit-confirm-console"] then
        center_gui["ei_drone-exit-confirm-console"].destroy()
    end

    -- add to center
    local root = center_gui.add{
        type = "frame",
        name = "ei_drone-exit-confirm-console",
        direction = "vertical",
    }

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame",
    }

    do -- Choice buttons
        main_container.add{
            type = "frame",
            style = "ei_subheader_frame",
        }.add{
            type = "label",
            caption = {"exotic-industries.drone-confirm-gui-title"},
            style = "subheader_caption_label",
        }
    
        local content_flow = main_container.add{
            type = "flow",
            name = "control-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        -- Exit button
        content_flow.add{
            type = "label",
            caption = {"exotic-industries.drone-confirm-gui-label"},
        }

        local button_flow = content_flow.add{
            type = "flow",
            name = "button-flow",
            direction = "horizontal",
        }

        button_flow.add{
            type = "button",
            name = "confirm-button",
            caption = {"exotic-industries.drone-confirm-gui-button", "Confirm"},
            style = "ei_small_green_button",
            tags = {
                action = "confirm-reset-uplink",
                parent_gui = "ei_drone-port-console", -- easier then handling to button functions
            }
        }
        button_flow.add{
            type = "button",
            name = "stop-button",
            caption = {"exotic-industries.drone-confirm-gui-button", "Cancel"},
            style = "ei_small_red_button",
            tags = {
                action = "stop-reset-uplink",
                parent_gui = "ei_drone-port-console", -- easier then handling to button functions
            }
        }
    
    end

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


function model.on_gui_click(event)
    if event.element.tags.action == "set-uplink" then
        model.make_uplink(game.get_player(event.player_index))
        return
    end

    if event.element.tags.action == "goto-informatron" then
        if game.forces["player"].technologies["ei_gate"].enabled == true then
            remote.call("informatron", "informatron_open_to_page", {
                player_index = event.player_index,
                interface = "exotic-industries-informatron",
                page_name = event.element.tags.page
            })
            return
        end
    end

    if event.element.tags.action == "reset-uplink" then
        model.try_reset_uplink(game.get_player(event.player_index))
        return
    end

    if event.element.tags.action == "confirm-reset-uplink" then
        model.reset_uplink(game.get_player(event.player_index))
        return
    end

    if event.element.tags.action == "stop-reset-uplink" then
        model.stop_reset_uplink(game.get_player(event.player_index))
        return
    end

    if event.element.tags.action == "exit-uplink" then
        model.exit_uplink(game.get_player(event.player_index))
        return
    end
end



return model