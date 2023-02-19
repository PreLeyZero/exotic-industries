if script.active_mods["gvv"] then require("__gvv__.gvv")() end

--====================================================================================================
--REQUIREMENTS
--====================================================================================================

ei_lib = require("lib/lib")
ei_data = require("lib/data")

local ei_tech_scaling = require("scripts/control/tech_scaling")
local ei_global = require("scripts/control/global")
local ei_age_enabler = require("scripts/control/age_enabler")
local ei_register = require("scripts/control/register_util")
local ei_powered_beacon = require("scripts/control/powered_beacon")
local ei_victory_disabler = require("scripts/control/victory_disabler")
local ei_beacon_overload = require("scripts/control/beacon_overload")
local ei_alien_spawner = require("scripts/control/alien_spawner")
local ei_spidertron_limiter = require("scripts/control/spidertron_limiter")

ei_informatron = require("scripts/control/informatron")
ei_mileston_preset = require("scripts/control/milestone_preset")
ei_matter_stabilizer = require("scripts/control/matter_stabilizer")
ei_planet_exploration = require("scripts/control/planet_exploration")
ei_neutron_collector = require("scripts/control/neutron_collector")
ei_fusion_reactor = require("scripts/control/fusion_reactor")
ei_rocket_silo = require("scripts/control/rocket_silo")
ei_induction_matrix = require("scripts/control/induction_matrix")

--====================================================================================================
--EVENTS
--====================================================================================================

--INIT
------------------------------------------------------------------------------------------------------
script.on_init(function()
    -- setup global table
    ei_global.init()

    -- init other
    ei_tech_scaling.init()
    ei_register.init({"copper_beacon"}, true)
    ei_register.init({"fluid_entity"}, false)

    -- disable vanilla victory condition by rocket launch
    ei_victory_disabler.init()
end)

--ENTITY RELATED
------------------------------------------------------------------------------------------------------

script.on_event({
    defines.events.on_built_entity,
    defines.events.on_robot_built_entity,
    defines.events.script_raised_built,
    defines.events.script_raised_revive,
    --defines.events.on_entity_cloned
    }, function(e)
    on_built_entity(e)
end)

script.on_event({
    defines.events.on_entity_died,
	defines.events.on_pre_player_mined_item,
	defines.events.on_robot_pre_mined,
	defines.events.script_raised_destroy
    }, function(e)
    on_destroyed_entity(e)
end)

script.on_event({
    defines.events.on_player_built_tile,
    defines.events.on_robot_built_tile
    }, function(e)
    on_built_tile(e)
end)

script.on_event({
    defines.events.on_player_mined_tile,
    defines.events.on_robot_mined_tile
    }, function(e)
    on_destroyed_tile(e)
end)

script.on_event(defines.events.on_tick, function() 
    updater()
end)

script.on_event(defines.events.on_console_command, function(e)
    ei_alien_spawner.give_tool(e)
end)

script.on_event(defines.events.on_player_selected_area, function(e)
    ei_alien_spawner.on_player_selected_area(e)
end)

script.on_event(defines.events.on_rocket_launched, function(e)
    ei_planet_exploration.on_rocket_launched(e)
end)

script.on_event(defines.events.on_selected_entity_changed, function(e)
    ei_matter_stabilizer.on_selected_entity_changed(e)
end)

script.on_event(defines.events.on_player_cursor_stack_changed, function(e)
    ei_matter_stabilizer.on_player_cursor_stack_changed(e)
end)

script.on_event(defines.events.on_entity_logistic_slot_changed, function(e)
    ei_spidertron_limiter.on_entity_logistic_slot_changed(e)
end)

--RESEARCH RELATED
------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_research_finished, function(e)

    -- set new tech costs
    ei_tech_scaling.on_research_finished()

    -- check if next age tech can be enabled
    ei_age_enabler.on_research_finished()

    -- rehide dummy techs if they are researched
    ei_age_enabler.hidden_listener(e)

    -- destination unlocks by tech
    ei_planet_exploration.on_research_finished(e)

end)

--WORLD RELATED
------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_chunk_generated, function(e)
    ei_alien_spawner.on_chunk_generated(e)
end)


--GUI RELATED
------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_gui_opened, function(event)
    local name = event.entity and event.entity.name

    if not name then
        return
    elseif name == "ei_fusion-reactor" then
        ei_fusion_reactor.open_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
    elseif name == "rocket-silo" then
        ei_rocket_silo.open_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
    end
end)

script.on_event(defines.events.on_gui_closed, function(event)
    local name = event.entity and event.entity.name

    if name == "ei_fusion-reactor" then
       ei_fusion_reactor.close_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
    elseif name == "rocket-silo" then
        ei_rocket_silo.close_gui(game.get_player(event.player_index) --[[@as LuaPlayer]])
    end
end)

