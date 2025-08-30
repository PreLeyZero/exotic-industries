
local model = {
    slider_array = {"low", "medium", "high"},
    slider_map = {low = 1, medium = 2, high = 3},
    temp_map = {low = "1e8 K", medium = "1e9 K", high = "1e10 K"}
}

--====================================================================================================
--FUSION REACTOR
--====================================================================================================

--ON BUILT ENTITY
------------------------------------------------------------------------------------------------------

function model.entity_check(entity)
    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    if entity.name ~= "ei_fusion-reactor" then
        return false
    end

    return true
end


function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    -- set inital recipe and lock it

    if not entity.get_recipe() then
        entity.set_recipe("ei_fusion-F1__ei_heated-deuterium-F2__ei_heated-tritium-TM__medium-FM__medium")
    end
    entity.recipe_locked = true

end

---Opens the fusion reactor console GUI.
---@param player LuaPlayer Player
function model.open_gui(player)
    if player.gui.relative["ei_fusion-reactor-console"] then
        model.close_gui(player)
    end

    local root = player.gui.relative.add{
        type = "frame",
        name = "ei_fusion-reactor-console",
        anchor = {
            gui = defines.relative_gui_type.assembling_machine_gui,
            name = "ei_fusion-reactor",
            position = defines.relative_gui_position.right
        },
        direction = "vertical"
    }

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}
        titlebar.add{
            type = "label",
            caption = {"exotic-industries.fusion-reactor-gui-title"},
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
                page = "fusion_power"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame"
    }

    main_container.add{ -- Status subheader
        type = "frame",
        style = "ei_subheader_frame"
    }.add{
        type = "label",
        caption = {"exotic-industries.fusion-reactor-gui-status-title"},
        style = "subheader_caption_label"
    }

    local status_flow = main_container.add{
        type = "flow",
        name = "status-flow",
        direction = "vertical",
        style = "ei_inner_content_flow"
    }

    status_flow.add{
        type = "progressbar",
        name = "power-output",
        style = "ei_status_progressbar"
    }
    status_flow.add{
        type = "progressbar",
        name = "neutron-flux",
        style = "ei_status_progressbar_cyan"
    }
    status_flow.add{
        type = "progressbar",
        name = "efficiency",
        style = "ei_status_progressbar_grey"
    }

    main_container.add{ -- Control subheader
        type = "frame",
        style = "ei_subheader_frame_with_top_border"
    }.add{
        type = "label",
        caption = {"exotic-industries.fusion-reactor-gui-control-title"},
        style = "subheader_caption_label"
    }

    local control_flow = main_container.add{
        type = "flow",
        name = "control-flow",
        direction = "vertical",
        style = "ei_inner_content_flow"
    }

    for i = 1, 2 do
        control_flow.add{type = "label", caption = {"exotic-industries.fusion-reactor-gui-fuel", i}}
        local button_frame = control_flow.add{
            type = "frame",
            name = "fuels-frame-" .. i,
            style = "slot_button_deep_frame"
        }
        for fuel_name, _ in pairs(ei_data.fusion.fuel_combinations) do
            button_frame.add{
                type = "sprite-button",
                sprite = "fluid/" .. fuel_name,
                tooltip = {"fluid-name." .. fuel_name},
                tags = {
                    action = "set-fuel",
                    parent_gui = "ei_fusion-reactor-console",
                    fuel_name = fuel_name
                },
                style = "ei_slot_button_radio"
            }
        end
        control_flow.add{type = "empty-widget", style = "ei_vertical_pusher"}
    end

    local temperature_flow = control_flow.add{type = "flow", name = "temperature-flow", direction = "horizontal"}
    temperature_flow.add{
        type = "label",
        caption = {"exotic-industries.fusion-reactor-gui-temperature"},
        tooltip = {"exotic-industries.fusion-reactor-gui-temperature-tooltip"}
    }
    temperature_flow.add{type = "empty-widget", style = "ei_horizontal_pusher"}
    temperature_flow.add{
        type = "label",
        name = "level"
    }
    control_flow.add{
        type = "slider",
        name = "temperature-slider",
        minimum_value = 1,
        maximum_value = 3,
        tags = {
            parent_gui = "ei_fusion-reactor-console",
            action = "set-temperature"
        },
        style = "ei_relative_gui_slider"
    }

    control_flow.add{type = "empty-widget", style = "ei_vertical_pusher"}
    local injection_rate_flow = control_flow.add{type = "flow", name = "injection-rate-flow", direction = "horizontal"}
    injection_rate_flow.add{
        type = "label",
        caption = {"exotic-industries.fusion-reactor-gui-injection-rate"},
        tooltip = {"exotic-industries.fusion-reactor-gui-injection-rate-tooltip"}
    }
    injection_rate_flow.add{type = "empty-widget", style = "ei_horizontal_pusher"}
    injection_rate_flow.add{
        type = "label",
        name = "level"
    }
    control_flow.add{
        type = "slider",
        name = "injection-rate-slider",
        minimum_value = 1,
        maximum_value = 3,
        tags = {
            parent_gui = "ei_fusion-reactor-console",
            action = "set-injection-rate"
        },
        style = "ei_relative_gui_slider"
    }

    local recipe = player.opened.get_recipe()
    if recipe then
        local recipe_name = recipe.name
        model.update_gui(player, {
            recipe_name:match("F1__(.+)-F2__"), -- fuel 1
            recipe_name:match("F2__(.+)-TM__"), -- fuel 2
            recipe_name:match("TM__(.+)-FM__"), -- temperature
            recipe_name:match("FM__(.+)") -- injection rate
        })
    end
