-- commonly used functions for the mod

local ei_lib = {}

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

function ei_lib.clean_nils(t)
  local ans = {}
  for _,v in pairs(t) do
    ans[ #ans+1 ] = v
  end
  return ans
end

function ei_lib.table_contains_value(table_in, value)
    for i,v in pairs(table_in) do
        if v == value then
            return true
        end
    end
    return false
end

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

---@param inputstr string
---@param start string
function ei_lib.starts_with(inputstr, start) 
    return inputstr:sub(1, #start) == start 
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
        for i,v in pairs(data.raw.recipe[recipe].ingredients or {}) do
            local item_amount = v[2] or v["amount"]
            local item_name = v[1] or v["name"]
            if item_name == old_ingredient then
                amount = item_amount
            end
        end

        -- if amount is still nil, set it to 1
        if not amount then
            amount = 1
        end
    end

    -- loop over all ingredients of the recipe
    for i,v in pairs(data.raw.recipe[recipe].ingredients or {}) do

        local item_amount = v[2] or v["amount"]
        local item_name = v[1] or v["name"]

        -- if ingredient is found, replace it
        -- here first index is ingredient name, second index is amount
        if item_name == old_ingredient then
            if v["name"] then
                data.raw.recipe[recipe].ingredients[i]["name"] = new_ingredient
                data.raw.recipe[recipe].ingredients[i]["amount"] = amount
            else
                data.raw.recipe[recipe].ingredients[i][1] = new_ingredient
                data.raw.recipe[recipe].ingredients[i][2] = amount
            end
        end

        ei_lib.fix_recipe(recipe)
    end
end


-- fix recipes for multiple ingredients
function ei_lib.fix_recipe(recipe)
    -- look if an ingredient is multiple times in the recipe, if so, add the amounts
    local ingredients = {}
    if not data.raw.recipe[recipe].ingredients then
        return
    end

    if not data.raw.recipe[recipe].ingredients[1] then
        return
    end
    ingredients = data.raw.recipe[recipe].ingredients

    -- loop over all ingredients
    for i,v in ipairs(ingredients) do
        local total_amount = v[2] or v["amount"] or 1
        for j,x in ipairs(ingredients) do
            -- exclude same index
            if i ~= j then

                -- if is entry for the same ingredient
                if (v["name"] == x["name"] and v["name"]) or (v[1] == x[1] and v[1]) then
                    if x["amount"] then
                        total_amount = total_amount + x["amount"]
                    else
                        total_amount = total_amount + x[2]
                    end
                    
                    table.remove(data.raw.recipe[recipe].ingredients, j)
                end
            end
        end
        if v[2] then
            v[2] = total_amount
        else
            v["amount"] = total_amount
        end
    end

end

-- add new ingredient in recipe
function ei_lib.recipe_add(recipe, ingredient, amount, fluid)
    -- amount is optional if not give default to 1
    amount = amount or 1
    fluid = fluid or false

    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- add ingredient to recipe
    local typus = "item"
    if fluid then typus = "fluid" end

    table.insert(data.raw.recipe[recipe].ingredients, {type = typus, name = ingredient, amount = amount})
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


-- set a completly new set of ingredients for recipe
function ei_lib.recipe_new(recipe, table_in)
    -- test if recipe exists in data.raw.recipe
    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    -- set ingredients
    data.raw.recipe[recipe].ingredients = table_in
end


function ei_lib.recipe_hard_overwrite(recipe, ingredients)

    -- adjust old recipe
    local old_recipe = table.deepcopy(data.raw.recipe[recipe])
    old_recipe.name = old_recipe.name.."_alt"
    old_recipe.hidden = false
    old_recipe.ingredients = ingredients

    -- swap place with original and remove original
    data:extend({old_recipe})
    local swapped = false
    for tech, _ in pairs(data.raw.technology) do
        if ei_lib.remove_unlock_recipe(tech, recipe) then
            ei_lib.add_unlock_recipe(tech, old_recipe.name)
            swapped = true
        end
    end

    if not swapped then old_recipe.enabled = true end
    data.raw.recipe[recipe].hidden = true

end

--TECH RELATED
------------------------------------------------------------------------------------------------------

function ei_lib.set_prerequisites(tech, prerequisites)
    -- check if tech exists in data.raw.technology
    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    data.raw.technology[tech].prerequisites = prerequisites

end


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

    if not data.raw.technology[tech].prerequisites then
        log("tech "..tech.." has no prerequisites; skipping...")
        return
    end

    -- loop over all prerequisites of the tech
    for i,v in ipairs(data.raw.technology[tech].prerequisites) do

        -- if prerequisite is found, remove it
        if v == prerequisite then

            -- skip this tech if it is a dummy tech :dummy in name
            if string.find(tech, "__dummy") then
                goto continue
            end

            table.remove(data.raw.technology[tech].prerequisites, i)
            ::continue::
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

    if not data.raw.technology[tech].effects then return false end

    -- loop over all effects of the tech
    for i,v in ipairs(data.raw.technology[tech].effects) do

        -- if effect is found, remove it
        if v.type == "unlock-recipe" and v.recipe == recipe then
            table.remove(data.raw.technology[tech].effects, i)
            return true
        end
    end

    return false
end

function ei_lib.add_unlock_recipe(tech, recipe)

    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    if not data.raw.recipe[recipe] then
        log("recipe "..recipe.." does not exist in data.raw.recipe")
        return
    end

    if not data.raw.technology[tech].effects then
        data.raw.technology[tech].effects = {}
    end

    table.insert(data.raw.technology[tech].effects, {type = "unlock-recipe", recipe = recipe})

end

function ei_lib.remove_tech(tech)
    -- hide this tech in the tech tree
    -- remove it from all techs prerequisites

    -- check if tech exists in data.raw.technology
    if not data.raw.technology[tech] then
        log("tech "..tech.." does not exist in data.raw.technology")
        return
    end

    -- loop over all techs
    for i,v in pairs(data.raw.technology) do

        -- remove tech from all techs prerequisites
        ei_lib.remove_prerequisite(v.name, tech)
    end

    -- hide the tech in the tech tree
    data.raw.technology[tech].enabled = false
    data.raw.technology[tech].hidden = true

end

--GENERAL PROTOTYPES RELATED
------------------------------------------------------------------------------------------------------

--- Set each attribute of source into target
local function recursive_copy(target, source)
    for key, value in pairs(source) do
        if tostring(key):find('^_') ~= 1 then
            if type(value) == 'table' then
                target[key] = target[key] or {}
                recursive_copy(target[key], source[key])
            else
                target[key] = source[key]
            end
        end
    end
end

--- Updates (overwriting) a given prototype's attributes with the given data
--- properties starting with underscore "_property" will be ignored
---@param obj Prototype
---@field name String mandatory
---@field type String mandatory
function ei_lib.set_properties(obj)
    if not (obj and obj.name and obj.type) then
        log(serpent.log({["Invalid object:"] = obj}))
        return
    end
    local prototype = data.raw[obj.type][obj.name]
    if not prototype then
        log("Could not find prototype"..obj.type.."/"..obj.name)
        return
    end
    recursive_copy(prototype, obj)
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
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer(idx, v))
        end
        return tab
      else
        return make_animation_layer(idx, animation)
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

function ei_lib.make_circuit_connector(Dx, Dy)

    local circuit_wire_connection_point = {
        shadow = {
            green = {0.671875+Dx, 0.609375+Dy},
            red = {0.890625+Dx, 0.5625+Dy}
        },
        wire = {
            green = {0.453125+Dx, 0.453125+Dy},
            red = {0.390625+Dx, 0.21875+Dy}
        }
    }

    local circuit_connector_sprites = {
        blue_led_light_offset = {0.125+Dx, 0.46875+Dy},
        connector_main = {
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04a-base-sequence.png",
          height = 50,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.203125+Dy
          },
          width = 52,
          x = 104,
          y = 150
        },
        connector_shadow = {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04b-base-shadow-sequence.png",
          height = 46,
          priority = "low",
          scale = 0.5,
          shift = {
            0.3125+Dx,
            0.3125+Dy
          },
          width = 62,
          x = 124,
          y = 138
        },
        led_blue = {
          draw_as_glow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04e-blue-LED-on-sequence.png",
          height = 60,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.171875+Dy
          },
          width = 60,
          x = 120,
          y = 180
        },
        led_blue_off = {
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04f-blue-LED-off-sequence.png",
          height = 44,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.171875+Dy
          },
          width = 46,
          x = 92,
          y = 132
        },
        led_green = {
          draw_as_glow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04h-green-LED-sequence.png",
          height = 46,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.171875+Dy
          },
          width = 48,
          x = 96,
          y = 138
        },
        led_light = {
          intensity = 0,
          size = 0.9
        },
        led_red = {
          draw_as_glow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04i-red-LED-sequence.png",
          height = 46,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.171875+Dy
          },
          width = 48,
          x = 96,
          y = 138
        },
        red_green_led_light_offset = {
          0.109375+Dx,
          0.359375+Dy
        },
        wire_pins = {
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04c-wire-sequence.png",
          height = 58,
          priority = "low",
          scale = 0.5,
          shift = {
            0.09375+Dx,
            0.171875+Dy
          },
          width = 62,
          x = 124,
          y = 174
        },
        wire_pins_shadow = {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-universal-04d-wire-shadow-sequence.png",
          height = 54,
          priority = "low",
          scale = 0.5,
          shift = {
            0.25+Dx,
            0.296875+Dy
          },
          width = 70,
          x = 140,
          y = 162
        }
    }


    return {
        circuit_wire_connection_point,
        circuit_connector_sprites
    }

