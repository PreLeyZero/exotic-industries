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

    -- check if amount is given
    if not amount then
        
        -- if we got an amount of old_ingredient in the recipe
        -- set amount to that amount
        if data.raw.recipe[recipe].normal then
            for i,v in pairs(data.raw.recipe[recipe].normal.ingredients) do
                if v[1] == old_ingredient then
                    amount = v[2]
                end
            end
        else
            for i,v in pairs(data.raw.recipe[recipe].ingredients) do
                if v[1] == old_ingredient then
                    amount = v[2]
                end
            end
        end

        -- if amount is still nil, set it to 1
        if not amount then
            amount = 1
        end
    end

    -- check if there is a normal/expensive version of the recipe
    if data.raw.recipe[recipe].normal then

        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].normal.ingredients) do

            -- check if new ingredient is already in the recipe
            if v[1] == new_ingredient then
                ei_lib.recipe_remove(recipe, old_ingredient)
                return
            end
            -- if ingredient is found, replace it
            -- here first index is ingredient name, second index is amount
            if v[1] == old_ingredient then
                data.raw.recipe[recipe].normal.ingredients[i][1] = new_ingredient
                data.raw.recipe[recipe].normal.ingredients[i][2] = amount
            end
        end

        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].expensive.ingredients) do

            -- check if new ingredient is already in the recipe
            if v[1] == new_ingredient then
                ei_lib.recipe_remove(recipe, old_ingredient)
                return
            end
            -- if ingredient is found, replace it
            -- here first index is ingredient name, second index is amount
            if v[1] == old_ingredient then
                data.raw.recipe[recipe].expensive.ingredients[i][1] = new_ingredient
                data.raw.recipe[recipe].expensive.ingredients[i][2] = amount
            end
        end
    else
        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].ingredients) do

            -- check if new ingredient is already in the recipe
            if v[1] == new_ingredient then
                ei_lib.recipe_remove(recipe, old_ingredient)
                return
            end
            -- if ingredient is found, replace it
            -- here first index is ingredient name, second index is amount
            if v[1] == old_ingredient then
                data.raw.recipe[recipe].ingredients[i][1] = new_ingredient
                data.raw.recipe[recipe].ingredients[i][2] = amount
            end
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

    -- check if there is a normal/expensive version of the recipe
    if data.raw.recipe[recipe].normal then
        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].normal.ingredients) do
        
            -- if ingredient is found, remove it
            -- here first index is ingredient name, second index is amount
            if v[1] == ingredient then
                table.remove(data.raw.recipe[recipe].normal.ingredients, i)
            end
        end

        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].expensive.ingredients) do
        
            -- if ingredient is found, remove it
            -- here first index is ingredient name, second index is amount
            if v[1] == ingredient then
                table.remove(data.raw.recipe[recipe].expensive.ingredients, i)
            end
        end
    else
        -- loop over all ingredients of the recipe
        for i,v in pairs(data.raw.recipe[recipe].ingredients) do

            -- if ingredient is found, remove it
            -- here first index is ingredient name, second index is amount
            if v[1] == ingredient then
                table.remove(data.raw.recipe[recipe].ingredients, i)
            end
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

    -- check if there are normal/expensive variants of the recipe
    if data.raw.recipe[recipe].normal and data.raw.recipe[recipe].expensive then

        -- set normal ingredients
        data.raw.recipe[recipe].normal.ingredients = table_in
        -- set expensive ingredients
        data.raw.recipe[recipe].expensive.ingredients = table_in
    else
        -- set ingredients
        data.raw.recipe[recipe].ingredients = table_in
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

    -- if this tech has no prerequisites, create an empty table
    if not data.raw.technology[tech].prerequisites then
        data.raw.technology[tech].prerequisites = {}
    end

    -- check if prerequisite is already in tech
    for i,v in ipairs(data.raw.technology[tech].prerequisites) do
        if v == prerequisite then
            log("tech "..tech.." already has prerequisite "..prerequisite..", skipping...")
            return
        end
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

-- remove a unlock recipe effect from tech
function ei_lib.remove_unlock_recipe(tech, recipe)
    -- check if tech exists in data.raw.technology
    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    -- loop over all effects of the tech
    for i,v in ipairs(data.raw.technology[tech].effects) do

        -- if effect is found, remove it
        if v.type == "unlock-recipe" and v.recipe == recipe then
            table.remove(data.raw.technology[tech].effects, i)
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

-- from base factorio
function ei_lib.make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
      local start_frame = (anim.frame_count or 1) * idx
      local x = 0
      local y = 0
      if anim.line_length then
        y = anim.height * math.floor(start_frame / (anim.line_length or 1))
      else
        x = idx * anim.width
      end
      return
      {
        filename = anim.filename,
        priority = anim.priority or "high",
        flags = anim.flags,
        x = x,
        y = y,
        width = anim.width,
        height = anim.height,
        frame_count = anim.frame_count or 1,
        line_length = anim.line_length,
        repeat_count = anim.repeat_count,
        shift = anim.shift,
        draw_as_shadow = anim.draw_as_shadow,
        force_hr_shadow = anim.force_hr_shadow,
        apply_runtime_tint = anim.apply_runtime_tint,
        animation_speed = anim.animation_speed,
        scale = anim.scale or 1,
        tint = anim.tint,
        blend_mode = anim.blend_mode
      }
    end
  
    local function make_animation_layer_with_hr_version(idx, anim)
      local anim_parameters = make_animation_layer(idx, anim)
      if anim.hr_version and anim.hr_version.filename then
        anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
      end
      return anim_parameters
    end
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
        end
        return tab
      else
        return make_animation_layer_with_hr_version(idx, animation)
      end
    end
  
    return
    {
      north = make_animation(0),
      east = make_animation(1),
      south = make_animation(2),
      west = make_animation(3)
    }
  end

return ei_lib