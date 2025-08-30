local model = {}

--====================================================================================================
--NEUTRON COLLECTOR
--====================================================================================================

--UTIL
------------------------------------------------------------------------------------------------------

model.range = 10 + 1.5 -- range of neutron collector in tiles + 1.5 collector size
model.neutron_sources = {}
model.dist_buffs = {}

-- values are additional percent after range calculation
model.neutron_sources["ei_high-temperature-reactor"] = -20
model.neutron_sources["nuclear-reactor"] = -30
model.neutron_sources["ei_fission-facility"] = -40
model.neutron_sources["ei_castor"] = -50
model.neutron_sources["ei_fusion-reactor"] = 10

model.dist_buffs["ei_fusion-reactor"] = 3


function model.calc_distance(entity, source)

    local dist = math.sqrt((entity.position.x - source.position.x)^2 + (entity.position.y - source.position.y)^2)

    local buff = model.dist_buffs[source.name]

    if buff == nil then
        buff = 0
    end

    return dist - buff

end


function model.calc_fusion_flux(fuel1, fuel2, temp_mode, fuel_mode)

    if fuel1 == nil or fuel2 == nil then
        return 0
    end

    fuel1_multiplier = ei_data.fusion.fuel_neutron_flux[fuel1]
    fuel2_multiplier = ei_data.fusion.fuel_neutron_flux[fuel2]

    if fuel1_multiplier == nil or fuel2_multiplier == nil then
        return 0
    end

    temp_multiplier = ei_data.fusion.temp_neutron_flux[temp_mode]
    fuel_multiplier = ei_data.fusion.injection_neutron_flux[fuel_mode]

    if temp_multiplier == nil or fuel_multiplier == nil then
        return 0
    end

    return fuel1_multiplier * fuel2_multiplier * temp_multiplier * fuel_multiplier
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


function model.find_neutron_source(entity, exclude)
    -- find all neutron sources in range
    -- returns best neutron source and its efficiency 
    
    -- first find all entities in range
    local range = model.range

    local entities = entity.surface.find_entities_filtered{
        position = entity.position,
        radius = range,
    }

    -- then check if they are neutron sources
    if #entities == 0 then
        return {
            source = nil,
            eff = 0
        }
    end

    local best_source = nil
    local eff = 0
    
    for _, source in ipairs(entities) do
        if model.neutron_sources[source.name] ~= nil then
            if source == exclude then
                goto continue
            end

            if best_source == nil then
                best_source = source
                eff = model.calc_efficiency(entity, source)
            else
                if model.calc_efficiency(entity, source) > eff then
                    best_source = source
                    eff = model.calc_efficiency(entity, source)
                end
            end

            ::continue::
        end
    end

    if best_source == nil then
        -- create flying text
        rendering.draw_text{
            target = entity,
            text = "No nearby neutron source",
            color = {r=1, g=0.77, b=0},
            surface = entity.surface,
            scale = 1,
            time_to_live = 15
        }

        return {
            source = nil,
            eff = 0
        }
    end

    -- create flying text
    if eff > 0 then
        --[[
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "Efficiency: " .. eff .. "%",
            color = {r=0.48, g=0.77, b=0.37},
            time_to_live = 15
        }
        ]]

        rendering.draw_text{
            text = "Efficiency: " .. eff .. "%",
            surface = entity.surface,
            target = entity,
            color = {r=0.48, g=0.77, b=0.37},
            scale = 0.75,
            time_to_live = 120,
            alignment = "center",
            scale_with_zoom = false
        }
    else
        rendering.draw_text{
            target = entity,
            text = "Insufficient neutron flux",
            color = {r=1, g=0.77, b=0},
            surface = entity.surface,
            scale = 1,
            time_to_live = 15
        }
    end

    return {
        source = best_source,
        eff = eff
    }
end


function model.update_neutron_collector(entity, exclude)
    -- entity is a neutron collector?
    -- update its efficiency and set the according recipe / clear

    if model.entity_check(entity) == false then
        return
    end

    if entity.name ~= "ei_neutron-collector" then
        return
    end

    if not exclude then
        exclude = nil
    end

    local foo = model.find_neutron_source(entity, exclude)

    if foo.eff == 0 then
        entity.set_recipe(nil)
        entity.recipe_locked = true

        model.remove_direction_animation(entity)

        return
    end

    -- set the recipe
    entity.set_recipe("ei_charged-neutron-container__"..foo.eff)
    entity.recipe_locked = true
    
    -- get the direction count corresponding to 64 directions
    local direction_count = model.get_looking_direction(entity, foo.source)
    model.make_direction_animation(entity, direction_count)

    model.connect_neutron_source(entity, foo.source)

    ei_victory.count_value("neutron_collector_efficiency", foo.eff)
end


