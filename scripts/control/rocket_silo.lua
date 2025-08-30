local model = {}

--====================================================================================================
--ROCKET SILO
--====================================================================================================

---Opens the rocket silo console GUI.
---@param player LuaPlayer Player
function model.open_gui(player)
    if player.gui.relative["ei_rocket-silo-console"] then
        model.close_gui(player)
    end

    local root = player.gui.relative.add{
        type = "frame",
        name = "ei_rocket-silo-console",
        anchor = {
            gui = defines.relative_gui_type.rocket_silo_gui,
            name = "rocket-silo",
            position = defines.relative_gui_position.right
        },
        direction = "vertical"
    }

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}
        titlebar.add{
            type = "label",
            caption = {"exotic-industries.rocket-silo-gui-title"},
            style = "frame_title"
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
                parent_gui = "ei_rocket-silo-console",
                action = "goto-informatron",
                page = "space_destinations"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame"
    }

    main_container.add{ -- Destination subheader
        type = "frame",
        style = "ei_subheader_frame"
    }.add{
        type = "label",
        caption = {"exotic-industries.rocket-silo-gui-destination-title"},
        style = "subheader_caption_label"
    }

    local destination_flow = main_container.add{
        type = "flow",
        name = "destination-flow",
        direction = "horizontal",
        style = "ei_inner_content_flow_horizontal"
    }
    destination_flow.style.horizontal_spacing = 20

    local dropdown_flow = destination_flow.add{
        type = "flow",
        name = "dropdown-flow",
        direction = "vertical"
    }

    dropdown_flow.add{
        type = "label",
        caption = {"exotic-industries.rocket-silo-gui-destination-dropdown-label"},
        tooltip = {"exotic-industries.rocket-silo-gui-destination-dropdown-label-tooltip"}
    }
    dropdown_flow.add{
        type = "drop-down",
        name = "destination",
        tags = {
            parent_gui = "ei_rocket-silo-console",
            action = "set-destination"
        }
    }

    local image_frame = destination_flow.add{
        type = "frame",
        name = "destination-sprite-frame",
        style = "ei_space_frame"
    }
    image_frame.style.padding = 10
    image_frame.add{
        type = "sprite",
        name = "destination-sprite",
        sprite = "ei_destination__moon",
        style = "ei_space_destination_sprite"
    }.style.size = 96

    main_container.add{ -- Info subheader
        type = "frame",
        style = "ei_subheader_frame_with_top_border"
    }.add{
        type = "label",
        caption = {"exotic-industries.rocket-silo-gui-information-title"},
        style = "subheader_caption_label"
    }

    local information_flow = main_container.add{
        type = "flow",
        name = "information-flow",
        direction = "vertical",
        style = "ei_inner_content_flow"
    }

    information_flow.add{
        type = "progressbar",
        name = "distance",
        style = "ei_status_progressbar",
        tooltip = {"exotic-industries.rocket-silo-gui-destination-distance-tooltip"}
    }

    information_flow.add{type = "empty-widget", style = "ei_vertical_pusher"}

    information_flow.add{
        type = "label",
        caption = {"exotic-industries.rocket-silo-gui-potential-payloads-label"},
        tooltip = {"exotic-industries.rocket-silo-gui-potential-payloads-label-tooltip"}
    }

    information_flow.add{
        type = "flow",
        name = "payload-flow",
        direction = "horizontal"
    }

    local entity = player.opened
    if entity and entity.name == "rocket-silo" and entity.get_recipe() then
        local destination = ei_planet_exploration.get_destination(entity)
        local force = player.force

        model.update_gui(player,{
            destination = destination,
            destination_list = ei_planet_exploration.get_destination_list(force),
            distance = ei_planet_exploration.get_destination_distance(destination),
            payloads = ei_planet_exploration.get_destination_input_list(force, destination, entity)
        })
    end
end

