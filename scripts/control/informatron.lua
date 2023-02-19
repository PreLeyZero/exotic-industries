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

    return {
        game_related = {
            overall = 1,
            ages_and_tech = 1,
            age_progression = 1,
        },
        world_gen_related = {
            resources = 1,
            artifacts = 1,
        },
        new_logistics = {
            train_progression = 1,
            cranes_and_belts = 1,
            bots = 1,
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
            htr_reactor = 1,
            fusion_power = 1,
            neutrons = 1,
        },
    }

end

-- strucure of stuff

-- GAME RELATED:
--  - remind to check settings
--  - ages and tech (tiered labs)
--  - how age progress and research works

-- WORLD GEN REALTED:
--  - resources: stone, surface patches and veins
--  - artifacts

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

function model.game_related(player_index, element)

    element.add{type = "label", caption = {"exotic-industries-informatron.game-related"}}

end


function model.page_content(page_name, player_index, element)

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

    if page_name == "age_progression" then
        model.age_progression(player_index, element)
    end

    -- =======================================================
    if page_name == "world_gen_related" then
        model.world_gen_related(player_index, element)
    end

    if page_name == "resources" then
        model.resources(player_index, element)
    end

    if page_name == "artifacts" then
        model.artifacts(player_index, element)
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

    if page_name == "bots" then
        model.bots(player_index, element)
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

    -- =======================================================
    if page_name == "nuclear_fission_and_fusion" then
        model.nuclear_fission_and_fusion(player_index, element)
    end

    if page_name == "fission" then
        model.fission(player_index, element)
    end

    if page_name == "htr_reactor" then
        model.htr_reactor(player_index, element)
    end

    if page_name == "fusion_power" then
        model.fusion_power(player_index, element)
    end

    if page_name == "neutrons" then
        model.neutrons(player_index, element)
    end

end