local ei_data = require("lib/data")
local model = {}

--====================================================================================================
--KNOWLEDGE SYSTEM
--====================================================================================================

-- parts are mainly obtained by scanning the fitting alien structure, but may also be researched using lots of knowledge
-- TODO:
-- add hover over info for ech tech
-- maybe add littel icon for every tech schowing price
-- implement scanner

model.tech_tree = {
    -- tier 1
    {
        {
            --{type = "part", name = "gate-part_1", cost = 1000, height = 1},
            --{type = "part", name = "gate-part_2", cost = 1000, height = 1},
            --{type = "part", name = "gate-part_3", cost = 1000, height = 1},
            {   
                type = "tech", name = "gate", cost = 100, height = 1,
                -- height = 2, prerequisites = {"gate-part_1", "gate-part_2", "gate-part_3"},
                meta = "ei_gate"
            },
        },
        {
            {type = "tech", name = "bio-chamber", cost = 100, height = 1, meta = "ei_bio-chamber"},
        },
        {
            {type = "tech", name = "crystal-accumulator-repair", cost = 100, height = 1, meta = "ei_crystal-accumulator-repair"},
        },
        --[[
        {
            {type = "part", name = "crystal-accumulator-part_1", cost = 1000, height = 1},
            {type = "part", name = "crystal-accumulator-part_2", cost = 1000, height = 1},
            {type = "tech", name = "crystal-accumulator", cost = 100, height = 2, prerequisites = {"crystal-accumulator-part_1", "crystal-accumulator-part_2"}, meta = "ei_crystal-accumulator"},
        }
        ]]
    },
    -- tier 2
    {
        {
            {type = "tech", name = "bio_insulated-wire", cost = 200, height = 1, meta = "ei_bio_insulated-wire"},
            {type = "tech", name = "bio_electronic-parts", cost = 300, height = 2, meta = "ei_bio_electronic-parts", prerequisites = {"bio_insulated-wire"}},
        },
        {
            {type = "tech", name = "bio_energy-crystal", cost = 200, height = 1, meta = "ei_bio_energy-crystal"},
            {type = "tech", name = "bio_high-energy-crystal", cost = 300, height = 2, meta = "ei_bio_high-energy-crystal", prerequisites = {"bio_energy-crystal"}},
        },
        {
            {type = "tech", name = "bio_hydrofluoric-acid", cost = 200, height = 1, meta = "ei_bio_hydrofluoric-acid"},
            {type = "tech", name = "bio_nitric-acid", cost = 300, height = 2, meta = "ei_bio_nitric-acid", prerequisites = {"bio_hydrofluoric-acid"}},
        },
        {
            {type = "tech", name = "farstation-repair", cost = 300, height = 1, meta = "ei_farstation-repair"},
        },
    },
    -- tier 3
    {
        {
            {type = "tech", name = "alien-beacon-repair", cost = 2000, height = 1, meta = "ei_alien-beacon-repair"},
        },
        {
            {type = "tech", name = "farstation", cost = 1000, height = 1, meta = "ei_farstation"},
        },
        {
            {type = "tech", name = "bio_carbon-structure", cost = 500, height = 1, meta = "ei_bio_carbon-structure"},
        },
        {
            {type = "tech", name = "bio_magnet", cost = 500, height = 1, meta = "ei_bio_magnet"},
        },
        {
            {type = "tech", name = "bio_rocket-fuel", cost = 500, height = 1, meta = "ei_bio_rocket-fuel"},
        },
    },
}


model.repair_tools = ei_data.repair_tools

-- all entities are named like ei_alien-flowers-..number
model.scanner_values = ei_data.scanner_values

--UTIL AND OTHER
------------------------------------------------------------------------------------------------------

function model.check_init()

    if not storage.ei.knowledge then
        storage.ei.knowledge = {}
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

    if storage.ei.knowledge[force.name] then return end

    -- set knowledge system to enabled
    storage.ei.knowledge[force.name] = {}
    storage.ei.knowledge[force.name].knowledge = 0

    -- setup data save
    storage.ei.knowledge[force.name].unlocks = {}

    local tree = model.tech_tree
    for tier, tier_data in ipairs(tree) do
        for row, row_data in ipairs(tier_data) do
            for i, element in ipairs(row_data) do
                local foo = {
                    name = element.name, -- names are unique in tree
                    unlocked = false,
                    tier = tier,
                }
                table.insert(storage.ei.knowledge[force.name].unlocks, foo)
            end
        end
    end

    -- hardcoded here, but no need to change as only 3 tiers
    storage.ei.knowledge[force.name].tier_1 = true
    storage.ei.knowledge[force.name].tier_2 = false
    storage.ei.knowledge[force.name].tier_3 = false

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

    if tech.type == "part" then
        return "ei_part"
    end

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
    tags.parent_gui = "ei_knowledge-gui"

    if tech.meta then
        tags.meta = tech.meta
    end

    if tech.prerequisites then
        tags.prerequisites = tech.prerequisites
    end

    return tags