end

function ei_lib.add_item_level(item, level)

    -- add level overlay to item icon

    local item = data.raw.item[item]

    if not item then
        return
    end

    if not item.icon then
        return
    end

    if not item.icon_size then
        return
    end

    local icon_size = item.icon_size or 64
    local current_icon = item.icon

    item.icons = {
        {
            icon = current_icon,
            icon_size = icon_size,
        },
        {
            icon = ei_graphics_other_path.."overlay_"..level..".png",
            icon_size = 64,
        }
    }

    item.icon = nil
    item.icon_size = nil
end

function ei_lib.merge_fluid(target, fluid, icon_transfer)

    if not data.raw.fluid[target] then return end
    if not data.raw.fluid[fluid] then return end
    icon_transfer = icon_transfer or false

    -- loop over all recipes and swap
    for recipe_name,_ in pairs(data.raw.recipe) do
        local recipe = data.raw.recipe[recipe_name]
        
        ei_lib.do_fluid_merge(recipe, target, fluid)
    end

    -- icon transfer needed?
    if icon_transfer then
        data.raw.fluid[target].icon = data.raw.fluid[fluid].icon
        data.raw.fluid[target].icon_size = data.raw.fluid[fluid].icon_size
    end

    -- hide the old fluid
    data.raw.fluid[fluid].hidden = true

