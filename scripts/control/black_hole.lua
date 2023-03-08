local model = {}

--====================================================================================================
--BLACK HOLE
--====================================================================================================

-- HOW IT WORKS
-- 3 STAGES:
-- 0: no injector pylons needed, no energy produced, at start no mass gets absorbed
-- if stage progress > 1 then mass gets absorbed until 1000 is reached -> stage 1

-- 1: 8 injector pylons needed (not at progess = 0), no energy produced, mass gets constantly absorbed/decays
-- if stage progess > 1, then 8 pylons need to be active, in 60s the black hole builds up to full size -> stage 2

-- 2: 8 injector pylons needed contantly, energy gets produced according to current mass AND mass decaying, can be extracted through extractor pylons

-- when progess is 0 is a kind of waiting state for the player to press a button to start the next stage

-- NOTE: injector pylons are considered as active if they have at least 10GJ of energy in their internal buffer (max is 20GJ),
-- they consume 5GW constantly


--GUI related
------------------------------------------------------------------------------------------------------

-- WHAT NEEDS GUI TO DO
-- show: current mass, energy produced last tick, energy injector pylons in range, energy extractor pylons in range
-- show: current stage, stage progress

-- Button: start next stage (only if stage progress = 0, sets stage progress to 1)

-- everything related to the black hole is stored in global.ei.black_hole[unit], here unit is the unit number of the black hole entity (container)

-- ===== GETTERS =====

function model.get_mass(unit)
    -- mass stored in the black hole

    model.check_init(unit)

    return global.ei.black_hole[unit].mass

end


function model.get_energy(unit)
    -- energy produced last second

    model.check_init(unit)

    return global.ei.black_hole[unit].energy*60 -- in GW

end


function model.get_injector_pylons_in_range(unit)
    -- number of pylons in range

    model.check_init(unit)

    local injectors = entity.surface.find_entities_filtered{
        name = "ei_energy-injector-pylon",
        position = entity.position,
        radius = 20,
    }

    return #injectors

end


function model.get_extractor_pylons_in_range(unit)
    -- number of pylons in range

    model.check_init(unit)

    local extractors = entity.surface.find_entities_filtered{
        name = "ei_energy-extractor-pylon",
        position = entity.position,
        radius = 20,
    }

    return #extractors

end


function model.get_stage(unit)
    -- current stage

    model.check_init(unit)

    return global.ei.black_hole[unit].stage

end


function model.get_stage_progress(unit)
    -- current stage progress

    model.check_init(unit)

    return global.ei.black_hole[unit].stage_progress

end


function model.get_relative_stage_progress(unit)
    -- get stage progress relative to max amaount for current stage
    -- returns values between 0 and 100

    model.check_init(unit)

    local stage = global.ei.black_hole[unit].stage
    local progress = global.ei.black_hole[unit].stage_progress

    if stage == 0 then
        return progress
    end

    if stage == 1 then
        return progress / 3600 * 100
    end

    if stage == 2 then
        return 0
    end
    
end

-- ===== SETTERS =====

function model.set_stage_progress(unit, value)
    -- current stage progress, use 1 to startup next stage

    model.check_init(unit)

    global.ei.black_hole[unit].stage_progress = value

end


--UTIL
------------------------------------------------------------------------------------------------------

function model.entity_check(entity)

    if entity == nil then
        return false
    end

    if not entity.valid then
        return false
    end

    return true

end


function model.check_init(id)

    if not global.ei.black_hole then
        global.ei.black_hole = {}
    end

    if not id then
        return
    end

    if not global.ei.black_hole[id] then
        global.ei.black_hole[id] = {}
    end

end


--UPDATE
------------------------------------------------------------------------------------------------------

function model.update_black_holes()

    if not global.ei.black_hole then
        return
    end

    if not global.ei.black_hole then
        return
    end

    for unit,_ in pairs(global.ei.black_hole) do
        model.update_black_hole(unit)
    end

end


function model.update_black_hole(unit)

    local entity = global.ei.black_hole[unit].entity

    if not model.entity_check(entity) then
        return
    end

    -- aborb all items in inventory and add them to mass count
    model.update_mass(unit, entity)

    model.update_battery(unit, entity)

    model.make_energy(unit)

    model.make_output(unit)

    model.check_battery(unit, entity)

    model.update_stage(unit, entity)

    model.make_stage_picture(unit, entity)

    model.apply_output(unit, entity)

end


function model.update_mass(unit, entity)

    if global.ei.black_hole[unit].stage == 0 then

        if global.ei.black_hole[unit].stage_progress == 0 then
            return
        end

    end

    local inv = entity.get_inventory(defines.inventory.chest)

    if not inv then
        return
    end

    local items = inv.get_contents()
    for name, count in pairs(items) do
        global.ei.black_hole[unit].mass = global.ei.black_hole[unit].mass + count
    end

    -- clear inventory
    inv.clear()

    -- game.print("Black hole mass: "..global.ei.black_hole[unit].mass)

