local model = {}

--====================================================================================================
--CRYSTAL GENERATOR
--====================================================================================================

--UTIL
-----------------------------------------------------------------------------------------------------
function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.check_init(id)
    if not global.ei.crystal_generator then
        global.ei.crystal_generator = {}
    end

    if not id then
        return
    end

    if not global.ei.crystal_generator[id] then
        global.ei.crystal_generator[id] = {}
    end
end

--UPDATE RELATED
-----------------------------------------------------------------------------------------------------

function model.update_crystal_generators()

    if not global.ei.crystal_generator then
        return
    end

    if not global.ei.crystal_generator then
        return
    end

    for unit,_ in pairs(global.ei.crystal_generator) do
        model.update_crystal_generator(unit)
    end

end

function model.update_crystal_generator(unit)

    local entity = global.ei.crystal_generator[unit].entity

    if not model.entity_check(entity) then
        return
    end

    local tick = game.tick

    -- sin(x)^{18}*sin(2x-0.5)* 8 + cos(2x)/2
    local x = (tick/10000 % math.pi * 2) * 2

    local power = math.sin(x)^18 * math.sin(2 * x - 0.5) * 8 + math.cos(2 * x)
    local mega = 1000000
    entity.power_production = (power + 1.282) * mega
    -- if power > 0 then
    --     entity.power_usage = 0
    -- elseif power <= 0 then 
    --     entity.power_production = 0
    --     entity.power_usage = power * mega
    -- end


end

--RENDERING
-----------------------------------------------------------------------------------------------------




--GETTERS
-----------------------------------------------------------------------------------------------------

--REGISTERS
------------------------------------------------------------------------------------------------------

function model.register_crystal_generator(entity)

    if entity.name ~= "ei_crystal-generator" then
        return
    end

    model.check_init(entity.unit_number)

    -- register this black hole
    global.ei.crystal_generator[entity.unit_number].entity = entity


end


function model.unregister_crystal_generator(entity)

    if entity.name ~= "ei_crystal-generator" then
        return
    end

    model.check_init()

    -- unregister this black hole
    global.ei.crystal_generator[entity.unit_number] = nil

end





--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.register_crystal_generator(entity)

end


function model.on_destroyed_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.unregister_crystal_generator(entity)
end




function model.update()

    model.update_crystal_generators()

end


--GUI HANDLERS
------------------------------------------------------------------------------------------------------

return model
