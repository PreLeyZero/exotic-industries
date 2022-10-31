--====================================================================================================
--REQUIREMENTS
--====================================================================================================

local ei_tech_scaling = require("scripts/control/tech_scaling")
local ei_global = require("scripts/control/global")
local ei_age_enabler = require("scripts/control/age_enabler")
local ei_register = require("scripts/control/register_util")

local ei_powered_beacon = require("scripts/control/powered_beacon")

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

script.on_event(defines.events.on_tick, function() 
    updater()
end)

--RESEARCH RELATED
------------------------------------------------------------------------------------------------------
script.on_event(defines.events.on_research_finished, function(event)

    -- set new tech costs
    ei_tech_scaling.on_research_finished()

    -- check if next age tech can be enabled
    ei_age_enabler.on_research_finished()

    -- rehide dummy techs if they are researched
    ei_age_enabler.hidden_listener(event)

end)

--====================================================================================================
--HANDLERS
--====================================================================================================

--splits total load from global.ei.spaced_updates in 60 ticks
--schedules up to 100 operations in 1 tick

function updater()
    for i=0, math.floor(global.ei.spaced_updates/60 + 0.5) do
        ei_powered_beacon.update()
    end

    for i=0, settings.startup["ei_max_updates_per_tick"].value do
        ei_powered_beacon.update_fluid_storages()
    end
end


function on_built_entity(e)
    if not e["created_entity"] and e["entity"] then
        e["created_entity"] = e["entity"]
    end

    if not e["created_entity"] then 
        return
    end

    if (e["created_entity"].type == "pipe" or e["created_entity"].type == "storage-tank" or e["created_entity"].type == "pipe-to-ground") and string.sub(e["created_entity"].name, 1, 12) ~= "ei_insulated" then
        ei_register.register_fluid_entity(e["created_entity"]) 
    end

    if e["created_entity"].name == "ei_copper-beacon" then
        local master_unit = ei_register.register_master_entity("copper_beacon", e["created_entity"])
        local slave_entity = ei_register.make_slave("copper_beacon", master_unit, "ei_copper-beacon_slave", {x = 0,y = 0})
        ei_register.link_slave("copper_beacon", master_unit, slave_entity, "slave_assembler")
        ei_register.init_beacon("copper_beacon", master_unit)
        ei_register.add_spaced_update()
    end
end


function on_destroyed_entity(e)
    if not e["entity"] then
        return
    end

    if (e["entity"].type == "pipe" or e["entity"].type == "storage-tank" or e["entity"].type == "pipe-to-ground") and string.sub(e["entity"].name, 1, 12) ~= "ei_insulated" then
        ei_register.deregister_fluid_entity(e["entity"])
    end

    if e["entity"].name == "ei_copper-beacon" then
        local master_unit = e["entity"].unit_number
        local slave_entity = global.ei.copper_beacon.master[master_unit].slaves.slave_assembler
        ei_register.unregister_slave_entity("copper_beacon", slave_entity ,e["entity"], true)
        ei_register.unregister_master_entity("copper_beacon", master_unit)
        ei_register.subtract_spaced_update()
    end
    
end