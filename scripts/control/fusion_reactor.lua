
local model = {}

--====================================================================================================
--FUSION REACTOR
--====================================================================================================

--ON BUILT ENTITY
------------------------------------------------------------------------------------------------------

function model.entity_check(entity)
    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    if entity.name ~= "ei_fusion-reactor" then
        return false
    end

    return true
end


function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    -- set inital recipe and lock it

    entity.set_recipe("ei_fusion-F1:ei_heated-deuterium-F2:ei_heated-tritium-TM:medium-FM:medium")
    entity.recipe_locked = true

end


return model