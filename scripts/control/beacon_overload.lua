
local model = {}

--====================================================================================================
--BEACON OVERLOAD
--====================================================================================================

--UTIL
------------------------------------------------------------------------------------------------------

function model.entity_check(entity)
    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.allows_effects(entity)
    -- exclude this machine if it doesnt allow module effects
    -- if all entries in allowed_effects are false, then it doesnt allow effects
    local allows_effects = false
    for i,v in pairs(entity.prototype.allowed_effects) do
        if v == true then
            allows_effects = true
        end
    end

    if allows_effects == false then
        return false
    end

    return true
end


function model.counts_for_overload(entity)
    
    if model.entity_check(entity) == false then
        return false
    end

    -- exclude slave entities
    if entity.name == "ei_copper-beacon_slave" then
        return false
    end

    -- assembler, furnace, lab, rocket-silo, mining-drill count for overload

    if entity.type == "assembling-machine" then
        if not model.allows_effects(entity) then
            return false
        end

        return true
    end

    if entity.type == "furnace" then
        if not model.allows_effects(entity) then
            return false
        end

        return true
    end

    if entity.type == "lab" then
        if not model.allows_effects(entity) then
            return false
        end

        return true
    end

    if entity.type == "rocket-silo" then
        if not model.allows_effects(entity) then
            return false
        end

        return true
    end

    if entity.type == "mining-drill" then
        if not model.allows_effects(entity) then
            return false
        end

        return true
    end

    return false
end


-- count how many beacons are in range of this machine, assume beacon range is 3
function model.count_beacons(entity)
    
    if model.entity_check(entity) == false then
        return 0
    end

    local count = 0
    local range = ei_data.beacon_range

    -- consider size of machine as well
    local size = entity.prototype.collision_box.right_bottom.x - entity.prototype.collision_box.left_top.x

    -- get area around machine
    local area = {
        {entity.position.x - range - size/2, entity.position.y - range - size/2},
        {entity.position.x + range + size/2, entity.position.y + range + size/2}
    }

    -- count beacon type entites in area
    local beacons = entity.surface.find_entities_filtered{
        area = area,
        type = "beacon"
    }

    -- count alien beacons + singularity beacons
    local alien_beacons = entity.surface.find_entities_filtered{
        area = area,
        name = "ei_alien-beacon"
    }
    local kr_beacons = {};
    if script.active_mods["Krastorio2"] then
        kr_beacons = entity.surface.find_entities_filtered{
            area = area,
            name = "kr-singularity-beacon"
        }
    end

    -- now add the number of iron beacons since they count double
    local iron_beacons = entity.surface.find_entities_filtered{
        area = area,
        name = "ei_iron-beacon"
    }

    return #beacons + #iron_beacons - #alien_beacons - #kr_beacons
end


function model.update_overload(entity, destroy_type, beacon_value)

    if model.entity_check(entity) == false then
        return
    end

    if not model.counts_for_overload(entity) then
        return
    end

    if not beacon_value then
        beacon_value = 1
    end

    -- update the overload for this machine
    -- get number of beacons in range and check if this machine should overload
    -- if overloaded deactivate machine, overload is above 4 beacons

    local beacons = model.count_beacons(entity)

    -- if destroy type is given and its "pre" then remove one count
    if destroy_type == "pre" then
        beacons = beacons - beacon_value
    end

    -- only continue if beacon overload is enabled in settings
    if settings.startup["ei_beacon-overload"].value == false then
        return
    end

    if beacons > 4 then
        entity.active = false
        model.add_overload_effect(entity)
        model.add_overload_icon(entity)

        ei_victory.count_value("machines_overloaded", 1)
    else
        entity.active = true
        model.remove_overload_icon(entity)
    end

end


