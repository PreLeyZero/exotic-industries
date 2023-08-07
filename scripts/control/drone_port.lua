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

    if not global.ei.drone.driver then
        global.ei.drone.driver = {}
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

    -- make drone "op"
    drone.operable = false
    drone.destructible = false

end


function model.destroy_port(entity)
    
    model.check_global_init()

    -- blow up the drone and spawn in a crash site chest for items
    local drone = global.ei.drone.port[entity.unit_number].drone
    local dummy = global.ei.drone.port[entity.unit_number].dummy

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
    global.ei.drone.port[entity.unit_number] = nil

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
        defines.input_action.craft     
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

    if not global.ei.drone.port[drone_port.unit_number] then return end

    local data = {}

    data.drone = global.ei.drone.port[drone_port.unit_number].drone
    data.steer_state = false

    if global.ei.drone.port[drone_port.unit_number].driver then
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

    if entity.name ~= "ei_drone-port" then return end
    if player.vehicle then return end

    if global.ei.drone.port[entity.unit_number].driver then return end

    local current_character = player.character
    if not current_character then return end

    -- check if port has enough energy
    if entity.energy < 1000 then return end

    local dummy = global.ei.drone.port[entity.unit_number].dummy

    -- make old player character "op" and then swap to dummy in drone
    current_character.destructible = false
    current_character.operable = false

    player.character = dummy

    -- register driver
    global.ei.drone.port[entity.unit_number].driver = player
    global.ei.drone.port[entity.unit_number].original_character = current_character
    global.ei.drone.driver[player.index] = entity.unit_number

    -- change player permission group to "drone-user", normal is "Default"
    if not game.permissions.get_group("drone-user") then
        model.create_drone_user_permission_group()
    end

    game.permissions.get_group("drone-user").add_player(player)
    game.permissions.get_group("Default").remove_player(player)

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
    end

end


function model.exit_uplink(player)

    -- remove exit gui and restore player
    local left_gui = player.gui.left
    if left_gui["ei_drone-exit-console"] then
        left_gui["ei_drone-exit-console"].destroy()
    end

    -- search in driver for port number
    if not global.ei.drone.driver[player.index] then return end
    local port_unit = global.ei.drone.driver[player.index]

    -- restore player permissions
    game.permissions.get_group("drone-user").remove_player(player)
    game.permissions.get_group("Default").add_player(player)

    -- restore original player character
    local original_character = global.ei.drone.port[port_unit].original_character
    local dummy = global.ei.drone.port[port_unit].dummy
    local drone = global.ei.drone.port[port_unit].drone
    player.character = original_character

    -- reseat dummy into drone
    drone.set_driver(dummy)

    -- deop original character
    original_character.destructible = true
    original_character.operable = true

    -- cleanup
    global.ei.drone.port[port_unit].driver = nil
    global.ei.drone.port[port_unit].original_character = nil
    global.ei.drone.driver[player.index] = nil

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
    end

    if event.element.tags.action == "goto-informatron" then
        --[[ 
        if game.forces["player"].technologies["ei_gate"].enabled == true then
            remote.call("informatron", "informatron_open_to_page", {
                player_index = event.player_index,
                interface = "exotic-industries-informatron",
                page_name = event.element.tags.page
            })
        end
        ]]
    end

    -- must be last
    if event.element.tags.action == "exit-uplink" then
        model.exit_uplink(game.get_player(event.player_index))
    end
end



return model