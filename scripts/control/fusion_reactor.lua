
local model = {}

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

    entity.set_recipe("ei_fusion-F1:ei_heated-deuterium-F2:ei_heated-tritium-TM:medium-FM:medium")
    entity.recipe_locked = true

end

---Opens the fusion reactor console GUI.
---@param player LuaPlayer Player
function model.open_gui(player)
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
            caption = {"exotic-industries.fusion-reactor-gui-control-title"},
            style = "frame_title"
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
        name = "effectivity",
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
            style = "slot_button_deep_frame"
        }
        for fuel_name, _ in pairs(ei_data.fusion.fuel_combinations) do
            button_frame.add{
                type = "sprite-button",
                sprite = "fluid/" .. fuel_name,
                tooltip = {"fluid-name." .. fuel_name},
                tags = {
                    parent_gui = "ei_fusion-reactor-console",
                    action = "select-fuel",
                },
                style = "ei_slot_button_radio"
            }
        end
        control_flow.add{type = "empty-widget", style = "ei_vertical_pusher"}
    end

    local temperature_flow = control_flow.add{type = "flow", name = "temperature-flow", direction = "horizontal"}
    temperature_flow.add{type = "label", caption = {"exotic-industries.fusion-reactor-gui-temperature"}}
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
    injection_rate_flow.add{type = "label", caption = {"exotic-industries.fusion-reactor-gui-injection-rate"}}
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
end

function model.update_gui(player, data)
end

function model.update_recipe(player)
end

---Closes the console GUI.
---@param player LuaPlayer Player
function model.close_gui(player)
    if player.gui.relative["ei_fusion-reactor-console"] then
        player.gui.relative["ei_fusion-reactor-console"].destroy()
    end
end

---comment
---@param event EventData.on_gui_opened Event data
function model.on_gui_opened(event)
    model.open_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
end

return model
