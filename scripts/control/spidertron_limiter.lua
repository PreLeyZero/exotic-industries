local model = {}

--====================================================================================================
--SPIDERTRON LIMITER
--====================================================================================================

function model.remove_nonfuel_requests(entity, slot_id)

    local slot = entity.get_vehicle_logistic_slot(slot_id)

    if slot == nil then
        return
    end

    if slot.name == nil then
        return
    end

    local item = prototypes.item[slot.name]

    if item.fuel_category then
        if item.fuel_category == "ei_fusion-fuel" or item.fuel_category == "ei_nuclear-fuel" or item.fuel_category == "chemical" then
            return 
        end
    end

    entity.clear_vehicle_logistic_slot(slot_id)

    -- send message
    game.print("Only fuel items can be requested for this spidertron.")

end


function model.on_entity_logistic_slot_changed(event)

    -- spider vehicle as spiderling should only allow request of fuel
    local entity = event.entity
    local slot_id = event.slot_index

    if entity.type ~= "spider-vehicle" then
        return
    end

    if entity.name == "sp-spiderling" then
        model.remove_nonfuel_requests(entity, slot_id)
    end

end


return model