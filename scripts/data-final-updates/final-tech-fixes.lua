-- treat tech mainly added by other mods
-- swap vanilla science packs with ei_science packs
-- TODO: add recursive age inclusion

local ei_data = require("lib/data")

--====================================================================================================
--UTIL
--====================================================================================================

local function hide_temp_techs()
    -- disable and hide "ei_temp-tech" and all techs that require it
    for i,v in pairs(data.raw.technology) do
        if data.raw.technology[i].prerequisites then
            for x,y in ipairs(data.raw.technology[i].prerequisites) do
                if y == "ei_temp" then
                    data.raw.technology[i].enabled = false
                    data.raw.technology[i].hidden = true
                end
            end
        end
    end

    -- hide "ei_temp-tech"
    data.raw.technology["ei_temp"].hidden = true
end


local function set_packs(tech, ingredients, exclude)
    -- test if tech is in data.raw
    if not data.raw["technology"][tech] then
        log("Error: "..tech.." not found in data.raw")
        return
    end

    if exclude[tech] then
        return
    end

    -- set pack for tech
    data.raw["technology"][tech].unit.ingredients = ingredients

end


local function fix_age_packs(packs, exclude)
    -- loop over all techs and set their unit ingedients according to their age

    for i,v in pairs(data.raw.technology) do
        if data.raw.technology[i].age then
            set_packs(i, packs[data.raw.technology[i].age], exclude)
        end
    end

end



local function get_ages(tech)

    -- if tech unlocks an age tech pack, give the age corresponding to the tech pack
    if ei_data.tech_ages_with_sub[tech.name] then
        return {ei_data.tech_ages_with_sub[tech.name]}
    end

    if tech.age then
        return {tech.age}
    end

    if not tech.prerequisites then
        return {}
    end

    local return_ages = {}
    
    for i,v in ipairs(tech.prerequisites) do
        local ages = get_ages(data.raw.technology[v])
        if ages then
            for x,y in ipairs(ages) do
                table.insert(return_ages, y)
            end
        end
    end

    return return_ages

end


local function get_highest_age(ages)

    local highest_age = "dark-age"

    if ages == nil then
        return highest_age
    end

    for i,v in ipairs(ages) do

        if not ei_data.ages_with_sub[v] then
            goto continue
        end

        if not ei_data.ages_with_sub[highest_age] then
            goto continue
        end

        if ei_data.ages_with_sub[v] > ei_data.ages_with_sub[highest_age] then
            highest_age = v
        end

        ::continue::

    end

    return highest_age

end


--====================================================================================================
--PRREREQ TECH FIXES
--====================================================================================================

local science_packs = ei_data.science
local tech_swap_dict = ei_data.tech_swap_dict
local exclude = {
    ["electric-engine"] = true,
    ["ei_electricity-power"] = true
}

-- also get all techs wich have space science pack as prereuisite
-- swap this with ei_quantum-age

local exclude_list = ei_data.tech_exclude_list

for i,v in pairs(data.raw.technology) do

    for j,ex in ipairs(exclude_list) do
        if j == i then
            goto continue
        end
    end

    if data.raw.technology[i].prerequisites then
        for x,y in ipairs(data.raw.technology[i].prerequisites) do
            if tech_swap_dict[y] then
                data.raw.technology[i].prerequisites[x] = tech_swap_dict[y]
            end
        end
    end

    ::continue::

end

-- loop over all techs and get the one that dont start with "ei_"
-- these are from base game and other mods
-- if they have the age property their fine, if not recursively get their prerequisits
-- set their age to the highest age findable

for i,tech in pairs(data.raw.technology) do

    -- if starts with ei_ skip
    if string.sub(i, 1, 3) == "ei_" then
        goto continue
    end

    -- if tech has age skip
    if tech.age then
        goto continue
    end

    -- if tech has no prerequisits skip
    if not tech.prerequisites then
        goto continue
    end

    -- get possible ages
    local ages = get_ages(tech)

    -- get highest age
    local highest_age = get_highest_age(ages)

    -- set tech age to highest age
    tech.age = highest_age

    ::continue::

end