end

---Updates the console GUI.
---@param player LuaPlayer Player
---@param data table 
function model.update_gui(player, data)
        local root = player.gui.relative["ei_fusion-reactor-console"] --[[@as LuaGuiElement]]
        local status = root["main-container"]["status-flow"] --[[@as LuaGuiElement]]
        local control = root["main-container"]["control-flow"] --[[@as LuaGuiElement]]

        local power_output_bar = status["power-output"] --[[@as LuaGuiElement]]
        local neutron_flux_bar = status["neutron-flux"] --[[@as LuaGuiElement]]
        local efficiency_bar = status["efficiency"] --[[@as LuaGuiElement]]

        local fuel_1_frame = control["fuels-frame-1"] --[[@as LuaGuiElement]]
        local fuel_2_frame = control["fuels-frame-2"] --[[@as LuaGuiElement]]
        local temperature_label = control["temperature-flow"].level
        local temperature_slider = control["temperature-slider"]
        local injection_rate_label = control["injection-rate-flow"].level
        local injection_rate_slider = control["injection-rate-slider"]

    local energy_value_MJ = ei_data.fusion.fuel_combinations[data[1]][data[2]] or 0
    local power_output_MW = (energy_value_MJ *
        ei_data.fusion.temp_modes[data[3]] *
        ei_data.fusion.fuel_injection_modes[data[4]][1])
    local neutron_flux = ei_neutron_collector.calc_fusion_flux(data[1], data[2], data[3], data[4])
    local efficiency =
        ei_data.fusion.temp_modes[data[3]] *
        ei_data.fusion.fuel_injection_modes[data[4]][1] /
        ei_data.fusion.fuel_injection_modes[data[4]][2] * 5

    power_output_bar.caption = {"exotic-industries.fusion-reactor-gui-power-output", power_output_MW}
    power_output_bar.value = power_output_MW / ei_data.fusion.max_power
    neutron_flux_bar.caption = {"exotic-industries.fusion-reactor-gui-neutron-flux", string.format("%.2f", neutron_flux)}
    neutron_flux_bar.value = neutron_flux / 2 -- Maximum flux is 2
    efficiency_bar.caption = {"exotic-industries.fusion-reactor-gui-efficiency", string.format("%.2f", efficiency * 100)}
    efficiency_bar.value = efficiency

    fuel_1_frame.tags = {selected = data[1]}
    for _, elem in pairs(fuel_1_frame.children) do
        if elem.tags.fuel_name == data[1] then
            elem.enabled = false
        else
            elem.enabled = true
        end
    end

    fuel_2_frame.tags = {selected = data[2]}
    for _, elem in pairs(fuel_2_frame.children) do
        if ei_data.fusion.fuel_combinations[data[1]][elem.tags.fuel_name] then
            elem.style = "ei_slot_button_radio"
            elem.enabled = (elem.tags.fuel_name ~= data[2]) and true or false
        else
            elem.style = "slot_button"
            elem.enabled = false
        end
    end

    temperature_label.caption = model.temp_map[data[3]]
    temperature_slider.slider_value = model.slider_map[data[3]]

    injection_rate_label.caption = {"exotic-industries.fusion-reactor-gui-" .. data[4]}
    injection_rate_slider.slider_value = model.slider_map[data[4]]
