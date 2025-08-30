local model = {}

--====================================================================================================
--PLANET EXPLORATION
--====================================================================================================

-- model.destination_dict = ei_data.planet_exploration.destination_dict
model.return_dict = ei_data.planet_exploration.return_dict
model.tech_unlocks = ei_data.planet_exploration.tech_unlocks
model.unknown_destination = ei_data.planet_exploration.unknown_destination
model.unknown_unlocks = ei_data.planet_exploration.unkown_unlocks

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

    if not storage.ei[force.name] then
        storage.ei[force.name] = {}
    end

    if not storage.ei[force.name].destinations then
        storage.ei[force.name].destinations = {}
    end

end


--UTIL
------------------------------------------------------------------------------------------------------

function model.give_launch_products(silo, rocket)
    rocket_inv = rocket.cargo_pod.get_inventory(defines.inventory.cargo_unit) --[[@as LuaInventory]]
    if rocket_inv.is_empty() then
        return
    end

    landing_pad_inv = silo.surface.find_entities_filtered{type="cargo-landing-pad"}[1].get_inventory(defines.inventory.cargo_unit)

    destination = model.get_destination(silo)
    if destination == nil then
        return
    end

    if model.return_dict[destination] == nil then
        return
    end

    -- loop over all items in rocket and give launch products
    for _, entry in pairs(rocket_inv.get_contents()) do
        local count = entry.count
        local item = entry.name

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

        if not return_spec then
            goto continue
        end

        if not return_spec.name or not return_spec.count then
        
            model.exploration_satellite_sent(silo, false)

            goto continue
        end

        total_count = return_spec.count * count

        if landing_pad_inv.can_insert({name = return_spec.name, count = total_count}) then
            landing_pad_inv.insert({name = return_spec.name, count = total_count})

            model.exploration_satellite_sent(silo, true)
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

    if not storage.ei[force.name] then
        return
    end

    if not storage.ei[force.name].destinations then
        return
    end

    -- if tech is already in storage.ei[force.name].destinations, do nothing
    -- else add tech to storage.ei[force.name].destinations

    if storage.ei[force.name].destinations[destination] then
        return
    end

    storage.ei[force.name].destinations[destination] = true

    -- game.print("New destination unlocked: " .. destination)
    game.print({"exotic-industries.message-destination-discovered", destination})

end


function model.is_unlocked_destination(force, destination)

    if not storage.ei[force.name] then
        return false
    end

    if not storage.ei[force.name].destinations then
        return false
    end

    if storage.ei[force.name].destinations[destination] then
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


--EXPLORATION UNLOCKS
------------------------------------------------------------------------------------------------------

function model.exploration_satellite_sent(silo, alongside)

    local force = silo.force

    -- exploration satellite distuingished by space and deep space exploration
    -- deep space is when distance is >= 3 then consider as deep space

    local destination = model.get_destination(silo)
    local distance = model.get_destination_distance(destination)

    -- alongside is for when a non-exploration satellite is sent
    -- small chance to discover new space destination, very small chance to discover new deep space destination

    local chance = 0.1
    local deep_chance = 0.01

    if distance >= 3 then
        chance = 0.01
        deep_chance = 0.1
    end

    local chance_multiplier = 1
    if alongside then
        chance_multiplier = 0.1
    end

    -- game.print("chance: "..chance * chance_multiplier)
    -- game.print("deep_chance: "..deep_chance * chance_multiplier)

    if math.random() < chance * chance_multiplier then
        -- game.print("New space destination discovered!")
        model.discover_new_space_destination(force, "space")
    end

    if math.random() < deep_chance * chance_multiplier then
        -- game.print("New deep space destination discovered!")
        model.discover_new_space_destination(force, "deep-space")
    end

end


