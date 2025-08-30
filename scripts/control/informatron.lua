local model = {}

--====================================================================================================
--INFORMATRON
--====================================================================================================

remote.add_interface("exotic-industries-informatron", {
    informatron_menu = function(data)
      return model.menu(data.player_index)
    end,
    informatron_page_content = function(data)
      return model.page_content(data.page_name, data.player_index, data.element)
    end
})

--MENU
------------------------------------------------------------------------------------------------------

function model.menu(player_index)

    local player = game.get_player(player_index)
    local force = nil

    if player then
        force = player.force
    end

    local model = {
        game_related = {
            overall = 1,
            ages_and_tech = 1,
        },
        world_gen_related = {
            resources = 1,
            artifacts = 1,
        },
        new_logistics = {
            train_progression = 1,
            cranes_and_belts = 1,
        },
        new_mechanics = {
            beacon_overhaul = 1,
            specialised_pipes = 1,
            space_destinations = 1,
            induction_matrix = 1,
            exotic_stabilizer = 1,
        },
        nuclear_fission_and_fusion = {
            fission = 1,
            fusion_power = 1,
        },
    }

    -- optional pages
    if force then

        if force.technologies and force.technologies["ei_black-hole-exploration"].enabled == true then
            model.new_mechanics.black_hole = 1
        end

        -- knowledge system page
        if storage.ei and storage.ei.knowledge then

            if storage.ei.knowledge["player"] then
                model.world_gen_related.knowledge = 1
                model.world_gen_related.gate = 1
                model.world_gen_related.repair = 1

                model.world_gen_related.artifacts = nil
            end

        end

    end

    --[[
    if game.forces["player"] and game.forces["player"].technologies and game.forces["player"].technologies["ei_black-hole-exploration"].enabled == true then
        model.new_mechanics.black_hole = 1
    end
    ]]

    return model

    -- NOTE: here the force is hardcoded to player, support for multiple forces is not implemented therefore

end

-- strucure of stuff

-- GAME RELATED:
--  - remind to check settings
--  - ages and tech (tiered labs)
--  - how age progress and research works

-- WORLD GEN REALTED:
--  - resources: stone, surface patches and veins
--  - artifacts
--  - knowledge system

-- NEW LOGISTCS:
--  - EI has tons of new logistic options
--  - train progression + fuel for trains / spidertrons
--  - inserter cranes
--  - bots

-- NEW MECHANICS:
--  - Beacon overhaul
--  - spezialised pipes and cables
--  - space destinations
--  - Induction matrix
--  - Exotic explosives

-- NUCLEAR FISSION AND FUSION:
--  - changes to fission + nuclear waste
--  - HTR reactor
--  - Fusion power
--  - Neutrons and you

-- DISCOVERIES:
-- - TODO new things


--CONTENT
------------------------------------------------------------------------------------------------------

function model.exotic_industries_informatron(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.welcome"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.welcome-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_plasma-cube-logo"}

    element.add{type = "label", caption = {"exotic-industries-informatron.welcome-text-2"}}
end


function model.game_related(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.game-related"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.game-related-text"}}
end

function model.overall(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.overall"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.overall-text"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.biters"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.biters-text"}}
end

