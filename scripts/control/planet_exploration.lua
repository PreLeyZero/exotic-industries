local model = {}

--====================================================================================================
--PLANET EXPLORATION
--====================================================================================================

-- model.destination_dict = ei_data.planet_exploration.destination_dict
model.return_dict = ei_data.planet_exploration.return_dict
model.tech_unlocks = ei_data.planet_exploration.tech_unlocks

--CHECKS
-----------------------------------------------------------------------------------------------------

function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.check_force(force)

    if force.is_enemy("player") then
        return
    end

    if not global.ei[force.name] then
        global.ei[force.name] = {}
    end

    if not global.ei[force.name].destinations then
        global.ei[force.name].destinations = {}
    end

end


--UTIL
------------------------------------------------------------------------------------------------------

function model.give_launch_products(silo, rocket)

    rocket_inv = rocket.get_inventory(defines.inventory.rocket)
    if rocket_inv.is_empty() then
        return
    end

    silo_inv = silo.get_inventory(defines.inventory.rocket_silo_result)

    destination = model.get_destination(silo)
    if destination == nil then
        return
    end

    if model.return_dict[destination] == nil then
        return
    end

    -- loop over all items in rocket and give launch products
    for item, count in pairs(rocket_inv.get_contents()) do

        if count == 0 then
            goto continue
        end

        if model.return_dict[destination][item] == nil then
            goto continue
        end

        -- check if this destination is unlocked
        if not model.is_unlocked_destination(silo.force, destination) then
            goto continue
        end

        -- check if this input is unlocked
        if not model.is_unlocked_input(silo.force, destination, item) then
            goto continue
        end
        

        local return_spec = model.return_dict[destination][item]

        if silo_inv.can_insert({name = return_spec.name, count = return_spec.count}) then
            silo_inv.insert({name = return_spec.name, count = return_spec.count})
        end

        ::continue::
    end

end


function model.set_initial_destination(entity)

    -- return if recipe is already set f.e. due to blueprint
    if model.get_destination(entity) then
        return
    end

    model.set_destination(entity, "nauvis-orbit")

end


function model.update_force_destinations(force)

    -- loop over all techs, researched by this force and check if they unlock a destination
    local techs = force.technologies

    for tech_name, tech in pairs(techs) do

        if tech.researched == false then
            goto continue
        end

        if model.tech_unlocks[tech_name] then
            model.add_force_destination(force, model.tech_unlocks[tech_name])
        end

        ::continue::

    end

end


function model.add_force_destination(force, destination)

    if not global.ei[force.name] then
        return
    end

    if not global.ei[force.name].destinations then
        return
    end

    -- if tech is already in global.ei[force.name].destinations, do nothing
    -- else add tech to global.ei[force.name].destinations

    if global.ei[force.name].destinations[destination] then
        return
    end

    global.ei[force.name].destinations[destination] = true

    game.print("New destination unlocked: " .. destination)

end


function model.is_unlocked_destination(force, destination)

    if not global.ei[force.name] then
        return false
    end

    if not global.ei[force.name].destinations then
        return false
    end

    if global.ei[force.name].destinations[destination] then
        return true
    end

    return false

end


function model.is_unlocked_input(force, destination, item)

    if not model.is_unlocked_destination(force, destination) then
        return false
    end

    -- ei_mining-satellite -> ei_..destination..-mining
    -- ei_advanced-mining-satellite -> ei_..destination..-advanced-mining
    -- ei_watching-satellite -> ei_..destination..-watching

    local tech_suffix = nil

    if item == "ei_mining-satellite" then
        tech_suffix = "mining"
    elseif item == "ei_watching-satellite" then
        tech_suffix = "watching"
    end

    if tech_suffix == nil then
        return true
    end

    local tech_name = "ei_" .. destination .. "-" .. tech_suffix

    if force.technologies[tech_name].researched then
        return true
    end

    return true

end


--RETURN FUNCTIONS FOR SILO LOGIC
------------------------------------------------------------------------------------------------------

-- >> get lists of possible destination and inputs for a given force

function model.get_destination_list(force)

    if not global.ei[force.name] then
        return
    end

    if not global.ei[force.name].destinations then
        return
    end

    local destination_list = {}

    for destination, _ in pairs(global.ei[force.name].destinations) do
        table.insert(destination_list, destination)
    end

    return destination_list

end


function model.get_destination_input_list(force, destination)

    -- make list from all keys in return_dict[destination]
    -- and cut those where input is not unlocked

    local input_list = {}

    for input, _ in pairs(model.return_dict[destination]) do

        if model.is_unlocked_input(force, destination, input) then
            table.insert(input_list, input)
        end

    end

    return input_list

end


function model.get_destination_distance(destination)

    -- we measure distance in AE / rocket fuel needed
    -- 10: nauvis orbit, 40: sun <-> 1AE

    local recipes = game.get_filtered_recipe_prototypes({
        {filter = "has-product-item", item = "rocket-part"}
    })

    local dest_recipe = recipes["ei_rocket:" .. destination]

    if dest_recipe == nil then
        return 0
    end

    local ingredients = dest_recipe.ingredients

    for _, ingredient in pairs(ingredients) do

        if ingredient.name == "rocket-fuel" then
            return ingredient.amount / 40
        end

    end

    return 0

end


-- >> get and setter for destination

function model.set_destination(entity, destination)

    if model.entity_check(entity) == false then
        return
    end

    -- recipe_name = model.destination_dict[destination]
    recipe_name = "ei_rocket:" .. destination

    if recipe_name == nil then
        return
    end

    entity.set_recipe(recipe_name)
    entity.recipe_locked = true

end


function model.get_destination(entity)

    if model.entity_check(entity) == false then
        return
    end

    local recipe = entity.get_recipe()

    if recipe == nil then
        return nil
    end
    -- string part after ei_rocket: is the destination
    local destination = string.sub(recipe.name, 11)

    return destination

end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "rocket-silo" then
        model.set_initial_destination(entity)
    end

end


function model.on_rocket_launched(event)

    silo = event.rocket_silo
    rocket = event.rocket

    if model.entity_check(silo) == false then
        return
    end

    model.give_launch_products(silo, rocket)

end


function model.on_research_finished(event)

    local research = event.research

   model.check_force(research.force)

   model.update_force_destinations(research.force)

end


return model