end


function model.update_battery(unit, entity)

    -- find all energy injectors in range
    -- check if they are running and if so add 10GW to battery for each injector

    local injectors = entity.surface.find_entities_filtered{
        name = "ei_energy-injector-pylon",
        position = entity.position,
        radius = 20,
    }

    -- game.print("Found "..#injectors.." injectors")

    global.ei.black_hole[unit].battery = 0

    for _,injector in pairs(injectors) do

        if injector.energy > 10*1000*1000 then
            global.ei.black_hole[unit].battery = global.ei.black_hole[unit].battery + 1
        end

    end

    -- game.print("Black hole battery: "..global.ei.black_hole[unit].battery)

end


function model.check_battery(unit, entity)

    if global.ei.black_hole[unit].stage == 0 then
        return
    end

    if (global.ei.black_hole[unit].stage == 1 and global.ei.black_hole[unit].stage_progress == 0) then
        return
    end

    -- if battery less then 8 then reset the stage and stage progress
    -- and print warning

    if global.ei.black_hole[unit].battery < 8 then
        global.ei.black_hole[unit].stage = 0
        global.ei.black_hole[unit].stage_progress = 0
        entity.surface.create_entity{
            name = "flying-text",
            position = entity.position,
            text = "WARNING: Black hole containment failure!",
            color = {r=1, g=0, b=0},
        }

        -- also print chat message
        game.print("WARNING: Black hole containment failure at "..entity.position.x..", "..entity.position.y.."!")
    end

end


function model.make_energy(unit)

    -- calc energy radiated away per second

    local mass = global.ei.black_hole[unit].mass

    if mass < 0 then
        mass = 0
    end

    local energy = mass * 0.1
    local mass_loss = math.floor(mass * 0.005)

    if mass_loss < 1 then
        mass_loss = 1
    end

    if mass - mass_loss < 0 then
        mass_loss = 0
    end
    
    global.ei.black_hole[unit].mass = mass - mass_loss
    local energy = energy + mass_loss * 25 -- in GW

    -- safe this value if its 30 ticks after last save
    local tick = game.tick
    if tick - global.ei.black_hole[unit].last_tick > 30 then
        global.ei.black_hole[unit].energy_last = global.ei.black_hole[unit].energy
        global.ei.black_hole[unit].last_tick = tick
    end

    global.ei.black_hole[unit].energy = energy

    -- game.print("Black hole energy: "..global.ei.black_hole[unit].energy.." GW")

end


function model.make_output(unit)

    -- calc energy output

    local energy = global.ei.black_hole[unit].energy
    local energy_last = global.ei.black_hole[unit].energy_last

    local energy_out = (energy + energy_last) / 2

    global.ei.black_hole[unit].energy_out = energy_out

    -- game.print("Black hole energy out: "..global.ei.black_hole[unit].energy_out.." GW")

end


function model.apply_output(unit, entity)

    local energy_out = global.ei.black_hole[unit].energy_out -- in GW

    -- get all extractor pylons in range
    local extractors = entity.surface.find_entities_filtered{
        name = "ei_energy-extractor-pylon",
        position = entity.position,
        radius = 20,
    }

    for _,extractor in pairs(extractors) do

        -- no energy output in stage 0 and 1
        if global.ei.black_hole[unit] ~= 2 then
            extractor.energy = 0
            goto continue
        end

        if energy_out > 100 then
            extractor.energy = 100*1000*1000*60 -- 100GW
            energy_out = energy_out - 100
        else
            extractor.energy = energy_out*1000*1000*60 -- 100GW
            energy_out = 0
        end

        ::continue::

    end

end


function model.update_stage(unit)

    -- stage progess of 0 means stage before is completed, but button for next stage is not pressed yet
    -- button press sets progress to 1

    if global.ei.black_hole[unit].stage == 0 then

        if global.ei.black_hole[unit].stage_progress > 0 then

            -- 1000 mass is needed to get to stage 1
            if global.ei.black_hole[unit].mass >= 1000 then
                global.ei.black_hole[unit].stage = 1
                global.ei.black_hole[unit].stage_progress = 0
            else
                global.ei.black_hole[unit].stage_progress = global.ei.black_hole[unit].mass / 1000 * 100
            end

        end

    end

    if global.ei.black_hole[unit].stage == 1 then

        if global.ei.black_hole[unit].stage_progress > 0 then

            -- machine needs to run with 8 pylons active (40 GW in) for 1 minute
            -- so here count stageprogess in ticks

            if global.ei.black_hole[unit].stage_progress < 3600 then
                global.ei.black_hole[unit].stage_progress = global.ei.black_hole[unit].stage_progress + 1
            else
                global.ei.black_hole[unit].stage = 2
                global.ei.black_hole[unit].stage_progress = 0

                model.invoke_victory(unit)
            end

        end

    end

    -- nothing to do for stage 2
    -- game.print("stage: "..global.ei.black_hole[unit].stage)
    -- game.print("stage progress: "..global.ei.black_hole[unit].stage_progress)

end


function model.make_stage_picture(unit, entity)

    local stage = global.ei.black_hole[unit].stage

    -- for stage 0 noting to do
    
    if stage == 0 then

        -- check if there is a overlay, if yes remove it

        if global.ei.black_hole[unit].overlay ~= nil then
            
            rendering.destroy(global.ei.black_hole[unit].overlay)
            global.ei.black_hole[unit].overlay = nil

        end

    end

    if stage == 1 then

        -- draw an overlay according to the current stage progress, the overlay has 36 frames total

        local progress = global.ei.black_hole[unit].stage_progress
        -- max progress is 3600 ticks, so 1 new frame every 100 ticks

        local frame = math.floor(progress / 100)
        if frame > 35 then
            frame = 35
        end


        if global.ei.black_hole[unit].overlay == nil then

            global.ei.black_hole[unit].overlay = rendering.draw_animation{
                animation = "ei_black-hole_growing",
                target = entity,
                surface = entity.surface,
                render_layer = "object",
                animation_speed = 0,
                animation_offset = frame,
                x_scale = 1,
                y_scale = 1,
            }

        else

            rendering.set_animation(global.ei.black_hole[unit].overlay, "ei_black-hole_growing")
            rendering.set_animation_offset(global.ei.black_hole[unit].overlay, frame)

        end

    end

    if stage == 2 then

        -- check if the current overlay is "ei_black-hole_glowing", if not change it

        if global.ei.black_hole[unit].overlay == nil then

            global.ei.black_hole[unit].overlay = rendering.draw_animation{
                animation = "ei_black-hole_glowing",
                target = entity,
                surface = entity.surface,
                render_layer = "object",
                x_scale = 1,
                y_scale = 1,
                animation_speed = 0.3,
            }

        else

            rendering.set_animation(global.ei.black_hole[unit].overlay, "ei_black-hole_glowing")
            rendering.set_animation_speed(global.ei.black_hole[unit].overlay, 0.3)

        end

    end

end


function model.invoke_victory(unit)

    -- get force of black hole and check if this force has achieved victory
    -- if no give victory to this force

    local force = global.ei.black_hole[unit].entity.force

    if global.ei.victory[force.name] == true then
        return
    end

    global.ei.victory[force.name] = true
    game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = force}

