
local model = {}

function model.update_fluid_storages()
    if not global.ei.fluid_entity then
        return
    end

    if not global.ei.copper_beacon then
        return
    end

    if not global.ei.copper_beacon.fluid_script_break_point and next(global.ei.fluid_entity) then
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity)
    end

    local i = global.ei.copper_beacon.fluid_script_break_point

    -- for hot coolant let pipe explode, liquid-nitrogen turns into nitrogen-gas
    if global.ei.fluid_entity[i] and global.ei.fluid_entity[i].valid then
        local nitrogen_count = global.ei.fluid_entity[i].get_fluid_count("ei_liquid-nitrogen")
        local data_count = global.ei.fluid_entity[i].get_fluid_count("ei_computing-power")
        local oxygen_count = global.ei.fluid_entity[i].get_fluid_count("ei_liquid-oxygen")

        -- get count for plasma stuff: fluids named "ei_heated-" are considered plasma
        local fluid_contents = global.ei.fluid_entity[i].get_fluid_contents()

        if nitrogen_count > 0 then
            -- clear liquid-nitrogen from pipe and add nitrogen-gas to pipe with same amount
            global.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-nitrogen", amount = nitrogen_count})
            global.ei.fluid_entity[i].insert_fluid({name = "ei_nitrogen-gas", amount = nitrogen_count})

            -- global.ei.fluid_entity[i].die(global.ei.fluid_entity[i].force)
        end

        if oxygen_count > 0 then
            -- clear liquid-nitrogen from pipe and add nitrogen-gas to pipe with same amount
            global.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-oxygen", amount = oxygen_count})
            global.ei.fluid_entity[i].insert_fluid({name = "ei_oxygen-gas", amount = oxygen_count})

            -- global.ei.fluid_entity[i].die(global.ei.fluid_entity[i].force)
        end

        if data_count > 0 then
            -- clear and boom
            global.ei.fluid_entity[i].remove_fluid({name = "ei_liquid-nitrogen", amount = nitrogen_count})
            global.ei.fluid_entity[i].die(global.ei.fluid_entity[i].force)
        end

        for fluid_name, fluid_amount in pairs(fluid_contents) do
            if string.find(fluid_name, "ei_heated-") then
                -- clear and boom
                global.ei.fluid_entity[i].remove_fluid({name = fluid_name, amount = fluid_amount})
                global.ei.fluid_entity[i].die(global.ei.fluid_entity[i].force)
            end
        end
    end

    if next(global.ei.fluid_entity, i) then
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity, i)
    else 
        global.ei.copper_beacon.fluid_script_break_point,_ = next(global.ei.fluid_entity)
    end

end

function model.update()
    if not global.ei.copper_beacon.master then
        return
    end
    
    if not global.ei.copper_beacon.script_break_point and next(global.ei.copper_beacon.master) then
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master)
    end

    local i = global.ei.copper_beacon.script_break_point

    if global.ei.copper_beacon.master[i] then
        if global.ei.copper_beacon.master[i].entity then
            local id = global.ei.copper_beacon.master[i].slaves.slave_assembler

            update_beacon(global.ei.copper_beacon.slave[id].entity, global.ei.copper_beacon.master[i].entity)
        end
    end 

    if next(global.ei.copper_beacon.master, i) then
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master, i)
    else 
        global.ei.copper_beacon.script_break_point,_ = next(global.ei.copper_beacon.master)
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
        --global.ei.copper_beacon.master[master_entity.unit_number].state = false
        master_entity.active = true
        --game.print("on")
    else
        --global.ei.copper_beacon.master[master_entity.unit_number].state = true
        master_entity.active = false
        --game.print("off")
    end
end


function model.counts_for_fluid_handling(entity)
    -- checks if given entity should be treated as fluid handling entity
    if (entity.type == "pipe" or entity.type == "storage-tank" or entity.type == "pipe-to-ground") then
        -- dont count special pipes
        if (string.sub(entity.name, 1, 12) == "ei_insulated" or string.sub(entity.name, 1, 7) == "ei_data") then
            return false
        end

        return true
    end

    return false
end

return model