-- disable vanilla victory condition by rocket launch

local victory_disabler = {}

--====================================================================================================
--VICTORY DISABLER
--====================================================================================================

function victory_disabler.init()
    for interface, functions in pairs(remote.interfaces) do
        if (functions["set_no_victory"] ~= nil) then
            remote.call(interface, "set_no_victory", true)
        end
    end
end

return victory_disabler