function model.discover_new_space_destination(force, destination_type)

    local destination_list = model.unknown_destination[destination_type]
    local list_lenght = 0

    for _, _ in pairs(destination_list) do
        list_lenght = list_lenght + 1
    end

    if list_lenght == 0 then
        return
    end

    -- destination_list is indexed by destination name and value is tech name
    -- make new list where only techs with hidden = true are included

    local hidden_destination_list = {}

    for destination, tech_name in pairs(destination_list) do

        if not force.technologies[tech_name].enabled then
            table.insert(hidden_destination_list, destination)
        end

    end

    if #hidden_destination_list == 0 then
        return
    end

    -- pick random destination from hidden_destination_list

    local destination = hidden_destination_list[math.random(#hidden_destination_list)]
    local destination_unlocks = model.unknown_unlocks[destination]

    -- unhide the accosiated techs of this destination for this force
    for _, tech_name in ipairs(destination_unlocks) do
        force.technologies[tech_name].enabled = true
    end

    --force.technologies[destination_list[destination]].enabled = true

    --game.print("New destination discovered: " .. destination)
    game.print({"exotic-industries.message-destination-discovered", destination})

    ei_informatron_messager.notify(destination)

end


--RETURN FUNCTIONS FOR SILO LOGIC
------------------------------------------------------------------------------------------------------

-- >> get lists of possible destination and inputs for a given force

function model.get_destination_list(force)

    if not storage.ei[force.name] then
        return
    end

    if not storage.ei[force.name].destinations then
        return
    end

    local destination_list = {}

    for destination, _ in pairs(storage.ei[force.name].destinations) do
        table.insert(destination_list, destination)
    end

    return destination_list

end


function model.get_destination_input_list(force, destination, entity)

    -- sometimes if place by helmod or different destination might be invalid
    if model.return_dict[destination] == nil then
        if entity then model.set_initial_destination(entity) end
    end

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

    local distance = 0
    local dest_recipe = prototypes.recipe["ei_rocket__" .. destination]

    if not dest_recipe then
        return distance
    end

    for _, ingredient in pairs(dest_recipe.ingredients) do

        if ingredient.name  == "ei_fusion-drive" then
            distance = 3
            break
        elseif ingredient.name == "rocket-fuel" or ingredient.name == "ei_advanced-rocket-fuel" then
            distance = ingredient.amount / 20
        end

    end

    return distance

end


-- >> get and setter for destination

---Sets the destination of a given rocket silo entity if appropriate.
---@param entity LuaEntity Rocket silo entity
---@param destination string Destrination
---@return boolean?
function model.set_destination(entity, destination)

    if model.entity_check(entity) == false then
        return
    end

    -- Disallow modifying the destination after the rocket has been built
    if entity.rocket_silo_status ~= defines.rocket_silo_status.building_rocket then
        return
    end

    -- recipe_name = model.destination_dict[destination]
    recipe_name = "ei_rocket__" .. destination

    if not prototypes.recipe[recipe_name] then
        return
    end

    local items = entity.set_recipe(recipe_name)

    -- If there are items, try to reinsert them into the input inventory. If that fails, spill them.
    if next(items) then
        local input_inv = entity.get_inventory(defines.inventory.rocket_silo_input) --[[@as LuaInventory]]
        for _, item in ipairs(items) do
            local inserted = input_inv.insert(item)
            local remaining = item.count - inserted

            if remaining > 0 then
                entity.surface.spill_item_stack{position=entity.position, stack={name=item.name, count=remaining}, enable_looted=true, force=entity.force, allow_belts=false}
            end
        end
    end

    entity.rocket_parts = 0
    entity.recipe_locked = true

    return true

end


function model.get_destination(entity)

    if model.entity_check(entity) == false then
        return
    end

    local recipe = entity.get_recipe()

    if recipe == nil then
        return nil
    end
    -- string part after ei_rocket__ is the destination
    local destination = string.match(recipe.name, "^ei_rocket__(.*)") or "nauvis-orbit"

    return destination

end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "rocket-silo" then
        if not entity.get_recipe() then
            model.set_initial_destination(entity)
        end
        entity.recipe_locked = true
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
