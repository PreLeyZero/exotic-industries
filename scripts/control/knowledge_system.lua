local model = {}

--====================================================================================================
--KNOWLEDGE SYSTEM
--====================================================================================================

model.tech_tree = {
    -- tier 1
    {
        {
            {type = "schematic", name = "gate-schematic_1", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_2", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_3", cost = 100, height = 1},
            {type = "tech", name = "gate", cost = 100, height = 2, prerequisites = {"gate-schematic_1", "gate-schematic_2", "gate-schematic_3"}},
        },
        {
            {type = "schematic", name = "gate-schematic_1", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_2", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_3", cost = 100, height = 1},
            {type = "tech", name = "gate", cost = 100, height = 2, prerequisites = {"gate-schematic_1", "gate-schematic_2", "gate-schematic_3"}},
        }
    },
    {
        {
            {type = "schematic", name = "gate-schematic_1", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_2", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_3", cost = 100, height = 1},
            {type = "tech", name = "gate", cost = 100, height = 2, prerequisites = {"gate-schematic_1", "gate-schematic_2", "gate-schematic_3"}},
        }
    },
    {
        {
            {type = "schematic", name = "gate-schematic_1", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_2", cost = 100, height = 1},
            {type = "schematic", name = "gate-schematic_3", cost = 100, height = 1},
            {type = "tech", name = "gate", cost = 100, height = 2, prerequisites = {"gate-schematic_1", "gate-schematic_2", "gate-schematic_3"}},
        }
    },
    --[[
    {

    },
    {

    }
    ]]
}

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


function model.get_total_height(row_data)

    local height = 0

    for _, data in ipairs(row_data) do
        if data.height then
            if data.height > height then
                height = data.height
            end
        end
    end

    return height

end


function model.get_button_sprite(tech)

    if tech.type == "schematic" then
        return "ei_schematic"
    end

    if tech.type == "tech" then
        return "ei_knowledge-" .. tech.name
    end

end


function model.get_button_tags(tech)

    local tags = {}

    tags.cost = tech.cost
    tags.action = "select-knowledge"
    tags.name = tech.name
    tags.type = tech.type

    if tech.prerequisites then
        tags.prerequisites = tech.prerequisites
    end

    return tags

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
    model.make_tiers(player_index, element)

end


function model.make_tiers(player_index, element)

    local tree = model.tech_tree

    for tier, data in ipairs(tree) do

        -- setup tier frame
        local tier_flow = element.add{
            type = "flow",
            name = "tier-flow_" .. tier,
            direction = "vertical",
            style = "ei_inner_content_flow_vertical_centered"
            -- style = "ei_inner_content_flow"
        }

        tier_flow.add{ -- tier frame
            type = "frame",
            style = "ei_subheader_frame_with_top_border"
        }.add{
            type = "label",
            caption = {"exotic-industries-informatron.tier", tier},
            style = "subheader_caption_label"
        }

        local row_flow = tier_flow.add{
            type = "flow",
            name = "row-flow",
            direction = "horizontal",
            -- style = "ei_inner_content_flow"
        }

        -- Tier
        -- |row 1| row 2| row 3|

        -- add flows for each row
        for row, row_data in ipairs(data) do

            local inner_row_flow = row_flow.add{
                type = "flow",
                name = "inner-row-flow_" .. row,
                direction = "vertical",
                style = "ei_inner_content_flow_vertical_centered"
            }

            -- Tier
            -- |[schematic 1 schematic 2]| row 2| row 3|
            -- |[        tech           ]|  ... | ...  |
            -- [] is holder

            -- fit rows for height and add buttons
            local total_height = model.get_total_height(row_data)

            for i = 1, total_height do
                local holder = inner_row_flow.add{
                    type = "flow",
                    name = "inner_row_flow_" .. row .. "_" .. i,
                    direction = "horizontal",
                    style = "ei_inner_content_flow_horizontal_centered"
                }

                -- add buttons for this height
                for j,v in ipairs(row_data) do

                    if v.height ~= i then
                        goto continue
                    end

                    holder.add{
                        type = "sprite-button",
                        sprite = model.get_button_sprite(v),
                        tags = model.get_button_tags(v),
                        style = "ei_knowledge_sprite_button_grey"
                    }

                    ::continue::

                end

            end



        end

    end

    

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


function model.swap_gui(player)

    -- close gui of knowledge console
    if player.gui.screen and player.opened_gui_type == defines.gui_type.entity and player.opened then
        player.opened = nil
    end

    -- open informatron on knowledge page
    remote.call("informatron", "informatron_open_to_page", {
        player_index = player.index,
        interface = "exotic-industries-informatron",
        page_name = "knowledge",
    })

end

return model
