-- disable vanilla victory condition by rocket launch

local victory_disabler = {}

--====================================================================================================
--VICTORY DISABLER
--====================================================================================================


function victory_disabler.init()
    for _, interface in pairs{"silo_script", "better-victory-screen"} do
        if remote.interfaces[interface] and remote.interfaces[interface]["set_no_victory"] then
          remote.call(interface, "set_no_victory", true)
        end
    end
end


function victory_disabler.add_interface()
    if script.active_mods["better-victory-screen"] then
        -- if interface is not yet added
        if remote.interfaces["exotic-industries-bvs"] then return end
        remote.add_interface("exotic-industries-bvs", {["better-victory-screen-statistics"] = function(winning_force, forces)
            return {
                by_force = {
                    ["player"] = {
                        ["exotic"] = { order = "a", stats = {
                            ["artifacts_repaired"] = { value = victory_disabler.return_value("artifacts_repaired"), order = "a" },
                            ["artifacts_scanned"] = { value = victory_disabler.return_value("artifacts_scanned"), order = "b" },
                            ["gate_items_transported"] = { value = victory_disabler.return_value("gate_items_transported"), order = "c" },
                            ["knowledge_gained"] = { value = victory_disabler.return_value("knowledge_gained"), order = "d" },
                            ["machines_overloaded"] = { value = victory_disabler.return_value("machines_overloaded"), order = "e" },
                            ["neutron_collector_efficiency"] = { value = victory_disabler.return_value("neutron_collector_efficiency"), order = "f" },
                        }}
                    },
                }
            }
        end})
    end
end

--COUNTING STATS
------------------------------------------------------------------------------------------------------

-- stuff to count:
-- artifact repaired
-- stuff scanned
-- gate items transported
-- total knowledge gained
-- machines beacon overloaded
-- exotic assemblers exploded
-- drone uplinks initiated
-- total neutron collector efficiency


function victory_disabler.check_init(subvalue)

    if not storage.ei.stats then
        storage.ei.stats = {}
    end

    if not subvalue then return end

    if not storage.ei.stats[subvalue] then
        storage.ei.stats[subvalue] = 0
    end

end


function victory_disabler.count_value(subvalue, add)

    add = add or 1
    victory_disabler.check_init(subvalue)

    storage.ei.stats[subvalue] = storage.ei.stats[subvalue] + add

end


function victory_disabler.return_value(subvalue)

    victory_disabler.check_init(subvalue)

    return storage.ei.stats[subvalue]

end


return victory_disabler
