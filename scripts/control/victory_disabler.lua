-- disable vanilla victory condition by rocket launch

local victory_disabler = {}

--====================================================================================================
--VICTORY DISABLER
--====================================================================================================

function victory_disabler.init()
    if remote.interfaces["silo_script"] and remote.interfaces["silo_script"]["set_no_victory"] then
        remote.call("silo_script", "set_no_victory", true)
    end
end

return victory_disabler
