local model = {}

--====================================================================================================
--ROCKET SILO
--====================================================================================================

function model.open_gui(player)
    if player.gui.relative["ei_rocket-silo-console"] then
        model.close_gui(player)
    end
end

function model.close_gui(player)
    
end

return model