---Updates the console GUI.
---@param player LuaPlayer Player
---@param data {destination?: string, destination_list?: string[], distance: number, payloads: string[]} Table of data elements
function model.update_gui(player, data)
    local root = player.gui.relative["ei_rocket-silo-console"] --[[@as LuaGuiElement]]
    local destination = root["main-container"]["destination-flow"] --[[@as LuaGuiElement]]
    local info = root["main-container"]["information-flow"] --[[@as LuaGuiElement]]

    local dropdown = destination["dropdown-flow"]["destination"] --[[@as LuaGuiElement]]
    local sprite_frame = destination["destination-sprite-frame"] --[[@as LuaGuiElement]]
    local sprite = sprite_frame["destination-sprite"] --[[@as LuaGuiElement]]

    local distance_bar = info["distance"] --[[@as LuaGuiElement]]
    local payload_flow = info["payload-flow"] --[[@as LuaGuiElement]]

    -- Destination dropdown and sprite
    local selected_index
    local destination_strings = {}
    for i, possible_destination in pairs(data.destination_list or {}) do
        destination_strings[i] = {"exotic-industries.rocket-silo-gui-destination-" .. possible_destination}
        if data.destination == possible_destination then
            selected_index = i --[[@as uint]]
        end
    end
    dropdown.items = destination_strings
    if selected_index then
        dropdown.selected_index = selected_index
    end
    dropdown.tags = {
        parent_gui = "ei_rocket-silo-console",
        action = "set-destination",
        destination_list = data.destination_list
    }
    sprite.sprite = "ei_destination__" .. data.destination

    -- Information panel
    distance_bar.value = data.distance / 2
    if data.distance <= 2 then
        sprite_frame.style = "ei_space_frame" -- Change background of sprite frame
        distance_bar.caption = {"exotic-industries.rocket-silo-gui-destination-distance", data.distance}
        distance_bar.style = "ei_status_progressbar"
    else
        sprite_frame.style = "ei_deep_space_frame" -- Change background of sprite frame
        distance_bar.caption = {"exotic-industries.rocket-silo-gui-destination-out-of-star-system"}
        distance_bar.style = "ei_status_progressbar_purple"
    end

    payload_flow.clear()
    if next(data.payloads) then
        for _, item in pairs(data.payloads) do
            payload_flow.add{
                type = "sprite-button",
                sprite = "item/" .. item,
                tooltip = {"item-name." .. item},
                style = "transparent_slot"
            }
        end
    else
        payload_flow.add{
            type = "label",
            caption = {"exotic-industries.rocket-silo-gui-potential-payloads-none"}
        }
    end
end

---Updates the open entity's current recipe with the destination set in the GUI.
---@param player LuaPlayer Player
function model.update_recipe(player)
    local entity = player.opened
    local root = player.gui.relative["ei_rocket-silo-console"]
    if not root or not entity then return end

    if entity.name ~= "rocket-silo" then return end
    ---@cast entity LuaEntity

    local dropdown = root["main-container"]["destination-flow"]["dropdown-flow"]["destination"] --[[@as LuaGuiElement]]
    local selected_destination = dropdown.tags.destination_list[dropdown.selected_index]

    local result = ei_planet_exploration.set_destination(entity, selected_destination)
    if not result then
        -- If modifying the recipe failed, get currently set destination (from recipe)
        player.print({"exotic-industries.rocket-silo-gui-destination-cannot-be-changed"})
        selected_destination = ei_planet_exploration.get_destination(entity)
    end

    local force = player.force
    model.update_gui(player,{
        destination = selected_destination,
        destination_list = ei_planet_exploration.get_destination_list(force),
        distance = ei_planet_exploration.get_destination_distance(selected_destination),
        payloads = ei_planet_exploration.get_destination_input_list(force, selected_destination, entity)
    })
end

---Closes the console GUI.
---@param player LuaPlayer Player
function model.close_gui(player)
    if player.gui.relative["ei_rocket-silo-console"] then
        player.gui.relative["ei_rocket-silo-console"].destroy()
    end
end

---Handles changes in destination dropdown selection.
---@param event EventData.on_gui_selection_state_changed Event data
function model.on_gui_selection_state_changed(event)
    local action = event.element.tags.action

    if action == "set-destination" then
        model.update_recipe(game.get_player(event.player_index) --[[@as LuaPlayer]])
    end
end

---Handles button clicks for this GUI.
---@param event EventData.on_gui_click Event data
function model.on_gui_click(event)
    local action = event.element.tags.action

    if action == "goto-informatron" then
        remote.call("informatron", "informatron_open_to_page", {
            player_index = event.player_index,
            interface = "exotic-industries-informatron",
            page_name = event.element.tags.page,
        })
    end
end

return model