function model.update_neutron_collectors_in_range(neutron_source, exclude)
    -- update all neutron collectors in range of neutron_source

    if model.entity_check(neutron_source) == false then
        return
    end

    local range = model.range

    local entities = neutron_source.surface.find_entities_filtered{
        position = neutron_source.position,
        radius = range,
    }

    for _, entity in ipairs(entities) do
        if entity.name == "ei_neutron-collector" then
            model.update_neutron_collector(entity, exclude)
        end
    end
end


function model.is_output_empty(entity)

    if entity.crafting_progress == 1 then
        -- check if an output inventory is full or a output fluidbox
        if entity.get_output_inventory() then
            if not entity.get_output_inventory().is_empty() then
                if entity.get_output_inventory().is_full() then
                    return false
                end
            end
        end

        -- same for potential fluidboxes
        -- TODO

    end        

    return true

end


function model.get_state(entity)
    -- return if entity is active or not
    -- also check for assembler/furnace if output is full
    -- if progress is 1 then return false

    if model.entity_check(entity) == false then
        return false
    end

    if entity.type == "assembling-machine" then
        if model.is_output_empty(entity) == false then
            return false
        end

        return entity.is_crafting()
    end

    if entity.type == "furnace" then
        if model.is_output_empty(entity) == false then
            return false
        end
        
        return entity.is_crafting()
    end

    if entity.type == "reactor" then
        if entity.burner then
            if entity.burner.currently_burning then
               return true
            end 
        end
    end

    return false
end


function model.update_all_collector_states(source)
    -- set the active state of every collector using this source
    local state = model.get_state(source)

    for i,v in pairs(storage.ei["neutron_sources"][source.unit_number]["collectors"]) do
        if model.entity_check(v) then
            storage.ei["neutron_sources"][source.unit_number]["collectors"][i].active = state
        end
    end
end

--MATH RELATED
------------------------------------------------------------------------------------------------------

function model.get_looking_direction(entity, target)
    -- get the direction from entity to target, snap to 64 directions
    -- 0 = north = 0dec, 16 = east = 45dec, 32 = south = 90dec, 48 = west = 270dec, 64 = north = 360dec

    if model.entity_check(entity) == false then
        return 0
    end

    if model.entity_check(target) == false then
        return 0
    end

    -- calc angle between entity and target in degrees
    local Dx = target.position.x - entity.position.x
    local Dy = target.position.y - entity.position.y

    local phi =  math.atan(Dx/Dy)

    if Dx == 0 then
        if Dy < 0 then
            return 0
        else
            return 32
        end
    end

    -- invert angles for 1st and 3rd quadrant
    if Dx < 0 and Dy < 0 then
        phi = phi + math.pi
    elseif Dx > 0 and Dy < 0 then
        phi = phi + math.pi
    end

    -- shift angle so that machine is facing inwards
    phi = phi + math.pi

    local theta = 2 * math.pi - phi

    -- convert to degrees
    local angle = theta * 180 / math.pi 

    -- snap to 64 directions
    local direction = math.floor(angle / 360 * 64)

    -- treat direction above 64 or below 0 using modulo
    direction = direction % 64

    return direction
end


function model.calc_efficiency(entity, source)
    -- calc efficiency of neutron collector based on distance to source
    -- returns efficiency in percent
    -- 100 efficiency is given at 1 distance or closer
    -- 10 percent efficiency is given at model.range distance

    if source == nil then
        return 0
    end

    local dist = model.calc_distance(entity, source)

    -- local dist = math.sqrt((entity.position.x - source.position.x)^2 + (entity.position.y - source.position.y)^2)

    if dist > model.range then
        return 0
    end

    if dist < 1 then
        return 100
    end

    local efficiency = 100 - (dist / model.range) * 90 + model.neutron_sources[source.name]

    if efficiency < 0 then
        efficiency = 0
    elseif efficiency > 100 then
        efficiency = 100
    end

    if source.name == "ei_fusion-reactor" then

        local recipe = "ei_fusion-F1__ei_heated-deuterium-F2__ei_heated-tritium-TM__medium-FM__medium"
        
        if source.get_recipe() then
            recipe = source.get_recipe().name
        end

        -- local recipe = source.get_recipe().name
        -- default = "ei_fusion-F1__ei_heated-deuterium-F2__ei_heated-tritium-TM__medium-FM__medium"

        fuel1 = recipe:match("F1__(.+)-F2__")
        fuel2 = recipe:match("F2__(.+)-TM__")
        temp_mode = recipe:match("TM__(.+)-FM__")
        fuel_mode = recipe:match("FM__(.+)")

        efficiency = efficiency * 2 * model.calc_fusion_flux(fuel1, fuel2, temp_mode, fuel_mode)
    end

    -- now "snap" efficiency to 10 percent steps
    efficiency = math.floor(efficiency / 10) * 10

    if efficiency < 0 then
        efficiency = 0
    elseif efficiency > 300 then
        efficiency = 300
    end

    return efficiency
end