end


function model.apply_effects(tags, force)

    if tags.type == "schematic" then
        -- just give research message
        force.print({"exotic-industries.schematic-researched", tags.name})
    end

    if tags.type == "part" then
        -- just give research message
        force.print({"exotic-industries.part-researched", tags.name})
    end

    if tags.type == "tech" then
        force.technologies[tags.meta].researched = true
        force.print({"exotic-industries.tech-researched", tags.meta})
    end

end


function model.is_unlocked(name, force)

    if not force then force = game.forces["player"] end
    if not storage.ei.knowledge then return false end
    if not storage.ei.knowledge[force.name] then return false end

    for i,v in ipairs(storage.ei.knowledge[force.name].unlocks) do
        if v.name == name then return v.unlocked end
    end

    return false

end


function model.set_unlocked(name, force, state)

    if not force then force = game.forces["player"] end
    if not state then state = true end
    if not storage.ei.knowledge then return false end
    if not storage.ei.knowledge[force.name] then return false end

    for i,v in ipairs(storage.ei.knowledge[force.name].unlocks) do
        if v.name == name then v.unlocked = state return true end
    end

    return false

end


function model.get_prerequisites(name)

    local tree = model.tech_tree
    for tier, tier_data in ipairs(tree) do
        for row, row_data in ipairs(tier_data) do
            for i, element in ipairs(row_data) do
                if element.name == name and element.prerequisites then
                    return element.prerequisites
                end
            end
        end
    end

    return nil

end


function model.get_tier(name)

    local tree = model.tech_tree
    for tier, tier_data in ipairs(tree) do
        for row, row_data in ipairs(tier_data) do
            for i, element in ipairs(row_data) do

                if element.name == name then
                    return "tier_" .. tier
                end

            end
        end
    end 

    return "tier_1"

end


function model.get_unlocked_state(name, force)

    -- possible "grey", "red", "green"

    if not force then force = game.forces["player"] end
    if not storage.ei.knowledge then return "red" end
    if not storage.ei.knowledge[force.name] then return "red" end

    -- already unlocked?
    if model.is_unlocked(name, force) == true then return "green" end

    -- tier unlocked?
    if storage.ei.knowledge[force.name][model.get_tier(name)] == false then return "red" end

    -- check for any prerequisites
    local prerequisites = model.get_prerequisites(name)
    if not prerequisites then return "grey" end

    for _,prerequisite in ipairs(prerequisites) do
        for i,v in ipairs(storage.ei.knowledge[force.name].unlocks) do

            -- if one is not unlocked just return red
            if v.name == prerequisite then
                if model.is_unlocked(prerequisite, force) == false then return "red" end
            end

        end
    end

    return "grey"

end


function model.update_tier_status(player_index)

    -- go through all unlocks and check if all of tier 1 and 2 are unlocked
    -- TIER 1
    local tier_1 = true
    for i,v in ipairs(storage.ei.knowledge[game.players[player_index].force.name].unlocks) do
        if v.tier == 1 and v.unlocked == false then
            tier_1 = false
            break
        end
    end

    -- TIER 2
    local tier_2 = true
    for i,v in ipairs(storage.ei.knowledge[game.players[player_index].force.name].unlocks) do
        if v.tier == 2 and v.unlocked == false then
            tier_2 = false
            break
        end
    end

    -- apply
    if tier_1 == true then
        storage.ei.knowledge[game.players[player_index].force.name].tier_2 = true
    end

    if tier_2 == true then
        storage.ei.knowledge[game.players[player_index].force.name].tier_3 = true
    end

end


--UNLOCKING LOGIC
------------------------------------------------------------------------------------------------------

