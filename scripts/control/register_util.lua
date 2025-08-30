
local model = {}

--[[
==============storage structure================================
storage.ei = storage.ei

key is for according mechanic f.e. portal
sub_key for master/slave
indexed by master unit number

f.e portal machine with 2 slaves: master unit number = 1, slaves unit number = 2,3

storage.ei.portal.master[1].entity = entity of master
storage.ei.portal.master[1].slaves.slave_chest = 2
storage.ei.portal.master[1].slaves.slave_combinator = 3

storage.ei.portal.slave[2].master = 1
storage.ei.portal.slave[2].entity = slave_entity
storage.ei.portal.slave[3].master = 1
storage.ei.portal.slave[3].entity = slave_entity


--]]

--adds storage table entry for given table with keys 
function model.init(keys, master_slave)
    check_init()

    for _,key in ipairs(keys) do

        storage.ei[key] = {}

        if master_slave then 
            storage.ei[key].master = {}
            storage.ei[key].slave = {}
            
            --game.print("register")
            --game.print(key)
        end
    end
end

function model.register_fluid_entity(entity)
    if not check_init("fluid_entity") then
        return
    end

    storage.ei["fluid_entity"][entity.unit_number] = entity
end

function model.deregister_fluid_entity(entity)
    if not check_init("fluid_entity") then
        return
    end

    storage.ei["fluid_entity"][entity.unit_number] = nil
end

--[[
function model.register_collector_entity(entity)
    if not check_init("solar_collector") then
        return
    end

    storage.ei["solar_collector"][entity.unit_number] = entity
    storage.ei.satellite.collectors = storage.ei.satellite.collectors + 1
end

function model.deregister_collector_entity(entity)
    if not check_init("solar_collector") then
        return
    end

    storage.ei["solar_collector"][entity.unit_number] = nil
    storage.ei.satellite.collectors = storage.ei.satellite.collectors - 1
end
]]


--registers master entity with given key, returns entity unit number
--may provide additional information in sub_keyed_table table like {active = false, }  
function model.register_master_entity(key, entity, sub_keyed_table)
    if not check_init(key, "master") then
        return
    end

    local unit = entity.unit_number

    storage.ei[key].master[unit] = {}
    storage.ei[key].master[unit].slaves = {}
    storage.ei[key].master[unit].entity = entity

    if sub_keyed_table then
        for i,v in pairs(sub_keyed_table) do
            storage.ei[key].master[unit][i] = v
        end
    end

    return unit
end

--unregisters master entity with given key, master may be master entity or master unit number 
--returns if unregister succesfull
function model.unregister_master_entity(key, master)
    if not check_init(key, "master") then
        return
    end

    local unit_master = get_unit(master)

    if not storage.ei[key].master[unit_master] then
        return false
    end

    storage.ei[key].master[unit_master] = nil
    return true
end

--unregisters slave with given key, slave may be slave entity or unit number
--destroys slave if destroy true and slave entity is available
function model.unregister_slave_entity(key, slave, master, destroy)
    if not check_init(key, "slave") then
        return
    end

    local unit_slave = get_unit(slave)
    local slave_entity = slave 

    if not storage.ei[key].slave[unit_slave] then
        return false
    end

    if type(slave_entity) == "number" then
        if storage.ei[key].slave[unit_slave].entity then
            slave_entity = storage.ei[key].slave[unit_slave].entity
        else
            slave_entity = nil
        end
    end

    local master_unit = storage.ei[key].slave[unit_slave].master
    
    for i,v in pairs(storage.ei[key].master[master_unit].slaves) do
        if v == unit_slave then
            storage.ei[key].master[master_unit].slaves[i] = nil
        end
    end

    storage.ei[key].slave[unit_slave] = nil

    if destroy and slave_entity then
        slave_entity.destroy()
    end

    return true
end

--create slave for given master entity or master unit number, optional offset {} for position
--slaves are indestructible by default, and of master fore
--returns slave
function model.make_slave(key, master, slave_name, offset)
    if not check_init(key, "slave") then
        return
    end
    if not check_init(key, "master") then
        return
    end

    local unit_master = get_unit(master)
    local master_entity = storage.ei[key].master[unit_master].entity
    local pos = {master_entity.position.x + offset.x, master_entity.position.y + offset.y}

    local slave = master_entity.surface.create_entity{
        name = slave_name,
        position = pos,
        force = master_entity.force
    }

    slave.destructible = false

    return slave 
end

--register slave to master using master/slave as entity or unit number input
--when slave is entity then slave[id].entity will hold slave entity
--slave_name for indexing slave in master table f.e. "slave_chest"  
function model.link_slave(key, master, slave, slave_name)
    if not check_init(key, "slave") then
        return
    end
    if not check_init(key, "master") then
        return
    end
    
    local unit_master = get_unit(master)
    local unit_slave = get_unit(slave)

    storage.ei[key].master[unit_master].slaves[slave_name] = unit_slave

    storage.ei[key].slave[unit_slave] = {}
    storage.ei[key].slave[unit_slave].master = unit_master
    
    if type(slave) ~= "number" then
        storage.ei[key].slave[unit_slave].entity = slave
    end
    return true
end

function model.extend_beacon_table(key, master)
    if not check_init(key, "slave") then
        return
    end
    if not check_init(key, "master") then
        return
    end

    local unit_master = get_unit(master)

    storage.ei[key].master[unit_master].status = false
end

function model.init_beacon(key, master)
    if not check_init(key, "slave") then
        return
    end
    if not check_init(key, "master") then
        return
    end

    local unit_master = get_unit(master)
    local master_entity = storage.ei[key].master[unit_master].entity

    master_entity.active = false
end

--returns entity unit for given entity or unit number
function get_unit(input)
    local unit = 0
    if type(input) == "number" then
        unit = input 
    else 
        unit = input.unit_number
    end
    return unit
end

--check init for storage.ei.key, if nil check for storage.ei and make storage.ei 
--structure storage.ei.key.master or storage.ei.key.slave -> storage.ei.key.sub_key
function check_init(key, sub_key)
    if not storage.ei then
        init_EI() 
    end

    if key and storage.ei[key] then
        if sub_key and storage.ei[key][sub_key] then return true elseif sub_key and not storage.ei[key][sub_key] then return false end
        return true
    elseif key and not storage.ei[key] then
        return false
    end

    return true
end

--init storage.ei
function init_EI()
    storage.ei = {}
    --storage.ei.is_inited = {}
end

function model.add_spaced_update()
    storage.ei.spaced_updates = storage.ei.spaced_updates + 1
end

function model.subtract_spaced_update()
    if storage.ei.spaced_updates >= 1 then 
        storage.ei.spaced_updates = storage.ei.spaced_updates - 1
    end
end

function model.add_limited_update()
    storage.ei.limited_updates = storage.ei.limited_updates + 1
end

function model.subtract_limited_update()
    if storage.ei.limited_updates >= 1 then 
        storage.ei.limited_updates = storage.ei.limited_updates - 1
    end
end


return model