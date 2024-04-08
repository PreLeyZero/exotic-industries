local model = {}

--====================================================================================================
--MOD COMPATIBILITY
--====================================================================================================

function model.check_init()

    if game.tick ~= 1 then
        return
    end 

    -- K2
    ---------------------------------------------------------------------------

    remote.call("kr-intergalactic-transceiver", "set_no_victory", true)
    
end


return model