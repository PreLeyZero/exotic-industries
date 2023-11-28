local model = {}
local resonator_recipe_to_effect = {
    ["nil"] = 0,
    ["ei_crystal_resonator:basic"] = 1,
    ["ei_crystal_resonator:overclocked"] = 2,
     
}


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

function model.get_resonator_efficiency(generator, resonator)
    if resonator.crafting_progress > 0 and resonator.energy > 1000 then
        local resonator_effect = 1
        -- check for recipe 
        resonator_effect = resonator_effect * resonator_recipe_to_effect[resonator.get_recipe().name]
        local check_position = {
            x = generator.position.x + (generator.position.x - resonator.position.x ),
            y = generator.position.y + (generator.position.y - resonator.position.y ) 
        }
        local partner_resonator = generator.surface.find_entities_filtered{
            name = "ei_crystal-resonator",
            position = check_position,
            radius = 0.1
        }
        if next(partner_resonator) == nil then
            resonator_effect = resonator_effect * -1   
        end 
        return resonator_effect
    else 
        return 0
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
    local resonators = global.ei.crystal_generator[unit].resonators

    if not resonators then 
        return 
    end

    local resonator_effect = 0 
    for _, resonator in pairs(resonators) do
        resonator_effect = resonator_effect + model.get_resonator_efficiency(entity, resonator)
    end

    -- we need to check all nearby assembly machines

    if not model.entity_check(entity) then
        return
    end

    local tick = game.tick

    -- sin(x)^{18}*sin(2x-0.5)* 8 + cos(2x)/2
    local x = (tick/10000 % math.pi * 2) * 2

    local power = math.sin(x)^18 * math.sin(2 * x - 0.5) * 8 + math.cos(2 * x)
    local mega = 1000000
    entity.power_production = (power + 1.282) * mega * resonator_effect



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

    -- register this crystal generator
    global.ei.crystal_generator[entity.unit_number].entity = entity

    local entities = entity.surface.find_entities_filtered{
        name = "ei_crystal-resonator",
        position = entity.position,
        radius = 20,
    }
    global.ei.crystal_generator[entity.unit_number].resonators = {}
    if entities ~= nil then 
        for i, resonator in pairs(entities) do 
            global.ei.crystal_generator[entity.unit_number].resonators[resonator.unit_number] = resonator
        end 
    end


end


function model.unregister_crystal_generator(entity)

    if entity.name ~= "ei_crystal-generator" then
        return
    end

    model.check_init()

    -- unregister this crystal generator
    global.ei.crystal_generator[entity.unit_number] = nil

end


function model.register_crystal_resonator(entity)

    if entity.name ~= "ei_crystal-resonator" then
        return
    end

    model.check_init(entity.unit_number)

    -- register this crystal generator
    -- global.ei.crystal_generator[entity.unit_number].entity = entity

    local entities = entity.surface.find_entities_filtered{
        name = "ei_crystal-generator",
        position = entity.position,
        radius = 20,
    }
    local nearby_generator = entities[1]
    if (nearby_generator ~= nil) then 
        global.ei.crystal_generator[nearby_generator.unit_number].resonators[entity.unit_number] = entity
    end


end


function model.unregister_crystal_resonator(entity)

    if entity.name ~= "ei_crystal-resonator" then
        return
    end

    model.check_init()

    -- unregister this crystal generator
    -- global.ei.crystal_generator[entity.unit_number] = nil

    local entities = entity.surface.find_entities_filtered{
        name = "ei_crystal-generator",
        position = entity.position,
        radius = 20,
    }
    local nearby_generator = entities[1]
    if (nearby_generator ~= nil) then 
        global.ei.crystal_generator[nearby_generator.unit_number].resonators[entity.unit_number] = nil
    end
end





--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.register_crystal_generator(entity)
    model.register_crystal_resonator(entity)

end


function model.on_destroyed_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.unregister_crystal_generator(entity)
    model.unregister_crystal_resonator(entity)
end




function model.update()

    model.update_crystal_generators()

end


--GUI HANDLERS
------------------------------------------------------------------------------------------------------

return model


-- todo:

-- create child list

-- when child placed, add it to list of children pairs and calculate the pair effiency
-- when child destroyed, remove it from the list of children pair and calulcate pair efficency

-- when parent destroyed, clear child list?

-- on parent tick, check to see if children are crafting, if they are then set power level