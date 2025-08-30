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


--UTIL
------------------------------------------------------------------------------------------------------

function model.get_transfer_inv(transfer)
    -- transfer is either a player index, a robot, or nil
    -- needed to prevent unregistration when the transferer cant mine due to full inv

    if not transfer then
        return nil
    end

    if type(transfer) == "number" then
        -- player index
        local player = game.get_player(transfer)
        return player.get_main_inventory()
    end

    if transfer.valid then
        -- robot
        local robot = transfer
        return robot.get_inventory(defines.inventory.robot_cargo)
    end

    return nil

end


function model.transfer_valid(source, transfer)

    local target_inv = model.get_transfer_inv(transfer)
    
    if not target_inv then
        -- case for when destroyed by gun f.e. -> need to unregister
        return true
    end

    -- check if contents of source and the source itself can be inserted into the target
    ---@type LuaInventory
    local source_inv = source.get_inventory(defines.inventory.chest)
    local source_contents = source_inv.get_contents()

    local return_value = true

    for _, item in pairs(source_contents) do

        local insertable_count = target_inv.get_insertable_count(item)

        if insertable_count < item.count then
            return_value = false
        end
    end

    -- check if the source itself can be inserted into the target
    if not target_inv.can_insert({name = source.name, count = 1}) then
        return_value = false
    end

    if return_value == true then
        if type(transfer) ~= "number" then
            -- robot
            -- if the source inv is not empty, the robot will not mine the source
            if not source_inv.is_empty() then
                return_value = false
            end
        end
    end

    return return_value

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


function model.check_init(id)

    if not storage.ei.black_hole then
        storage.ei.black_hole = {}
    end

    if not id then
        return
    end

    if not storage.ei.black_hole[id] then
        storage.ei.black_hole[id] = {}
    end

end


--UPDATE
------------------------------------------------------------------------------------------------------

function model.update_black_holes()

    if not storage.ei.black_hole then
        return
    end

    if not storage.ei.black_hole then
        return
    end

    for unit,_ in pairs(storage.ei.black_hole) do
        model.update_black_hole(unit)
    end

end


function model.update_black_hole(unit)

    local entity = storage.ei.black_hole[unit].entity

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

    if storage.ei.black_hole[unit].stage == 0 then

        if storage.ei.black_hole[unit].stage_progress == 0 then
            return
        end

    end

    local inv = entity.get_inventory(defines.inventory.chest)

    if not inv then
        return
    end

    local items = inv.get_contents()
    for _, item in pairs(items) do
        storage.ei.black_hole[unit].mass = storage.ei.black_hole[unit].mass + item.count
    end

    -- clear inventory
    inv.clear()

    -- game.print("Black hole mass: "..storage.ei.black_hole[unit].mass)

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

    storage.ei.black_hole[unit].battery = 0

    for _,injector in pairs(injectors) do

        if injector.energy > 10*1000*1000 then
            storage.ei.black_hole[unit].battery = storage.ei.black_hole[unit].battery + 1
        end

    end

    -- game.print("Black hole battery: "..storage.ei.black_hole[unit].battery)

end


function model.check_battery(unit, entity)

    if storage.ei.black_hole[unit].stage == 0 then
        return
    end

    if (storage.ei.black_hole[unit].stage == 1 and storage.ei.black_hole[unit].stage_progress == 0) then
        return
    end

    -- if battery less then 8 then reset the stage and stage progress
    -- and print warning

    if storage.ei.black_hole[unit].battery < 8 then
        storage.ei.black_hole[unit].stage = 0
        storage.ei.black_hole[unit].stage_progress = 0
        rendering.draw_text{
            target = entity,
            text = "WARNING: Black hole containment failure!",
            color = {r=1, g=0, b=0},
            surface = entity.surface,
            scale = 1,
            time_to_live = 120
        }

        -- also print chat message
        game.print("WARNING: Black hole containment failure at "..entity.position.x..", "..entity.position.y.."!")
    end

end


function model.make_energy(unit)

    -- calc energy radiated away per second

    local mass = storage.ei.black_hole[unit].mass

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
    
    storage.ei.black_hole[unit].mass = mass - mass_loss
    local energy = energy + mass_loss * 25 -- in GW

    -- safe this value if its 30 ticks after last save
    local tick = game.tick
    if tick - storage.ei.black_hole[unit].last_tick > 30 then
        storage.ei.black_hole[unit].energy_last = storage.ei.black_hole[unit].energy
        storage.ei.black_hole[unit].last_tick = tick
    end

    storage.ei.black_hole[unit].energy = energy / 100 -- energy generated in this tick in GJ
    -- *60 to get power output in GW

    -- game.print("Black hole energy: "..storage.ei.black_hole[unit].energy.." GW")