script.on_event(defines.events.on_gui_click, function(event)
    local parent_gui = event.element.tags.parent_gui
    if not parent_gui then return end

    if parent_gui == "ei_fusion-reactor-console" then
        ei_fusion_reactor.on_gui_click(event)
    end
end)

script.on_event(defines.events.on_gui_value_changed, function(event)
    local parent_gui = event.element.tags.parent_gui
    if not parent_gui then return end

    if parent_gui == "ei_fusion-reactor-console" then
        ei_fusion_reactor.on_gui_value_changed(event)
    end
end)

script.on_event(defines.events.on_gui_selection_state_changed, function(event)
    local parent_gui = event.element.tags.parent_gui
    if not parent_gui then return end

    if parent_gui == "ei_rocket-silo-console" then
        ei_rocket_silo.on_gui_selection_state_changed(event)
    end
end)

--====================================================================================================
--HANDLERS
--====================================================================================================

--splits total load from global.ei.spaced_updates in 60 ticks
--schedules up to 100 operations in 1 tick

function updater()
    ei_global.check_init()

    for i=0, math.floor(global.ei.spaced_updates/60 + 0.5) do
        ei_powered_beacon.update()
    end

    for i=0, settings.startup["ei_max_updates_per_tick"].value do
        ei_powered_beacon.update_fluid_storages()
        ei_neutron_collector.update()
        ei_matter_stabilizer.update()
    end

    ei_alien_spawner.update()
    ei_induction_matrix.update()
end


function on_built_entity(e)
    if not e["created_entity"] and e["entity"] then
        e["created_entity"] = e["entity"]
    end

    if not e["created_entity"] then
        return
    end

    if ei_powered_beacon.counts_for_fluid_handling(e["created_entity"]) then
        ei_register.register_fluid_entity(e["created_entity"]) 
    end

    if e["created_entity"].name == "ei_copper-beacon" then
        local master_unit = ei_register.register_master_entity("copper_beacon", e["created_entity"])
        local slave_entity = ei_register.make_slave("copper_beacon", master_unit, "ei_copper-beacon_slave", {x = 0,y = 0})
        ei_register.link_slave("copper_beacon", master_unit, slave_entity, "slave_assembler")
        ei_register.init_beacon("copper_beacon", master_unit)
        ei_register.add_spaced_update()
    end

    if e["created_entity"].name == "ei_iron-beacon" then
        local master_unit = ei_register.register_master_entity("copper_beacon", e["created_entity"])
        local slave_entity = ei_register.make_slave("copper_beacon", master_unit, "ei_iron-beacon_slave", {x = 0,y = 0})
        ei_register.link_slave("copper_beacon", master_unit, slave_entity, "slave_assembler")
        ei_register.init_beacon("copper_beacon", master_unit)
        ei_register.add_spaced_update()
    end

    ei_beacon_overload.on_built_entity(e["created_entity"])
    ei_neutron_collector.on_built_entity(e["created_entity"])
    ei_fusion_reactor.on_built_entity(e["created_entity"])
    ei_planet_exploration.on_built_entity(e["created_entity"])
    ei_matter_stabilizer.on_built_entity(e["created_entity"])
    ei_induction_matrix.on_built_entity(e["created_entity"])
end


function on_built_tile(e)
    ei_induction_matrix.on_built_tile(e)
end


function on_destroyed_entity(e)
    if not e["entity"] then
        return
    end

    if e["robot"] or e["player_index"] then
        e["destroy_type"] = "pre"
    else
        e["destroy_type"] = "past"
    end

    if ei_powered_beacon.counts_for_fluid_handling(e["entity"]) then
        ei_register.deregister_fluid_entity(e["entity"])
    end

    if e["entity"].name == "ei_copper-beacon" then
        local master_unit = e["entity"].unit_number
        local slave_entity = global.ei.copper_beacon.master[master_unit].slaves.slave_assembler
        ei_register.unregister_slave_entity("copper_beacon", slave_entity ,e["entity"], true)
        ei_register.unregister_master_entity("copper_beacon", master_unit)
        ei_register.subtract_spaced_update()
    end

    if e["entity"].name == "ei_iron-beacon" then
        local master_unit = e["entity"].unit_number
        local slave_entity = global.ei.copper_beacon.master[master_unit].slaves.slave_assembler
        ei_register.unregister_slave_entity("copper_beacon", slave_entity ,e["entity"], true)
        ei_register.unregister_master_entity("copper_beacon", master_unit)
        ei_register.subtract_spaced_update()
    end

    ei_beacon_overload.on_destroyed_entity(e["entity"], e["destroy_type"])
    ei_neutron_collector.on_destroyed_entity(e["entity"], e["destroy_type"])
    ei_alien_spawner.on_destroyed_entity(e["entity"])
    ei_matter_stabilizer.on_destroyed_entity(e["entity"])
    ei_induction_matrix.on_destroyed_entity(e["entity"])
end


function on_destroyed_tile(e)
    ei_induction_matrix.on_destroyed_tile(e)
end