--REGISTRY
------------------------------------------------------------------------------------------------------

function model.register_neutron_source(entity)
    -- register a neutron source
    -- add it to the storage table

    if model.entity_check(entity) == false then
        return
    end

    if model.neutron_sources[entity.name] == nil then
        return
    end

    if not storage.ei["neutron_sources"] then
        storage.ei["neutron_sources"] = {}
    end

    if storage.ei["neutron_sources"][entity.unit_number] ~= nil then
        return -- already registered
    end

    storage.ei["neutron_sources"][entity.unit_number] = {}
    storage.ei["neutron_sources"][entity.unit_number]["collectors"] = {}
    storage.ei["neutron_sources"][entity.unit_number]["entity"] = entity
end


function model.deregister_neutron_source(entity)
    -- deregister a neutron source
    -- remove it from the storage table

    if storage.ei["neutron_sources"][entity.unit_number] == nil then
        return -- not registered
    end

    storage.ei["neutron_sources"][entity.unit_number] = nil
end


function model.connect_neutron_source(entity, source)

    if model.entity_check(entity) == false then
        return
    end

    if model.entity_check(source) == false then
        return
    end
 
    if not storage.ei["neutron_sources"] then
        model.register_neutron_source(source)
    end

    if storage.ei["neutron_sources"][source.unit_number] == nil then
        model.register_neutron_source(source)
    end
   
    if storage.ei["neutron_sources"][source.unit_number]["collectors"][entity.unit_number] then
        return -- already connected collector to this source
    end

    storage.ei["neutron_sources"][source.unit_number]["collectors"][entity.unit_number] = entity
end


function model.update()
    -- gets called up to max update time per tick
    
    if not storage.ei["neutron_sources"] then
        return
    end

    -- if no current break point set new one if possible return if not
    if not storage.ei["neutron_script_break_point"] and next(storage.ei["neutron_sources"]) then
        storage.ei["neutron_script_break_point"],_ = next(storage.ei["neutron_sources"])
    end

    if not storage.ei["neutron_script_break_point"] then
        return
    end

    -- get current break point
    local i = storage.ei["neutron_script_break_point"]

    -- check that source still exists
    if storage.ei["neutron_sources"][i] == nil then
        
        if next(storage.ei["neutron_sources"], i) then
            -- is there a possible next source?
            storage.ei["neutron_script_break_point"],_ = next(storage.ei["neutron_sources"], i)

        elseif next(storage.ei["neutron_sources"]) then
            -- is there a possible first source
            new_i,_ = next(storage.ei["neutron_sources"])
            -- if its the the current one?
            if  new_i == i then
                -- no possible next or first source
                storage.ei["neutron_script_break_point"] = nil
                return
            end

            storage.ei["neutron_script_break_point"] = new_i
        else
            -- no possible next or first source
            storage.ei["neutron_script_break_point"] = nil
            return
        end

        i = storage.ei["neutron_script_break_point"]
    end

    -- get current source
    local source = storage.ei["neutron_sources"][i]["entity"]

    if model.entity_check(source) == false then
        return
    end

    model.update_all_collector_states(source)

    -- set new break point
    if next(storage.ei["neutron_sources"], i) then
        storage.ei["neutron_script_break_point"],_ = next(storage.ei["neutron_sources"], i)
    else
        storage.ei["neutron_script_break_point"],_ = next(storage.ei["neutron_sources"])
    end
end

--SPRITE RELATED
------------------------------------------------------------------------------------------------------

function model.make_direction_animation(entity, direction_count)
    -- if there is already an animation, remove it first
    model.remove_direction_animation(entity)

    -- create new animation
    local animation = rendering.draw_animation({
        animation="ei_neutron-collector_top",
        target=entity,
        surface=entity.surface,
        render_layer=132,
        animation_speed=0,
        animation_offset=direction_count-1,
        x_scale=1,
        y_scale=1,
    })

    storage.ei["neutron_collector_animation"][entity.unit_number] = animation
end


function model.remove_direction_animation(entity)
    if not storage.ei["neutron_collector_animation"] then
        storage.ei["neutron_collector_animation"] = {}
    end

    if storage.ei["neutron_collector_animation"][entity.unit_number] then
        storage.ei["neutron_collector_animation"][entity.unit_number].destroy()
        storage.ei["neutron_collector_animation"][entity.unit_number] = nil
    end
end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_neutron-collector" then
        model.update_neutron_collector(entity)
    end

    if model.neutron_sources[entity.name] then
        model.update_neutron_collectors_in_range(entity)

        model.register_neutron_source(entity)
    end
end

function model.on_destroyed_entity(entity, destroy_type)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_neutron-collector" then
        model.remove_direction_animation(entity)
    end

    if model.neutron_sources[entity.name] then
        model.update_neutron_collectors_in_range(entity, entity)

        model.deregister_neutron_source(entity)
    end
end

return model