end


function model.make_output(unit)

    -- calc energy output

    local energy = storage.ei.black_hole[unit].energy
    local energy_last = storage.ei.black_hole[unit].energy_last

    local energy_out = (energy + energy_last) / 2

    storage.ei.black_hole[unit].energy_out = energy_out

    -- game.print("Black hole energy out: "..storage.ei.black_hole[unit].energy_out.." GW")

end


function model.apply_output(unit, entity)

    local power_out = storage.ei.black_hole[unit].energy_out -- in GJ per tick
    local giga = 1000*1000*1000

    -- get all extractor pylons in range
    local extractors = entity.surface.find_entities_filtered{
        name = "ei_energy-extractor-pylon",
        position = entity.position,
        radius = 20,
    }

    for _,extractor in pairs(extractors) do

        -- no energy output in stage 0 and 1
        if storage.ei.black_hole[unit].stage ~= 2 then
            extractor.energy = 0
            goto continue
        end

        -- a single extractor can extract 100GJ/s == 100GJ/60 ticks

        if power_out*60 > 100 then
            extractor.energy = extractor.energy + 100*giga/60 -- add 100GJ/60 ticks
            power_out = power_out - 100/60
        else
            extractor.energy = extractor.energy + giga*power_out -- rest of power, already in ticks
            power_out = 0
        end

        ::continue::

    end

end


function model.update_stage(unit)

    -- stage progess of 0 means stage before is completed, but button for next stage is not pressed yet
    -- button press sets progress to 1

    if storage.ei.black_hole[unit].stage == 0 then

        if storage.ei.black_hole[unit].stage_progress > 0 then

            -- 1000 mass is needed to get to stage 1
            if storage.ei.black_hole[unit].mass >= 1000 then
                storage.ei.black_hole[unit].stage = 1
                storage.ei.black_hole[unit].stage_progress = 0
            else
                storage.ei.black_hole[unit].stage_progress = storage.ei.black_hole[unit].mass / 1000 * 100
            end

        end

    end

    if storage.ei.black_hole[unit].stage == 1 then

        if storage.ei.black_hole[unit].stage_progress > 0 then

            -- machine needs to run with 8 pylons active (40 GW in) for 1 minute
            -- so here count stageprogess in ticks

            if storage.ei.black_hole[unit].stage_progress < 3600 then
                storage.ei.black_hole[unit].stage_progress = storage.ei.black_hole[unit].stage_progress + 1
            else
                storage.ei.black_hole[unit].stage = 2
                storage.ei.black_hole[unit].stage_progress = 0

                model.invoke_victory(unit)
            end

        end

    end

    -- nothing to do for stage 2
    -- game.print("stage: "..storage.ei.black_hole[unit].stage)
    -- game.print("stage progress: "..storage.ei.black_hole[unit].stage_progress)

end


