local model = {}

--====================================================================================================
--NEUTRON COLLECTOR
--====================================================================================================

--UTIL
------------------------------------------------------------------------------------------------------

model.range = 10 + 1.5 -- range of neutron collector in tiles + 1.5 collector size
model.neutron_sources = {}

-- values are additional percent after range calculation
model.neutron_sources["ei_high-temperature-reactor"] = 40
model.neutron_sources["nuclear-reactor"] = 20
model.neutron_sources["ei_fission-facility"] = -40
model.neutron_sources["ei_castor"] = -50



function model.entity_check(entity)
    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true
end


function model.find_neutron_source(entity)
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
            if best_source == nil then
                best_source = source
                eff = model.calc_efficiency(entity, source)
            else
                if model.calc_efficiency(entity, source) > eff then
                    best_source = source
                    eff = model.calc_efficiency(entity, source)
                end
            end
        end
    end

    if best_source == nil then
        -- create flying text
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "No nearby neutron source",
            color = {r=1, g=0.77, b=0},
            time_to_live = 15
        }

        return {
            source = nil,
            eff = 0
        }
    end

    -- create flying text
    if eff > 0 then
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "Efficiency: " .. eff .. "%",
            color = {r=0.48, g=0.77, b=0.37},
            time_to_live = 15
        }
    else
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "Insufficient neutron flux",
            color = {r=1, g=0.77, b=0},
            time_to_live = 15
        }
    end

    return {
        source = best_source,
        eff = eff
    }
end


function model.update_neutron_collector(entity)
    -- entity is a neutron collector?
    -- update its efficiency and set the according recipe / clear

    if model.entity_check(entity) == false then
        return
    end

    if entity.name ~= "ei_neutron-collector" then
        return
    end

    local foo = model.find_neutron_source(entity)

    if foo.eff == 0 then
        entity.set_recipe(nil)
        entity.recipe_locked = true

        model.remove_direction_animation(entity)

        return
    end

    -- set the recipe
    entity.set_recipe("ei_charged-neutron-container:"..foo.eff)
    entity.recipe_locked = true
    
    -- get the direction count corresponding to 64 directions
    local direction_count = model.get_looking_direction(entity, foo.source)
    model.make_direction_animation(entity, direction_count)
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

    local phi=  math.atan(Dx/Dy)

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
    
    game.print("direction")
    game.print(direction)

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

    local dist = math.sqrt((entity.position.x - source.position.x)^2 + (entity.position.y - source.position.y)^2)

    if dist > model.range then
        return 0
    end

    if dist < 1 then
        return 100
    end

    local efficiency = 100 - (dist / model.range) * 90 + model.neutron_sources[source.name]

    -- now "snap" efficiency to 10 percent steps
    efficiency = math.floor(efficiency / 10) * 10

    if efficiency < 0 then
        efficiency = 0
    elseif efficiency > 100 then
        efficiency = 100
    end

    return efficiency
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
        animation_offset=direction_count,
        x_scale=2,
        y_scale=2,
    })

    global.ei["neutron_collector_animation"][entity.unit_number] = animation
end


function model.remove_direction_animation(entity)
    if not global.ei["neutron_collector_animation"] then
        global.ei["neutron_collector_animation"] = {}
    end

    if global.ei["neutron_collector_animation"][entity.unit_number] then
        rendering.destroy(global.ei["neutron_collector_animation"][entity.unit_number])
        global.ei["neutron_collector_animation"][entity.unit_number] = nil
    end
end

--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    if entity.name == "ei_neutron-collector" then
        game.print(model.find_neutron_source(entity)["source"])
        game.print(model.find_neutron_source(entity)["eff"])

        model.update_neutron_collector(entity)
    end

    if model.neutron_sources[entity.name] then
        -- model.update_neutron_sources(entity)
    end

    
end

return model