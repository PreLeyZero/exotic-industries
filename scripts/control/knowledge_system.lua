local model = {}

--====================================================================================================
--KNOWLEDGE SYSTEM
--====================================================================================================

--UTIL AND OTHER
------------------------------------------------------------------------------------------------------

function model.check_init()

    if not global.ei.knowledge then
        global.ei.knowledge = {}
    end

end


function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.enable_knowledge(entity)

    local force = entity.force
    model.check_init()

    if global.ei.knowledge[force.name] then
        return
    end

    -- set knowledge system to enabled
    global.ei.knowledge[force.name] = {}
    global.ei.knowledge[force.name].knowledge = 0

end

--INFORMATRON PAGE
------------------------------------------------------------------------------------------------------

function model.knowledge_page(player_index, element)

    element.add{type = "label", caption = {"exotic-industries-informatron.knowledge"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.knowledge-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_knowledge-console"}

    -- show current knowledge
    element.add{type = "label", caption = {"exotic-industries-informatron.knowledge-count", global.ei.knowledge[game.players[player_index].force.name].knowledge}, style = "heading_1_label"}

    -- add tiers

end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_knowledge-console" then
        model.enable_knowledge(entity)
    end

end

return model
