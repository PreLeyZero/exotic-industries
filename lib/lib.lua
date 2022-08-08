-- commonly used functions for the mod

local ei_lib = {}
local ei_data = require("data")

--====================================================================================================
--FUNCTION OVERIEW
--====================================================================================================

-- switch_string
-- config
-- getn
-- recipe_swap
-- recipe_swap_normal
-- recipe_swap_expensive
-- recipe_add
-- recipe_remove
-- recipe_new
-- add_prerequisite
-- remove_prerequisite
-- empty_sprite         

--====================================================================================================
--FUNCTIONS
--====================================================================================================

-- emulate switch-case in Lua for checking given string with a list of strings
-- retruns the matched element of the switch_table or nil if no match was found
-- switch_table = { ["string_condition"] = return vale, ... }

function ei_lib.switch_string(switch_table, string)
    
    -- retrun if no switch_table is given or no string is given
    if not switch_table or not string then
        return nil
    end

    -- loop over switch_table and check if string is in it
    for i,v in pairs(switch_table) do
        if string == i then
            return v
        end
    end

    -- return nil if no match was found
    return nil
end


-- quick access to startup settings
function ei_lib.config(name)
    return settings.startup["ei_"..name].value
end


-- count how many keys are in a table
function ei_lib.getn(table_in)
    local count = 0
    for _,_ in pairs(table_in) do
        count = count + 1
    end
    return count
end

--RECIPE RELATED
------------------------------------------------------------------------------------------------------

-- change ingredient in a recipe for another
function ei_lib.recipe_swap(recipe, old_ingredient, new_ingredient, amount)
    -- return if recipe or old_ingredient or new_ingredient is not given
    if not recipe or not old_ingredient or not new_ingredient then
        return
    end

    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- amount is optional here if not given new_ingredient amount is same as old_ingredient amount
    if not amount then
        -- if there are no ingredients in the recipe, return
        if not data.raw.recipe[recipe].ingredients then
            return
        end

        -- loop over ingredients and check if old_ingredient is in it
        -- then set amount
        for i,v in ipairs(data.raw.recipe[recipe].ingredients) do
            if v[1] == old_ingredient then
                amount = v[2]
            end
        end
    end

    -- loop over all ingredients of the recipe
    for i,v in pairs(data.raw.recipe[recipe].ingredients) do

        -- if ingredient is found, replace it
        -- here first index is ingredient name, second index is amount
        if v[1] == old_ingredient then
            data.raw.recipe[recipe].ingredients[i][1] = new_ingredient
            data.raw.recipe[recipe].ingredients[i][2] = amount
        end
    end
end


-- add new ingredient in recipe
function ei_lib.recipe_add(recipe, ingredient, amount)
    -- amount is optional if not give default to 1
    if not amount then
        amount = 1
    end

    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- add ingredient to recipe
    table.insert(data.raw.recipe[recipe].ingredients, {ingredient, amount})
end


-- remove ingredient from recipe
function ei_lib.recipe_remove(recipe, ingredient)
    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- loop over all ingredients of the recipe
    for i,v in pairs(data.raw.recipe[recipe].ingredients) do

        -- if ingredient is found, remove it
        -- here first index is ingredient name, second index is amount
        if v[1] == ingredient then
            table.remove(data.raw.recipe[recipe].ingredients, i)
        end
    end
end


-- set a completly set of ingredients for recipe
function ei_lib.recipe_new(recipe, table_in)
    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- set new ingredients
    data.raw.recipe[recipe].ingredients = table_in
end


-- change ingredient in a recipe for another
function ei_lib.recipe_swap_normal(recipe, old_ingredient, new_ingredient, amount)
    -- return if recipe or old_ingredient or new_ingredient is not given
    if not recipe or not old_ingredient or not new_ingredient then
        return
    end

    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe].normal then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- amount is optional here if not given new_ingredient amount is same as old_ingredient amount
    if not amount then
        -- if there are no ingredients in the recipe, return
        if not data.raw.recipe[recipe].normal.ingredients then
            return
        end

        -- loop over ingredients and check if old_ingredient is in it
        -- then set amount
        for i,v in ipairs(data.raw.recipe[recipe].normal.ingredients) do
            if v[1] == old_ingredient then
                amount = v[2]
            end
        end
    end

    -- loop over all ingredients of the recipe
    for i,v in pairs(data.raw.recipe[recipe].normal.ingredients) do

        -- if ingredient is found, replace it
        -- here first index is ingredient name, second index is amount
        if v[1] == old_ingredient then
            data.raw.recipe[recipe].normal.ingredients[i][1] = new_ingredient
            data.raw.recipe[recipe].normal.ingredients[i][2] = amount
        end
    end
end


-- change ingredient in a recipe for another
function ei_lib.recipe_swap_expensive(recipe, old_ingredient, new_ingredient, amount)
    -- return if recipe or old_ingredient or new_ingredient is not given
    if not recipe or not old_ingredient or not new_ingredient then
        return
    end

    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe].expensive then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- amount is optional here if not given new_ingredient amount is same as old_ingredient amount
    if not amount then
        -- if there are no ingredients in the recipe, return
        if not data.raw.recipe[recipe].expensive.ingredients then
            return
        end

        -- loop over ingredients and check if old_ingredient is in it
        -- then set amount
        for i,v in ipairs(data.raw.recipe[recipe].expensive.ingredients) do
            if v[1] == old_ingredient then
                amount = v[2]
            end
        end
    end

    -- loop over all ingredients of the recipe
    for i,v in pairs(data.raw.recipe[recipe].expensive.ingredients) do

        -- if ingredient is found, replace it
        -- here first index is ingredient name, second index is amount
        if v[1] == old_ingredient then
            data.raw.recipe[recipe].expensive.ingredients[i][1] = new_ingredient
            data.raw.recipe[recipe].expensive.ingredients[i][2] = amount
        end
    end
end

--TECH RELATED
------------------------------------------------------------------------------------------------------

-- add new prerequisites for tech
function ei_lib.add_prerequisite(tech, prerequisite)
    -- check if tech exists in data.raw.technology
    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    -- add prerequisite to tech
    table.insert(data.raw.technology[tech].prerequisites, prerequisite)
end

-- remove prerequisite from tech
function ei_lib.remove_prerequisite(tech, prerequisite)
    -- check if tech exists in data.raw.technology
    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    -- loop over all prerequisites of the tech
    for i,v in pairs(data.raw.technology[tech].prerequisites) do

        -- if prerequisite is found, remove it
        if v == prerequisite then
            table.remove(data.raw.technology[tech].prerequisites, i)
        end
    end
end

--====================================================================================================
--GRAPHICS FUNCTIONS
--====================================================================================================

-- get path of 64x64 empty sprite from graphics mod
function ei_lib.empty_sprite(size)
    size = size or 64

    if size == 64 then
        return ei_graphics_path.."graphics/64_empty.png"
    end

    if size == 128 then
        return ei_graphics_path.."graphics/128_empty.png"
    end
    
    if size == 256 then
        return ei_graphics_path.."graphics/256_empty.png"
    end

    return ei_graphics_path.."graphics/64_empty.png"
end

return ei_lib