-- remove all excluded techs from prerequisits
for i,tech in pairs(data.raw.technology) do

    if not tech.prerequisites then
        goto continue
    end

    local to_remove = {}

    -- loop over all prerequisits and remove excluded techs
    for id,prereq in ipairs(tech.prerequisites) do
        
        for _,ex in ipairs(exclude_list) do
            if prereq == ex then
                table.insert(to_remove, id)
            end
        end

    end

    -- remove excluded techs
    for _,id in ipairs(to_remove) do
        table.remove(tech.prerequisites, id)
    end

    ::continue::

end


--====================================================================================================
--FINAL TECH FIXES
--====================================================================================================

-- loop over all techs and check if they still contain a vanilla science pack
-- as cost, if so replace with ei_science pack from ei_data.science_dict

for i,v in pairs(data.raw.technology) do
    if data.raw.technology[i].unit.ingredients then
        
        -- check if tech contains vanilla science pack
        for x,y in ipairs(data.raw.technology[i].unit.ingredients) do
            if ei_data.science_dict[y[1]] then
                -- check if ei_science pack is already in tech
                local found = false
                for z,w in ipairs(data.raw.technology[i].unit.ingredients) do
                    if w[1] == ei_data.science_dict[y[1]] then
                        found = true
                    end
                end

                -- if ei_science pack is not in tech, swap vanilla science pack with ei_science pack
                if not found then
                    data.raw.technology[i].unit.ingredients[x][1] = ei_data.science_dict[y[1]]
                else
                    -- if ei_science pack is in tech, remove vanilla science pack
                    table.remove(data.raw.technology[i].unit.ingredients, x)
                end 
            end
        end
    end
end

-- loop over all techs and check if they still contain a vanilla science pack
-- if so remove it

for i,v in pairs(data.raw.technology) do
    if data.raw.technology[i].unit.ingredients then
        
        -- check if tech contains vanilla science pack
        for x,y in ipairs(data.raw.technology[i].unit.ingredients) do
            if ei_data.science_dict[y[1]] then
                -- remove vanilla science pack
                table.remove(data.raw.technology[i].unit.ingredients, x)
            end
        end
    end
end

-- check all techs and fix if a prerequisit is registered more than once
for i,v in pairs(data.raw.technology) do
    if data.raw.technology[i].prerequisites then

        local prerequisits = {}

        for x,y in ipairs(data.raw.technology[i].prerequisites) do
            if prerequisits[y] then
                table.remove(data.raw.technology[i].prerequisites, x)
            else
                prerequisits[y] = true
            end
        end

    end
end


-- if not in dev mode hide or if in devmode and show_temp is false
if not ei_mod.dev_mode then
    hide_temp_techs()
elseif not ei_mod.show_temp then
    hide_temp_techs()
end

fix_age_packs(science_packs, exclude)


-- loop over all techs and check if any of their prerequisits contain
-- a pack they dont, if so add it to the tech

local exclude_knowledge = {
    ["ei_knowledge-tech"] = true,
    ["ei_knowledge-tech-2"] = true,
    ["ei_knowledge-tech-3"] = true,
}

for tech_id,_ in pairs(data.raw.technology) do

    local tech = data.raw.technology[tech_id]

    -- skip if no prerequisits or if the only ingredient is knowledge
    if not tech.prerequisites or #tech.prerequisites == 0 then
        goto continue
    end

    if tech.unit and tech.unit.ingredients then
        if (#tech.unit.ingredients == 1 and exclude_knowledge[tech.unit.ingredients[1][1]]) then
            goto continue
        end
    end

    -- get list of all packs of prerequisits
    local prereq_packs = {}
    for _,i in ipairs(tech.prerequisites) do

        local prereq = data.raw.technology[i]

        if not prereq.unit or not prereq.unit.ingredients then
            goto skip
        end

        for _,pack in ipairs(prereq.unit.ingredients) do

            -- do not add knowledge packs
            if not exclude_knowledge[pack[1]] then
                prereq_packs[pack[1]] = true
            end

        end

        ::skip::

    end

    -- not add missing packs to tech
    local ingredients = data.raw.technology[tech_id].unit.ingredients

    for pack,_ in pairs(prereq_packs) do

        local found = false

        for _,pack2 in ipairs(ingredients) do
            if pack == pack2[1] then
                found = true
            end
        end

        if not found then
            table.insert(ingredients, {pack, 1})
        end

    end

    ::continue::

end