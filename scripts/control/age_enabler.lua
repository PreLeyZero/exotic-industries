-- age techs will get researchable, if a certain percentage of techs from the previous age is researched

local age_enabler = {}

--====================================================================================================
--AGE ENABLER
--====================================================================================================

function age_enabler.get_researched_age_techs(force, dummy_tech)
    -- count how many techs from a age are researched
    -- this is counted as those techs are prerequisites of the dummy tech

    local researchedAgeTechs = 0
    local dummy_prototype = prototypes.technology[dummy_tech]
    local dummy_list = dummy_prototype.prerequisites
    -- dummy_list of the form {"tech_1", "tech_2", ...}

    -- dummy_list lenght is total of resarchable techs from previous age that count
    local totalTechs = ei_lib.getn(dummy_list)

    if not dummy_prototype then
        log("Error: "..dummy_tech.." not found in prototypes.technology")
        game.print("Error: "..dummy_tech.." not found in prototypes.technology")
        return
    end

    -- loop over all techs from the dummy_list and count them if they are researched
    for _,v in pairs(dummy_list) do
        if force.technologies[v.name].researched then
            researchedAgeTechs = researchedAgeTechs + 1
        end
    end

    return researchedAgeTechs, totalTechs
end


function age_enabler.on_research_finished()
    -- loop over ages, since age tech names are same as age names
    -- check for every tech if X% of techs from previous age are researched
    -- if so, enable tech for research

    local neededPercentage = ei_lib.config("age-enabler__neededPercentage")

    if not storage.ei.age_enabler then
        storage.ei.age_enabler = {}
    end

    storage.ei.age_enabler.current_percentage = 0
    storage.ei.age_enabler.needed_percentage = neededPercentage
    storage.ei.age_enabler.next_age = "dark-age"



    for _,age in ipairs(ei_data.ages) do
        -- nothing todo for dark age
        if age == "dark-age" then
            goto continue
        end

        -- check if age tech is already researched or enabled
        -- if so skip it
        -- do this for player force
        force = game.forces[1]
        if not force.technologies["ei_"..age].researched then

            -- count how many techs from previous age are researched
            -- here we already have the dummy tech name as "ei_"..age
            local researchedAgeTechs, totalTechs = age_enabler.get_researched_age_techs(force, "ei_"..age.."__dummy")

            -- calculate current reasearch percentage of total techs
            -- if => then neededPercentage eneable next age tech for research
            -- here next age is "ei_"..age
            local currentPercentage = (researchedAgeTechs / totalTechs) * 100

            if currentPercentage > 0 then
                storage.ei.age_enabler.current_percentage = currentPercentage
                storage.ei.age_enabler.next_age = age
            end

            if currentPercentage >= neededPercentage then
                if not force.technologies["ei_"..age].enabled then
                    force.technologies["ei_"..age].enabled = true
                    -- print message to player
                    -- game.print({"ei_log.new_age"}, {r=0.2, g=0, b=0.5})
                    -- game.print(age, {r=0.2, g=0, b=0.5})
                    game.print({"exotic-industries.message-age-enabler", age})
                end
            end
        end
        
        ::continue::

    end
end


function age_enabler.hidden_listener(event)
    -- listen when tech is researched/enabled
    -- if its a dummy tech rehide it/unresearch it
    
    local tech = event.research
    local ages = ei_data.ages
    
    for _,age in ipairs(ages) do

        -- if researched tech is dummy tech set researched = false
        if tech.name == "ei_"..age.."__dummy" then
            tech.researched = false
            log("researched tech "..tech.name.." is a dummy tech, set researched = false")
        end
    
    end

end


return age_enabler