end

function ei_lib.do_fluid_merge(recipe, target, fluid)
    -- handle ingredients
    if recipe.ingredients then
        for i,ingredient in pairs(recipe.ingredients) do
            if ingredient.name == fluid then
                ingredient.name = target
            end

            if ingredient[1] == fluid then
                ingredient[1] = target
            end
        end
    end

    --fixup main product
    if recipe.main_product == fluid then
        recipe.main_product = target
    end

    if recipe.result == fluid then
        recipe.result = target
    end

    if recipe.results then
        for i,result in pairs(recipe.results) do
            if result.name == fluid then
                result.name = target
            end
        end
    end
end

function ei_lib.merge_item(target, item, icon_transfer)

    if not data.raw.item[target] then return end
    if not data.raw.item[item] then return end
    icon_transfer = icon_transfer or false

    -- loop over all recipes and swap
    for recipe_name,_ in pairs(data.raw.recipe) do
        local recipe = data.raw.recipe[recipe_name]
        
        ei_lib.do_item_merge(recipe, target, item)
    end

    -- icon transfer needed?
    if icon_transfer then
        data.raw.item[target].icon = data.raw.item[item].icon
        data.raw.item[target].icon_size = data.raw.item[item].icon_size
    end

    -- hide the old item
    data.raw.item[item].hidden = true

end

function ei_lib.do_item_merge(recipe, target, item)
    -- handle ingredients
    if recipe.ingredients then
        for i,ingredient in pairs(recipe.ingredients) do
            if ingredient.name == item then
                ingredient.name = target
            end

            if ingredient[1] == item then
                ingredient[1] = target
            end
        end
    end

    --fixup main product
    if recipe.main_product == item then
        recipe.main_product = target
    end

    if recipe.result == item then
        recipe.result = target
    end

    if recipe.results then
        for i,result in pairs(recipe.results) do
            if result.name == item then
                result.name = target
            end
        end
    end
end

--====================================================================================================
--OTHER
--====================================================================================================
function ei_lib.debug_crafting_categories()
    local output = {}
    local blacklist_category = {
        ["void-crushing"] = true,
        ["fuel-burning"] = true,
    }
    
    for name, _ in pairs(data.raw["recipe-category"]) do
        if not blacklist_category[name] then
            local info = {}
            info.category = name

            info.recipes = {}
            for _, recipe in pairs(data.raw.recipe) do
                if recipe.category == name then
                    if not (ei_lib.starts_with(recipe.name, "fill-") or ei_lib.starts_with(recipe.name, "empty-")) then
                        table.insert(info.recipes, recipe.name)
                    end
                end
            end

            info.machines = {}
            for _, source in pairs({"assembling-machine", "furnace", "rocket-silo"}) do
                for _, entity in pairs(data.raw[source]) do
                    if ei_lib.table_contains_value(entity.crafting_categories or {}, name) then
                        table.insert(info.machines, entity.type .. "/" .. entity.name)
                    end
                end
            end

            output[name] = info
        end
    end
    log(serpent.block(output))
end

return ei_lib