function model.update_all_machines_in_range(entity, destroy_type, beacon_value)
    -- triggers when beacon is built or removed
    -- update all machines in range of this beacon

    if model.entity_check(entity) == false then
        return
    end

    -- get range of this beacon
    local range = entity.prototype.get_supply_area_distance()

    -- consider size of machine as well
    local size = entity.prototype.collision_box.right_bottom.x - entity.prototype.collision_box.left_top.x

    -- get area around beacon
    local area = {
        {entity.position.x - range - size/2, entity.position.y - range - size/2},
        {entity.position.x + range + size/2, entity.position.y + range + size/2}
    }

    -- get all machines in area
    local machines = entity.surface.find_entities_filtered{
        area = area,
        type = {"assembling-machine", "furnace", "lab", "rocket-silo", "mining-drill"}
    }

    -- update all machines
    for _, machine in pairs(machines) do
        model.update_overload(machine, destroy_type, beacon_value)
    end
end

--SPRITE STUFF
------------------------------------------------------------------------------------------------------

function model.add_overload_icon(entity)
    
    if model.entity_check(entity) == false then
        return
    end

    if not storage.ei.overload_icons then
        storage.ei.overload_icons = {}
    end
    
    -- check if sprite is already in storage
    if storage.ei.overload_icons[entity.unit_number] then
        return
    end

    -- spawn a overload icon at the pos of the entity
    local sprite = rendering.draw_sprite({
        sprite="ei_overload-icon",
        target=entity,
        x_scale=0.75, 
        y_scale=0.75,
        surface=entity.surface,
        render_layer=139
    })
    
    -- store the sprite in storage for later removal
    storage.ei.overload_icons[entity.unit_number] = sprite
end


function model.remove_overload_icon(entity)
    
    if model.entity_check(entity) == false then
        return
    end

    if not storage.ei.overload_icons then
        return
    end

    -- check if sprite is in storage
    if not storage.ei.overload_icons[entity.unit_number] then
        return
    end

    -- remove the sprite
    storage.ei.overload_icons[entity.unit_number].destroy()
    storage.ei.overload_icons[entity.unit_number] = nil
end


function model.add_overload_effect(entity)
    -- spawn a electrical effect at the pos of the entity
    -- also make a text saying "overloaded"

    if model.entity_check(entity) == false then
        return
    end

    -- dont do this, if there is already an icon
    if storage.ei.overload_icons[entity.unit_number] then
        return
    end

    -- spawn the roboport recharging effect at the 4 edges of the entity
    local size = entity.prototype.collision_box.right_bottom.x - entity.prototype.collision_box.left_top.x
    local pos = entity.position

    rendering.draw_animation({
        animation="ei_overload-animation",
        target={pos.x - size/2, pos.y - size/2},
        surface=entity.surface,
        render_layer=139,
        time_to_live=30
    })
    
    rendering.draw_animation({
        animation="ei_overload-animation",
        target={pos.x + size/2, pos.y - size/2},
        surface=entity.surface,
        render_layer=139,
        time_to_live=30
    })

    rendering.draw_animation({
        animation="ei_overload-animation",
        target={pos.x - size/2, pos.y + size/2},
        surface=entity.surface,
        render_layer=139,
        time_to_live=30
    })

    rendering.draw_animation({
        animation="ei_overload-animation",
        target={pos.x + size/2, pos.y + size/2},
        surface=entity.surface,
        render_layer=139,
        time_to_live=30
    })
    rendering.draw_text{
        target = {pos.x - 1, pos.y - size/2},
        text = "Beacon overload",
        color = {r=1, g=0.77, b=0},
        surface = entity.surface,
        scale = 1,
        time_to_live = 15
    }
end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)
    -- new entity was built
    -- can be a beacon or a machine

    -- if it is a machine update this machine
    if model.counts_for_overload(entity) then
        model.update_overload(entity)
    end

    -- if it is a beacon, update all machines in range
    if entity.type == "beacon" then
        model.update_all_machines_in_range(entity)
    end
end


function model.on_destroyed_entity(entity, destroy_type)
    -- entity was removed
    -- can be a beacon or a machine

    -- if it is a machine remove sprite if it exists
    if model.counts_for_overload(entity) then
        model.remove_overload_icon(entity)
    end

    -- if it is a beacon, update all machines in range
    if entity.type == "beacon" then
        local beacon_value = 1
        
        if entity.name == "ei_iron-beacon" then
            beacon_value = 2
        end

        model.update_all_machines_in_range(entity, destroy_type, beacon_value)
    end
end


return model