function model.try_select_knowledge(player, tags)

    -- get status of knowledge
    local state = model.get_unlocked_state(tags.name, player.force)

    -- state is green, grey or red
    if state == "green" then return end
    if state == "red" then return end

    local key = player.force.name or "player"

    -- state is grey, check if player has enough knowledge and open confirm dialog
    if storage.ei.knowledge[key].knowledge < tags.cost then
        player.print({"exotic-industries.not-enough-knowledge"})
        return
    end

    model.make_confirm_gui(player, tags, storage.ei.knowledge[key].knowledge)
    return

end


-- Maybe turn this into a generic confirm gui?
function model.make_confirm_gui(player, tags, balance)

    local screen_gui = player.gui.screen
    if screen_gui["ei_knowledge-confirm-console"] then
        screen_gui["ei_knowledge-confirm-console"].destroy()
    end

    -- add to center
    local root = screen_gui.add{
        type = "frame",
        name = "ei_knowledge-confirm-console",
        direction = "vertical",
    }

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame",
    }

    do -- Choice buttons
        main_container.add{
            type = "frame",
            style = "ei_subheader_frame",
        }.add{
            type = "label",
            caption = {"exotic-industries.knowledge-confirm-gui-title"},
            style = "subheader_caption_label",
        }
    
        local content_flow = main_container.add{
            type = "flow",
            name = "control-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        -- Exit button
        content_flow.add{
            type = "label",
            caption = {"exotic-industries.knowledge-confirm-gui-label", tags.cost},
        }
        content_flow.add{
            type = "label",
            caption = {"exotic-industries.knowledge-confirm-gui-label-2", balance},
        }

        local button_flow = content_flow.add{
            type = "flow",
            name = "button-flow",
            direction = "horizontal",
        }

        button_flow.add{
            type = "button",
            name = "confirm-button",
            caption = {"exotic-industries.knowledge-confirm-gui-button", "Confirm"},
            style = "ei_small_green_button",
            tags = {
                action = "confirm-knowledge",
                parent_gui = "ei_knowledge-gui", -- easier then handling to button functions
                tags = tags,
            }
        }
        button_flow.add{
            type = "button",
            name = "exit-button",
            caption = {"exotic-industries.knowledge-confirm-gui-button", "Cancel"},
            style = "ei_small_red_button",
            tags = {
                action = "exit-knowledge",
                parent_gui = "ei_knowledge-gui", -- easier then handling to button functions
                tags = tags,
            }
        }
    
    end

    root.bring_to_front()
    root.force_auto_center()

end


function model.select_knowledge(player, tags)

    -- remove confirm gui
    local screen_gui = player.gui.screen
    if screen_gui["ei_knowledge-confirm-console"] then
        screen_gui["ei_knowledge-confirm-console"].destroy()
    end

    local key = player.force.name or "player"

    -- substract the knowledge, change state and apply effects
    storage.ei.knowledge[key].knowledge = storage.ei.knowledge[key].knowledge - tags.tags.cost
    model.set_unlocked(tags.tags.name, player.force, true)

    model.apply_effects(tags.tags, player.force)
    model.update_informatron(player)

end


function model.exit_confirm(player, tags)

    -- remove confirm gui
    local screen_gui = player.gui.screen
    if screen_gui["ei_knowledge-confirm-console"] then
        screen_gui["ei_knowledge-confirm-console"].destroy()
    end

end


function model.update_informatron(player)

    -- "dirty" relaod page
    -- close informatron gui

    if player.gui.screen["informatron"] then
        player.gui.screen["informatron"].destroy()
    end

    remote.call("informatron", "informatron_open_to_page", {
        player_index = player.index,
        interface = "exotic-industries-informatron",
        page_name = "knowledge",
    })

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
    element.add{type = "label", caption = {"exotic-industries-informatron.knowledge-count", storage.ei.knowledge[game.players[player_index].force.name].knowledge}, style = "heading_1_label"}

    -- update tier status first
    model.update_tier_status(player_index)

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
            -- |[part 1 part 2]| row 2| row 3|
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

                    local state = model.get_unlocked_state(v.name)
                    holder.add{
                        type = "sprite-button",
                        sprite = model.get_button_sprite(v),
                        tags = model.get_button_tags(v),
                        style = "ei_knowledge_sprite_button_" .. state
                    }

                    ::continue::

                end

            end

        end

    end

end


--ARTIFACT INTERACTION
------------------------------------------------------------------------------------------------------

function model.scan_artifact(event)

    local entities = event.entities --[=[@as LuaEntity[]]=]
    local player = game.get_player(event.player_index)
    
    -- ensure knowledge system is enabled
    model.enable_knowledge(player)

    local gained_value = 0

    -- destroy all alien artifacts + flowers and give knowledge to player
    -- also display little floating text with amount of knowledge gained

    for _,entity in ipairs(entities) do

        if not model.entity_check(entity) then
            goto continue
        end

        -- get name of entity without number at end and without last dash
        local base_name = entity.name

        -- if there is off in name we have multiple variants of the same entity
        if (string.find(base_name, "off") or string.find(base_name, "flowers")) then
            base_name = string.gsub(base_name, "%d", "")
            base_name = string.gsub(base_name, "-$", "")
        end

        if model.scanner_values[base_name] then

            -- when this a player made entity -> skip
            if entity.last_user then

                -- display message
                rendering.draw_text{
                    target = entity,
                    text = {"exotic-industries.scanner-no-effect"},
                    color = {r = 0.3, g = 0.36, b = 0.82},
                    surface = entity.surface,
                    scale = 1,
                    time_to_live = 120
                }

                goto continue
            end

            -- spawn floating text
            --[[
            entity.surface.create_entity{
                name = "flying-text",
                position = entity.position,
                text = "+" .. model.scanner_values[base_name].." KU",
                color = {r = 0.98, g = 0.66, b = 0.22},
            }
            ]]

            -- add knowledge
            local key = player.force.name or "player"

            gained_value = gained_value + model.scanner_values[base_name]
            storage.ei.knowledge[key].knowledge = storage.ei.knowledge[key].knowledge + model.scanner_values[base_name]

            -- destroy entity, such that it drops its loot
            local loot = entity.prototype.loot

            if loot then

                -- spawn loot by its probability
                for _,stack in ipairs(loot) do
                
                    if math.random() < stack.probability then
                        entity.surface.spill_item_stack{position=entity.position, stack={name=stack.item, count=stack.count_min}, enable_looted=true, allow_belts=false}
                    end

                end

            end

            -- invoke flower guardian
            ei_alien_spawner.on_destroyed_entity(entity)

            entity.destroy()

            ei_victory.count_value("artifacts_scanned", 1)
         
        end

        ::continue::

    end

    -- spawn the floating text above the player
    rendering.draw_text{
        target = player.position,
        text = "+" .. gained_value.." KU",
        color = {r = 0.98, g = 0.66, b = 0.22},
        surface = player.surface,
        scale = 1,
        time_to_live = 120
    }

    ei_victory.count_value("knowledge_gained", gained_value)

end


function model.repair_artifact(event)

    local item = event.item
    local entities = event.entities
    local player = game.get_player(event.player_index)

    -- check all entities for suiting target and if so repair and destroy item

    for _,entity in ipairs(entities) do

        if model.repair_tools[item].targets[entity.name] then
            
            -- spawn repaired entity and destroy old one
            local new_entity = entity.surface.create_entity{
                name = model.repair_tools[item].result,
                position = entity.position,
                force = entity.force,
                raise_built = false,
            }

            entity.destroy()

            -- remove item from inventory
            if not player then
                return
            end

            -- the tool should be in the cursor stack
            local cursor_stack = player.cursor_stack
            if not cursor_stack then
                return
            end

            if cursor_stack.valid_for_read and cursor_stack.name == item then
                cursor_stack.clear()
            end

            -- que new entity for damage ticks
            ei_gaia.register_entity(new_entity, true)
            ei_gaia.swap_entity(new_entity)

            ei_victory.count_value("artifacts_repaired", 1)

            return

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


function model.on_gui_click(event)

    if event.element.tags.action == "select-knowledge" then
        model.try_select_knowledge(game.get_player(event.player_index), event.element.tags)
        return
    end

    if event.element.tags.action == "confirm-knowledge" then
        model.select_knowledge(game.get_player(event.player_index), event.element.tags)
        return
    end

    if event.element.tags.action == "exit-knowledge" then
        model.exit_confirm(game.get_player(event.player_index), event.element.tags)
        return
    end

end


function model.on_player_selected_area(event)

    if model.repair_tools[event.item] then
        model.repair_artifact(event)
    end

    if event.item == "ei_scanner" then
        model.scan_artifact(event)
    end

end


return model