function model.make_stage_picture(unit, entity)

    local stage = storage.ei.black_hole[unit].stage

    -- for stage 0 noting to do
    
    if stage == 0 then

        -- check if there is a overlay, if yes remove it

        if storage.ei.black_hole[unit].overlay ~= nil then
            
            storage.ei.black_hole[unit].overlay.destroy()
            storage.ei.black_hole[unit].overlay = nil

        end

    end

    if stage == 1 then

        -- draw an overlay according to the current stage progress, the overlay has 36 frames total

        local progress = storage.ei.black_hole[unit].stage_progress
        -- max progress is 3600 ticks, so 1 new frame every 100 ticks

        local frame = math.floor(progress / 100)
        if frame > 35 then
            frame = 35
        end


        if storage.ei.black_hole[unit].overlay == nil then

            storage.ei.black_hole[unit].overlay = rendering.draw_animation{
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
            storage.ei.black_hole[unit].overlay.animation = "ei_black-hole_growing"
            storage.ei.black_hole[unit].overlay.animation_offset = frame

        end

    end

    if stage == 2 then

        -- check if the current overlay is "ei_black-hole_glowing", if not change it

        if storage.ei.black_hole[unit].overlay == nil then

            storage.ei.black_hole[unit].overlay = rendering.draw_animation{
                animation = "ei_black-hole_glowing",
                target = entity,
                surface = entity.surface,
                render_layer = "object",
                x_scale = 1,
                y_scale = 1,
                animation_speed = 0.3,
            }

        else
            storage.ei.black_hole[unit].overlay.animation = "ei_black-hole_glowing"
            storage.ei.black_hole[unit].overlay.animation_speed = 0.3

        end

    end

end


function model.invoke_victory(unit)

    -- get force of black hole and check if this force has achieved victory
    -- if no give victory to this force

    local force = storage.ei.black_hole[unit].entity.force

    if not storage.ei.victory then
        storage.ei.victory = {}
    end

    if storage.ei.victory[force.name] == true then
        return
    end

    storage.ei.victory[force.name] = true

    ei_victory.add_interface()

    if remote.interfaces["better-victory-screen"] and remote.interfaces["better-victory-screen"]["trigger_victory"] then
        remote.call("better-victory-screen", "trigger_victory", force)
    else
        game.set_game_state{game_finished = true, player_won = true, can_continue = true, victorious_force = force}
    end
end


--REGISTERS
------------------------------------------------------------------------------------------------------

function model.register_black_hole(entity)

    if entity.name ~= "ei_black-hole" then
        return
    end

    model.check_init(entity.unit_number)

    -- register this black hole
    storage.ei.black_hole[entity.unit_number].entity = entity
    storage.ei.black_hole[entity.unit_number].mass = 0
    storage.ei.black_hole[entity.unit_number].battery = 0       -- energy for containement field (multiple of 5GW)
    storage.ei.black_hole[entity.unit_number].energy = 0
    storage.ei.black_hole[entity.unit_number].energy_last = 0
    storage.ei.black_hole[entity.unit_number].last_tick = game.tick
    storage.ei.black_hole[entity.unit_number].energy_out = 0 -- mean of energy values
    storage.ei.black_hole[entity.unit_number].stage = 0
    storage.ei.black_hole[entity.unit_number].stage_progress = 0 -- max 100

    -- spawn the animation in
    local animation = rendering.draw_animation{
        animation = "ei_black-hole_animation",
        target = entity,
        surface = entity.surface,
        render_layer = "object",
        x_scale = 1,
        y_scale = 1,
    }

    storage.ei.black_hole[entity.unit_number].animation = animation

end


function model.unregister_black_hole(entity, transfer)

    if entity.name ~= "ei_black-hole" then
        return
    end

    if not model.transfer_valid(entity, transfer) then
        return
    end

    model.check_init()

    -- unregister this black hole
    storage.ei.black_hole[entity.unit_number] = nil

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


function model.on_destroyed_entity(entity, transfer)

    model.unregister_black_hole(entity, transfer)

end


function model.update()

    model.update_black_holes()

    model.update_player_guis()

end


--GUI related
------------------------------------------------------------------------------------------------------

-- WHAT NEEDS GUI TO DO
-- show: current mass, energy produced last tick, energy injector pylons in range, energy extractor pylons in range
-- show: current stage, stage progress

-- Button: start next stage (only if stage progress = 0, sets stage progress to 1)

-- everything related to the black hole is stored in storage.ei.black_hole[unit], here unit is the unit number of the black hole entity (container)

-- ===== GETTERS =====

function model.get_mass(unit)
    -- mass stored in the black hole

    model.check_init(unit)

    return storage.ei.black_hole[unit].mass

end


function model.get_power(unit)
    -- energy produced last second

    model.check_init(unit)

    return storage.ei.black_hole[unit].energy*60 -- in GW

end


function model.get_injector_pylons_in_range(unit)
    -- number of pylons in range

    model.check_init(unit)

    local entity = storage.ei.black_hole[unit].entity

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

    local entity = storage.ei.black_hole[unit].entity

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

    return storage.ei.black_hole[unit].stage

end


function model.get_stage_progress(unit)
    -- current stage progress

    model.check_init(unit)

    return storage.ei.black_hole[unit].stage_progress

end


function model.get_relative_stage_progress(unit)
    -- get stage progress relative to max amaount for current stage
    -- returns values between 0 and 100

    model.check_init(unit)

    local stage = storage.ei.black_hole[unit].stage
    local progress = storage.ei.black_hole[unit].stage_progress

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

    storage.ei.black_hole[unit].stage_progress = value

end


--GUI
------------------------------------------------------------------------------------------------------

function model.open_gui(player)

    if player.gui.relative["ei_black-hole-console"] then
        model.close_gui(player)
    end

    local root = player.gui.relative.add{
        type = "frame",
        name = "ei_black-hole-console",
        anchor = {
            gui = defines.relative_gui_type.container_gui,
            name = "ei_black-hole",
            position = defines.relative_gui_position.right,
        },
        direction = "vertical",
    }

    do -- Titlebar
        local titlebar = root.add{type = "flow", direction = "horizontal"}
        titlebar.add{
            type = "label",
            caption = {"exotic-industries.black-hole-gui-title"},
            style = "frame_title",
        }

        titlebar.add{
            type = "empty-widget",
            style = "ei_titlebar_nondraggable_spacer",
            ignored_by_interaction = true
        }

        titlebar.add{
            type = "sprite-button",
            sprite = "virtual-signal/informatron",
            tooltip = {"exotic-industries.gui-open-informatron"},
            style = "frame_action_button",
            tags = {
                parent_gui = "ei_black-hole-console",
                action = "goto-informatron",
                page = "black_hole"
            }
        }
    end

    local main_container = root.add{
        type = "frame",
        name = "main-container",
        direction = "vertical",
        style = "inside_shallow_frame",
    }

    do -- Status subheader
        main_container.add{
            type = "frame",
            style = "ei_subheader_frame",
        }.add{
            type = "label",
            caption = {"exotic-industries.black-hole-gui-status-title"},
            style = "subheader_caption_label",
        }
    
        local status_flow = main_container.add{
            type = "flow",
            name = "status-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        status_flow.add{
            type = "label",
            name = "mass",
            caption = {"exotic-industries.black-hole-gui-status-mass", 0},
            tooltip = {"exotic-industries.black-hole-gui-status-mass-tooltip"},
        }

        status_flow.add{
            type = "label",
            name = "power",
            caption = {"exotic-industries.black-hole-gui-status-power", 0},
            tooltip = {"exotic-industries.black-hole-gui-status-power-tooltip"},
        }

        status_flow.add{
            type = "progressbar",
            name = "injectors",
            caption = {"exotic-industries.black-hole-gui-status-injectors", 0},
            style = "ei_status_progressbar_red"
        }

        status_flow.add{
            type = "progressbar",
            name = "extractors",
            caption = {"exotic-industries.black-hole-gui-status-extractors", 0},
            style = "ei_status_progressbar_grey"
        }
    end

    do -- Control

        main_container.add{
            type = "frame",
            style = "ei_subheader_frame_with_top_border",
        }.add{
            type = "label",
            caption = {"exotic-industries.black-hole-gui-control-title"},
            style = "subheader_caption_label",
        }

        local control_flow = main_container.add{
            type = "flow",
            name = "control-flow",
            direction = "vertical",
            style = "ei_inner_content_flow",
        }

        control_flow.add{
            type = "progressbar",
            name = "stage",
            caption = {"exotic-industries.black-hole-gui-control-stage", 0},
            style = "ei_status_progressbar"
        }

        control_flow.add{
            type = "progressbar",
            name = "stage-progress",
            caption = {"exotic-industries.black-hole-gui-control-stage-progress", 0},
            style = "ei_status_progressbar_grey"
        }

        control_flow.add{
            type = "button",
            name = "control-button",
            caption = {"exotic-industries.black-hole-gui-control-button"},
            style = "ei_green_button",
            tags = {
                action = "control-start",
                parent_gui = "ei_black-hole-console",
            }
        }

    end

end


function model.update_player_guis()

    for _, player in pairs(game.players) do
        if player.gui.relative["ei_black-hole-console"] then
            if not player.opened then
                model.close_gui(player)
                return
            end

            local unit = player.opened.unit_number
            local data = model.get_data(unit)
            model.update_gui(player, data)
        end
    end

end


function model.get_data(unit)

    local data = {}

    local injectors = model.get_injector_pylons_in_range(unit)
    local extractors = model.get_extractor_pylons_in_range(unit)
    local stage_progress = model.get_relative_stage_progress(unit)
    local stage = model.get_stage(unit)

    data.mass = model.get_mass(unit)
    data.power = model.get_power(unit)

    -- adjust power for stages
    if stage ~= 2 then
        data.power = 0
    end


    -- injector progressbar
    data.injectors = {}
    data.injectors.caption = injectors
    data.injectors.value = injectors / 8
    data.injectors.max = 8

    if stage == 0 then
        data.injectors.value = 1 -- no injectors needed at stage 0
        data.injectors.max = 0
    end

    if data.injectors.value > 1 then
        data.injectors.value = 1
    end


    -- extractor progressbar
    data.extractors = {}
    data.extractors.caption = extractors
    data.extractors.max = 0

    if data.power == 0 then
        data.extractors.value = 1
        data.extractors.max = 0
        data.extractors.caption = 0
    end

    if data.power > 0 then
        data.extractors.value = extractors * 100 / data.power
        data.extractors.max = math.floor(data.power / 100 + 0.5)
    end

    if data.extractors.value > 1 then
        data.extractors.value = 1
    end


    -- stage progressbar
    data.stage_progress = {}
    data.stage_progress.caption = stage_progress
    data.stage_progress.value = stage_progress/100

    data.stage = {}
    data.stage.caption = stage
    data.stage.value = stage/2

    if stage_progress > 0 then
        data.stage.value = data.stage.value + 0.25
    end

    if data.stage.value > 1 then
        data.stage.value = 1
    end


    -- control button
    data.control_button = 1

    if stage == 0 and stage_progress == 0 then
        data.control_button = 1
    elseif stage == 0 and stage_progress > 0 then
        data.control_button = 2
    elseif stage == 1 and stage_progress == 0 then
        data.control_button = 3
    elseif stage == 1 and stage_progress > 0 then
        data.control_button = 4
    elseif stage == 2 and stage_progress == 0 then
        data.control_button = 5
    elseif stage == 2 and stage_progress > 0 then
        data.control_button = 5 -- should not be possible
    end

    return data

end


function model.update_gui(player, data)

    local root = player.gui.relative["ei_black-hole-console"]
    local status = root["main-container"]["status-flow"]
    local control = root["main-container"]["control-flow"]

    local mass = status["mass"]
    local power = status["power"]
    local injectors = status["injectors"]
    local extractors = status["extractors"]

    local stage = control["stage"]
    local stage_progress = control["stage-progress"]
    local control_button = control["control-button"]

    -- Update status
    mass.caption = {"exotic-industries.black-hole-gui-status-mass", string.format("%.1f", data.mass/100)}
    power.caption = {"exotic-industries.black-hole-gui-status-power", string.format("%.1f", data.power)} -- in GW

    injectors.caption = {"exotic-industries.black-hole-gui-status-injectors", data.injectors.caption, data.injectors.max}
    injectors.value = data.injectors.value
    if data.injectors.value == 1 then
        injectors.style = "ei_status_progressbar"
    else
        injectors.style = "ei_status_progressbar_red"
    end

    extractors.caption = {"exotic-industries.black-hole-gui-status-extractors", data.extractors.caption, data.extractors.max}
    extractors.value = data.extractors.value

    -- Update control
    stage.caption = {"exotic-industries.black-hole-gui-control-stage", data.stage.caption}
    stage.value = data.stage.value

    stage_progress.caption = {"exotic-industries.black-hole-gui-control-stage-progress", string.format("%.1f", data.stage_progress.caption)}
    stage_progress.value = data.stage_progress.value

    -- Update control button
    if data.control_button == 1 then
        control_button.caption = {"exotic-industries.black-hole-gui-control-control-button-1"}
        control_button.style = "ei_green_button"
    elseif data.control_button == 2 then
        control_button.caption = {"exotic-industries.black-hole-gui-control-control-button-2"}
        control_button.style = "ei_button"
    elseif data.control_button == 3 then
        control_button.caption = {"exotic-industries.black-hole-gui-control-control-button-3"}
        control_button.style = "ei_green_button"
    elseif data.control_button == 4 then
        control_button.caption = {"exotic-industries.black-hole-gui-control-control-button-4"}
        control_button.style = "ei_button"
    elseif data.control_button == 5 then
        control_button.caption = {"exotic-industries.black-hole-gui-control-control-button-5"}
        control_button.style = "ei_button"
    end



end


function model.change_stage(player)

    local entity = player.opened

    if entity.name ~= "ei_black-hole" then
        return
    end

    local unit = entity.unit_number

    -- if stage progress > 0, do nothing
    if model.get_stage_progress(unit) > 0 then
        return
    end

    -- otherwise set it to 1
    model.set_stage_progress(unit, 1)

end


function model.on_gui_click(event)
    if event.element.tags.action == "control-start" then
        model.change_stage(game.get_player(event.player_index))
    end

    if event.element.tags.action == "goto-informatron" then 
        if game.forces["player"].technologies["ei_black-hole-exploration"].enabled == true then
            remote.call("informatron", "informatron_open_to_page", {
                player_index = event.player_index,
                interface = "exotic-industries-informatron",
                page_name = event.element.tags.page
            })
        end
    end
end


function model.close_gui(player)
    if player.gui.relative["ei_black-hole-console"] then
        player.gui.relative["ei_black-hole-console"].destroy()
    end
end


function model.on_gui_opened(event)
    model.open_gui(game.get_player(event.player_index))
end


return model