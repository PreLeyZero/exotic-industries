local model = {}

--====================================================================================================
--BLACK HOLE
--====================================================================================================

-- HOW IT WORKS
-- core building is a container that periodically absorbs all items in its inv into internal mass storage
-- also has internal battery for injected power
-- radiates x amount of power away per second

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


function model.check_init(key, id)

    if not global.ei.black_hole then
        global.ei.black_hole = {}
    end

    if not key then
        return
    end

    if not id then
        return
    end

    if not global.ei.black_hole[key] then
        global.ei.black_hole[key] = {}
    end

    if not global.ei.black_hole[key][id] then
        global.ei.black_hole[key][id] = {}
    end

end


--UPDATE
------------------------------------------------------------------------------------------------------

function model.update_black_holes()

    if not global.ei.black_hole then
        return
    end

    if not global.ei.black_hole.black_hole then
        return
    end

    for uint,_ in pairs(global.ei.black_hole.black_hole) do
        model.update_black_hole(uint)
    end

end


function model.update_black_hole(uint)

    local entity = global.ei.black_hole.black_hole[uint].entity

    if not model.entity_check(entity) then
        return
    end

    -- aborb all items in inventory and add them to mass count
    model.update_mass(uint, entity)

    model.update_battery(uint, entity)
    
    model.make_energy(uint)

    model.make_output(uint)

    model.apply_output(uint, entity)
end


function model.update_mass(uint, entity)

    local inv = entity.get_inventory(defines.inventory.chest)

    if not inv then
        return
    end

    local items = inv.get_contents()
    for name, count in pairs(items) do
        global.ei.black_hole.black_hole[uint].mass = global.ei.black_hole.black_hole[uint].mass + count
    end

    -- clear inventory
    inv.clear()

    -- game.print("Black hole mass: "..global.ei.black_hole.black_hole[uint].mass)

end


function model.update_battery(uint, entity)

    -- find all energy injectors in range
    -- check if they are running and if so add 10GW to battery for each injector

    local injectors = entity.surface.find_entities_filtered{
        name = "ei_energy-injector-pylon",
        position = entity.position,
        radius = 20,
    }

    -- game.print("Found "..#injectors.." injectors")

    global.ei.black_hole.black_hole[uint].battery = 0

    for _,injector in pairs(injectors) do

        if injector.energy > 10*1000*1000 then
            global.ei.black_hole.black_hole[uint].battery = global.ei.black_hole.black_hole[uint].battery + 1
        end

    end

    -- game.print("Black hole battery: "..global.ei.black_hole.black_hole[uint].battery)

end


function model.make_energy(uint)

    -- calc energy radiated away per second

    local mass = global.ei.black_hole.black_hole[uint].mass
    local energy = mass * 0.1
    local mass_loss = math.floor(mass * 0.005)
    
    global.ei.black_hole.black_hole[uint].mass = mass - mass_loss
    local energy = energy + mass_loss * 25 -- in GW

    -- safe this value if its 30 ticks after last save
    local tick = game.tick
    if tick - global.ei.black_hole.black_hole[uint].last_tick > 30 then
        global.ei.black_hole.black_hole[uint].energy_last = global.ei.black_hole.black_hole[uint].energy
        global.ei.black_hole.black_hole[uint].last_tick = tick
    end

    global.ei.black_hole.black_hole[uint].energy = energy

    -- game.print("Black hole energy: "..global.ei.black_hole.black_hole[uint].energy.." GW")

end


function model.make_output(uint)

    -- calc energy output

    local energy = global.ei.black_hole.black_hole[uint].energy
    local energy_last = global.ei.black_hole.black_hole[uint].energy_last

    local energy_out = (energy + energy_last) / 2

    global.ei.black_hole.black_hole[uint].energy_out = energy_out

    -- game.print("Black hole energy out: "..global.ei.black_hole.black_hole[uint].energy_out.." GW")

end


function model.apply_output(uint, entity)

    local energy_out = global.ei.black_hole.black_hole[uint].energy_out -- in GW

    -- get all extractor pylons in range
    local extractors = entity.surface.find_entities_filtered{
        name = "ei_energy-extractor-pylon",
        position = entity.position,
        radius = 20,
    }

    for _,extractor in pairs(extractors) do

        if energy_out > 100 then
            extractor.energy = 100*1000*1000*60 -- 100GW
            energy_out = energy_out - 100
        else
            extractor.energy = energy_out*1000*1000*60 -- 100GW
            energy_out = 0
        end

    end

end


--REGISTERS
------------------------------------------------------------------------------------------------------

function model.register_black_hole(entity)

    if entity.name ~= "ei_black-hole" then
        return
    end

    model.check_init("black_hole", entity.unit_number)

    -- register this black hole
    global.ei.black_hole.black_hole[entity.unit_number].entity = entity
    global.ei.black_hole.black_hole[entity.unit_number].mass = 0
    global.ei.black_hole.black_hole[entity.unit_number].battery = 0       -- energy for containement field (multiple of 5GW)
    global.ei.black_hole.black_hole[entity.unit_number].energy = 0
    global.ei.black_hole.black_hole[entity.unit_number].energy_last = 0
    global.ei.black_hole.black_hole[entity.unit_number].last_tick = game.tick
    global.ei.black_hole.black_hole[entity.unit_number].energy_out = 0 -- mean of energy values
    global.ei.black_hole.black_hole[entity.unit_number].stage = 0
    global.ei.black_hole.black_hole[entity.unit_number].stage_progress = 0 -- max 100

end


function model.unregister_black_hole(entity)

    if entity.name ~= "ei_black-hole" then
        return
    end

    model.check_init()

    -- unregister this black hole
    global.ei.black_hole.black_hole[entity.unit_number] = nil

end


function model.built_injector_pylon(entity)

end


function model.built_extractor_pylon(entity)

end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.register_black_hole(entity)

    model.built_injector_pylon(entity)

    model.built_extractor_pylon(entity)

end


function model.on_destroyed_entity(entity)

    model.unregister_black_hole(entity)

end


function model.update()

    model.update_black_holes()

end


return model

-- TODO
-- make energy extractors working
-- add stages
-- add stage progress
-- add mass limits for stages
-- add energy output limits for stages
-- add animations for pylon connections