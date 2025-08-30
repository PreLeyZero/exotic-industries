--====================================================================================================
-- -- CHECK FOR MOD
--====================================================================================================

if not mods["Krastorio2"] then
    return
end

-- techs to fix
-------------------------------------------------------------------------------

-- we need to remove the age techs from these, as for some reason they end up getting sorted into there

local techs_to_late_fix = {
    ["ei_steam-age"] = {
        "ei_tank-1", "ei_tank-2", "ei_tank-3",
        "kr-mineral-water-gathering", "kr-silicon-processing",
        "kr-logistic-containers-1", "kr-logistic-containers-2",
        "ei_cargo-bots", "ei_construction-bots",
        "kr-nuclear-reactor-equipment", "kr-radar",
        "kr-reinforced-plates", "kr-tesla-coil", "kr-personal-laser-defense-mk2-equipment",
    },
    ["ei_electricity-age"] = {
        "kr-logistic-containers-1", "kr-logistic-containers-2",
        "ei_cargo-bots", "ei_construction-bots",
        "kr-nuclear-reactor-equipment", "kr-portable-generator", "kr-tesla-coil",
        "kr-military-5", "kr-personal-laser-defense-mk2-equipment",
    },
    ["ei_computer-age"] = {
        "ei_advanced-bots", "ei_advanced-port", "ei_em-trains",
        "kr-advanced-additional-engine", "kr-energy-shield-mk3-equipment",
        "worker-robots-speed-4", "worker-robots-storage-2",
        "inserter-capacity-bonus-4", "laser-weapons-damage-4",
        "follower-robot-count-4",
    },
    ["ei_advanced-computer-age-tech"] = {
        "ei_acc_1", "ei_advanced-deep-drill", "ei_eff_1", "ei_spd_1",

    },
    ["ei_quantum-age"] = {
        "ei_em-trains", "kr-energy-shield-mk4-equipment", "kr-robot-battery-plus",
        "energy-weapons-damage-11", "follower-robot-count-8", "mining-productivity-11",
        "physical-projectile-damage-11", "refined-flammables-11", "stronger-explosives-11",
        "worker-robots-speed-7", "kr-personal-laser-defense-mk3-equipment",
    }
}

for prereq, foo in pairs(techs_to_late_fix) do
    for _, tech_name in ipairs(foo) do
        if not data.raw.technology[tech_name] then
            log("Tech " .. tech_name .. " does not exist")
            goto continue
        end

        log("Removing " .. prereq .. " from " .. tech_name)
        log(serpent.block(data.raw.technology[tech_name].prerequisites))
        ei_lib.remove_prerequisite(tech_name, prereq)

        ::continue::
    end
end