
local model = {}

function model.update_fluid_storages()
    if not storage.ei.fluid_entity then
        return
    end

    if not storage.ei.copper_beacon then
        return
    end

    if not storage.ei.copper_beacon.fluid_script_break_point and next(storage.ei.fluid_entity) then
        storage.ei.copper_beacon.fluid_script_break_point,_ = next(storage.ei.fluid_entity)
    end

    local i = storage.ei.copper_beacon.fluid_script_break_point

    -- if this is an insulated pipe let it explode for "ei_computing-power" only
    -- for hot coolant let pipe explode, liquid-nitrogen turns into nitrogen-gas
    if storage.ei.fluid_entity[i] and storage.ei.fluid_entity[i].valid then
        local nitrogen_count = storage.ei.fluid_entity[i].get_fluid_count("ei_liquid-nitrogen")
        local data_count = storage.ei.fluid_entity[i].get_fluid_count("ei_computing-power")
        local oxygen_count = storage.ei.fluid_entity[i].get_fluid_count("ei_liquid-oxygen")

        -- is this an insulated pipe?
        if string.sub(storage.ei.fluid_entity[i].name, 1, 12) == "ei_insulated" then

            if data_count > 0 then
                -- clear and boom
                storage.ei.fluid_entity[i].remove_fluid({name = "ei_computing-power", amount = data_count})
                storage.ei.fluid_entity[i].die(storage.ei.fluid_entity[i].force)
            end

            goto continue

        end

        -- get count for plasma stuff: fluids named "ei_heated-" are considered plasma
        local fluid_contents = storage.ei.fluid_entity[i].get_fluid_contents()

        if nitrogen_count > 0 then
            -- clear liquid-nitrogen from pipe and add nitrogen-gas to pipe with same amount
            storage.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-nitrogen", amount = nitrogen_count})
            storage.ei.fluid_entity[i].insert_fluid({name = "ei_nitrogen-gas", amount = nitrogen_count})

            -- storage.ei.fluid_entity[i].die(storage.ei.fluid_entity[i].force)
        end

        if oxygen_count > 0 then
            -- clear liquid-nitrogen from pipe and add nitrogen-gas to pipe with same amount
            storage.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-oxygen", amount = oxygen_count})
            storage.ei.fluid_entity[i].insert_fluid({name = "ei_oxygen-gas", amount = oxygen_count})

            -- storage.ei.fluid_entity[i].die(storage.ei.fluid_entity[i].force)
        end

        if data_count > 0 then
            -- clear and boom
            storage.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-nitrogen", amount = nitrogen_count})
            storage.ei.fluid_entity[i].die(storage.ei.fluid_entity[i].force)
        end

        for fluid_name, fluid_amount in pairs(fluid_contents) do
            if string.find(fluid_name, "ei_heated-") then
                -- clear and boom
                storage.ei.fluid_entity[i].remove_fluid({name = fluid_name, amount = fluid_amount})
                storage.ei.fluid_entity[i].die(storage.ei.fluid_entity[i].force)
            end
        end

        ::continue::
    end

    if next(storage.ei.fluid_entity, i) then
        storage.ei.copper_beacon.fluid_script_break_point,_ = next(storage.ei.fluid_entity, i)
    else 
        storage.ei.copper_beacon.fluid_script_break_point,_ = next(storage.ei.fluid_entity)
    end

end

function model.update()
    if not storage.ei.copper_beacon.master then
        return
    end
    
    if not storage.ei.copper_beacon.script_break_point and next(storage.ei.copper_beacon.master) then
        storage.ei.copper_beacon.script_break_point,_ = next(storage.ei.copper_beacon.master)
    end

    local i = storage.ei.copper_beacon.script_break_point

    if storage.ei.copper_beacon.master[i] then
        if storage.ei.copper_beacon.master[i].entity then
            local id = storage.ei.copper_beacon.master[i].slaves.slave_assembler

            update_beacon(storage.ei.copper_beacon.slave[id].entity, storage.ei.copper_beacon.master[i].entity)
        end
    end 

    if next(storage.ei.copper_beacon.master, i) then
        storage.ei.copper_beacon.script_break_point,_ = next(storage.ei.copper_beacon.master, i)
    else 
        storage.ei.copper_beacon.script_break_point,_ = next(storage.ei.copper_beacon.master)
    end

end

--next usage
--[[
foo = {}
foo[1] = "a"
foo[2] = "b"
foo[3] = "c"
foo[4] = "d"
foo[5] = "e"
foo[6] = "f"

function update(foo, i, l)
    local k = i
    for m=1,l do
        print(foo[k])
        k,_ = next(foo, k)
        if k == nil then k,_ = next(foo) end
    end

    return k
end

print(update(foo,next(foo) ,12))
--]]


function update_beacon(slave_entity, master_entity)
    --game.print(slave_entity.energy)
    if slave_entity.energy > 0 then
        --storage.ei.copper_beacon.master[master_entity.unit_number].state = false
        master_entity.active = true
        --game.print("on")
    else
        --storage.ei.copper_beacon.master[master_entity.unit_number].state = true
        master_entity.active = false
        --game.print("off")
    end
end


function model.counts_for_fluid_handling(entity)
    -- checks if given entity should be treated as fluid handling entity
    if (entity.type == "pipe" or entity.type == "storage-tank" or entity.type == "pipe-to-ground") then
        -- dont count special pipes
        -- if (string.sub(entity.name, 1, 12) == "ei_insulated" or string.sub(entity.name, 1, 7) == "ei_data") then
        if string.sub(entity.name, 1, 7) == "ei_data" then
            return false
        end

        return true
    end

    return false
end

return model