function model.ages_and_tech(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.ages-and-tech"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.ages-and-tech-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_age_progression"}

    element.add{type = "label", caption = {"exotic-industries-informatron.ages-and-tech-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.ages-and-tech-text-2"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.tech"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.tech-text"}}

    if not storage.ei.age_enabler then
        storage.ei.age_enabler = {}
        storage.ei.age_enabler.current_percentage = 0
        storage.ei.age_enabler.needed_percentage = 0
        storage.ei.age_enabler.next_age = "dark-age"
    end

    element.add{type = "label", caption = {"exotic-industries-informatron.tech-output"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.tech-output-text", string.format("%.1f",storage.ei.age_enabler.current_percentage), storage.ei.age_enabler.needed_percentage, storage.ei.age_enabler.next_age}}
end


function model.world_gen_related(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.world-gen-related"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.world-gen-related-text"}}
end

function model.resources(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.resources"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.resources-text"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.stone"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.stone-text"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.surface-patches"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.surface-patches-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_uranium_patch"}

    element.add{type = "label", caption = {"exotic-industries-informatron.veins"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.veins-text"}}
end

function model.artifacts(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.artifacts"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.artifacts-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_artifact"}
end

function model.gate(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.gate"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.gate-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_gate"}

    element.add{type = "label", caption = {"exotic-industries-informatron.drone"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.drone-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_drone"}
end

function model.repair(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.artifacts"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.artifacts-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_artifact"}

    element.add{type = "label", caption = {"exotic-industries-informatron.repair"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.repair-text"}}
end

function model.knowledge(player_index, element)
    ei_knowledge_system.knowledge_page(player_index, element)
end


function model.new_logistics(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.new-logistics"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.new-logistics-text"}}
end

function model.train_progression(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.train-progression"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.train-progression-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_train_progression"}

    element.add{type = "label", caption = {"exotic-industries-informatron.spidertron"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.spidertron-text"}}
end

function model.cranes_and_belts(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.cranes-and-belts"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.cranes-and-belts-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_robots"}

    element.add{type = "label", caption = {"exotic-industries-informatron.bots"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.bots-text"}}
end


function model.new_mechanics(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.new-mechanics"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.new-mechanics-text"}}
end

function model.beacon_overhaul(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.beacon-overhaul"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.beacon-overhaul-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_beacons"}
end

function model.specialised_pipes(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.specialised-pipes"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.specialised-pipes-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_pipes"}
end

function model.space_destinations(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_space_destinations"}

    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations-2-text"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations-3"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.space-destinations-3-text"}}
end

function model.induction_matrix(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.induction-matrix"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.induction-matrix-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_induction_matrix"}

    element.add{type = "label", caption = {"exotic-industries-informatron.induction-matrix-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.induction-matrix-2-text"}}
end

function model.exotic_stabilizer(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.exotic-stabilizers"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.exotic-stabilizers-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_exotic_stabilizers"}
end

function model.black_hole(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_black_hole"}

    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole-2-text"}}

    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole-3"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.black-hole-3-text"}}
end


function model.nuclear_fission_and_fusion(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.nuclear-fission-and-fusion"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.nuclear-fission-and-fusion-text"}}
end

function model.fission(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.fission-reactors"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.fission-reactors-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_fission_reactors"}

    element.add{type = "label", caption = {"exotic-industries-informatron.fission-reactors-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.fission-reactors-2-text"}}
end

function model.fusion_power(player_index, element)
    element.add{type = "label", caption = {"exotic-industries-informatron.fusion-power"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.fusion-power-text"}}

    local image_container = element.add{type = "flow"}
    image_container.style.horizontal_align = "center"
    image_container.style.horizontally_stretchable = true
    image_container.add{type = "sprite", sprite = "ei_fusion_power"}

    element.add{type = "label", caption = {"exotic-industries-informatron.fusion-power-2"}, style = "heading_1_label"}
    element.add{type = "label", caption = {"exotic-industries-informatron.fusion-power-2-text"}}
end

function model.page_content(page_name, player_index, element)
    if page_name == "exotic-industries-informatron" then
        model.exotic_industries_informatron(player_index, element)
    end

    -- =======================================================
    if page_name == "game_related" then
        model.game_related(player_index, element)
    end

    if page_name == "overall" then
        model.overall(player_index, element)
    end

    if page_name == "ages_and_tech" then
        model.ages_and_tech(player_index, element)
    end

    -- =======================================================
    if page_name == "world_gen_related" then
        model.world_gen_related(player_index, element)
    end

    if page_name == "resources" then
        model.resources(player_index, element)
    end

    if page_name == "repair" then
        model.repair(player_index, element)
    end

    if page_name == "artifacts" then
        model.artifacts(player_index, element)
    end

    if page_name == "knowledge" then
        model.knowledge(player_index, element)
    end

    if page_name == "gate" then
        model.gate(player_index, element)
    end

    -- =======================================================
    if page_name == "new_logistics" then
        model.new_logistics(player_index, element)
    end

    if page_name == "train_progression" then
        model.train_progression(player_index, element)
    end

    if page_name == "cranes_and_belts" then
        model.cranes_and_belts(player_index, element)
    end

    -- =======================================================
    if page_name == "new_mechanics" then
        model.new_mechanics(player_index, element)
    end

    if page_name == "beacon_overhaul" then
        model.beacon_overhaul(player_index, element)
    end

    if page_name == "specialised_pipes" then
        model.specialised_pipes(player_index, element)
    end

    if page_name == "space_destinations" then
        model.space_destinations(player_index, element)
    end

    if page_name == "induction_matrix" then
        model.induction_matrix(player_index, element)
    end

    if page_name == "exotic_stabilizer" then
        model.exotic_stabilizer(player_index, element)
    end

    if page_name == "black_hole" then
        model.black_hole(player_index, element)
    end

    -- =======================================================
    if page_name == "nuclear_fission_and_fusion" then
        model.nuclear_fission_and_fusion(player_index, element)
    end

    if page_name == "fission" then
        model.fission(player_index, element)
    end

    if page_name == "fusion_power" then
        model.fusion_power(player_index, element)
    end

end