end

---Updates the open entity's current recipe with information gleaned from the GUI.
---@param player LuaPlayer Player
function model.update_recipe(player)
    local entity = player.opened
    local root = player.gui.relative["ei_fusion-reactor-console"]
    if not root or not entity then return end

    local control = root["main-container"]["control-flow"] --[[@as LuaGuiElement]]
    local fuel_1_frame = control["fuels-frame-1"] --[[@as LuaGuiElement]]
    local fuel_2_frame = control["fuels-frame-2"] --[[@as LuaGuiElement]]
    local temperature_slider = control["temperature-slider"] --[[@as LuaGuiElement]]
    local injection_rate_slider = control["injection-rate-slider"] --[[@as LuaGuiElement]]

    local fuel_1 = fuel_1_frame.tags.selected
    local fuel_2 = fuel_2_frame.tags.selected

    if not ei_data.fusion.fuel_combinations[fuel_1][fuel_2] then
        fuel_2, _ = next(ei_data.fusion.fuel_combinations[fuel_1])
    end

    local temperature = model.slider_array[temperature_slider.slider_value]
    local injection_rate = model.slider_array[injection_rate_slider.slider_value]

    local recipe = string.format(
        "ei_fusion-F1__%s-F2__%s-TM__%s-FM__%s",
        fuel_1, fuel_2, temperature, injection_rate
    )
    if prototypes.recipe[recipe] then
        entity.set_recipe(recipe)
        model.update_gui(player, {fuel_1, fuel_2, temperature, injection_rate})
        ei_neutron_collector.update_neutron_collectors_in_range(entity)
    end
end

---Closes the console GUI.
---@param player LuaPlayer Player
function model.close_gui(player)
    if player.gui.relative["ei_fusion-reactor-console"] then
        player.gui.relative["ei_fusion-reactor-console"].destroy()
    end
end

---Opens fusion reaction console when entity is opened.
---@param event EventData.on_gui_opened Event data
function model.on_gui_opened(event)
    model.open_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
end

---Handles clicks on fuel slot buttons.
---@param event EventData.on_gui_click Event data
function model.on_gui_click(event)
    local action = event.element.tags.action

    if action == "set-fuel" then
        event.element.parent.tags = {selected = event.element.tags.fuel_name}
        model.update_recipe(game.get_player(event.player_index) --[[@as LuaPlayer]])
    elseif action == "goto-informatron" then
        remote.call("informatron", "informatron_open_to_page", {
            player_index = event.player_index,
            interface = "exotic-industries-informatron",
            page_name = event.element.tags.page,
        })
    end
end

---Handles slider changes.
---@param event EventData.on_gui_value_changed Event data
function model.on_gui_value_changed(event)
    local action = event.element.tags.action
    local player = game.get_player(event.player_index) --[[@as LuaPlayer]]

    if action == "set-temperature" then
        model.update_recipe(player)
        player.play_sound{path = "utility/list_box_click"}
    elseif action == "set-injection-rate" then
        model.update_recipe(player)
        player.play_sound{path = "utility/list_box_click"}
    end
end

return model
