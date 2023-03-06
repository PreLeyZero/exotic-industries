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

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

end


function model.on_destroyed_entity(entity)

end


return model