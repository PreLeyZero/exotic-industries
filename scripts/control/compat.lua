local model = {}

--====================================================================================================
--MOD COMPATIBILITY
--====================================================================================================

function model.check_init()

    if game.tick ~= 1 then return end 

    -- K2
    ---------------------------------------------------------------------------
    remote.call("kr-intergalactic-transceiver", "set_no_victory", true)
    
end


function model.nth_tick(e)

    -- K2
    ---------------------------------------------------------------------------

    local forces = game.forces

    -- check if the K2 logo tech is not hidden anymore
    for _, force in pairs(forces) do
        if force.technologies["kr-logo"].enabled then
            if not global.k2_win then
                global.k2_win = true
                game.print({"exotic-industries.k2-win"})
                ei_planet_exploration.discover_new_space_destination(force, "deep-space")
            end
        end
    end


end


return model