end


--REGISTERS
------------------------------------------------------------------------------------------------------

function model.register_black_hole(entity)

    if entity.name ~= "ei_black-hole" then
        return
    end

    model.check_init(entity.unit_number)

    -- register this black hole
    global.ei.black_hole[entity.unit_number].entity = entity
    global.ei.black_hole[entity.unit_number].mass = 0
    global.ei.black_hole[entity.unit_number].battery = 0       -- energy for containement field (multiple of 5GW)
    global.ei.black_hole[entity.unit_number].energy = 0
    global.ei.black_hole[entity.unit_number].energy_last = 0
    global.ei.black_hole[entity.unit_number].last_tick = game.tick
    global.ei.black_hole[entity.unit_number].energy_out = 0 -- mean of energy values
    global.ei.black_hole[entity.unit_number].stage = 0
    global.ei.black_hole[entity.unit_number].stage_progress = 0 -- max 100

    -- spawn the animation in
    local animation = rendering.draw_animation{
        animation = "ei_black-hole_animation",
        target = entity,
        surface = entity.surface,
        render_layer = "object",
        x_scale = 1,
        y_scale = 1,
    }

    global.ei.black_hole[entity.unit_number].animation = animation

end


function model.unregister_black_hole(entity)

    if entity.name ~= "ei_black-hole" then
        return
    end

    model.check_init()

    -- unregister this black hole
    global.ei.black_hole[entity.unit_number] = nil

end


function model.built_injector_pylon(entity)

end


function model.built_extractor_pylon(entity)

end


--HANDLERS
------------------------------------------------------------------------------------------------------

function model.on_built_entity(entity)

    if model.entity_check(entity) == false then
        return
    end

    model.register_black_hole(entity)

    model.built_injector_pylon(entity)

    model.built_extractor_pylon(entity)

end


function model.on_destroyed_entity(entity)

    model.unregister_black_hole(entity)

end


function model.update()

    model.update_black_holes()

end


return model

-- TODO
-- make energy extractors working
-- add stages
-- add stage progress
-- add mass limits for stages
-- add energy output limits for stages
-- add animations for pylon connections