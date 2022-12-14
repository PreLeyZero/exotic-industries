-- store data like switch tables and other constants/parameters here
-- excluding global table stuff
-- can be used in data stage AND in control

local ei_data = {}

ei_data.prerequisites_to_set = {}
ei_data.tech_scaling = {}
ei_data.science = {}
ei_data.tech_structure = {}
ei_data.colors = {}
ei_data.lab_inputs = {}
ei_data.pipe_pictures = {}
ei_data.fusion = {}

--====================================================================================================
--COLORS
--====================================================================================================

ei_data.colors.miner = {r = 1, g = 0.67, b = 0.3}
ei_data.colors.assembler = {r = 1, g = 0.67, b = 0.3}
ei_data.colors.neo = {r = 0.66, g = 0.14, b = 0.7, a = 0}
ei_data.colors.alien = {r = 0.16, g = 0.5, b = 0.2, a = 1}

--ei_data.colors.neo = {r = 0.31, g = 0.22, b = 0.38, a = 0}
-- ei_data.colors.neo = {r = 0.55, g = 0.29, b = 0.56, a = 0}

--====================================================================================================
--TECH SCALING
--====================================================================================================

ei_data.tech_scaling.switch_table = {
    ["Very Cheap"]      =    500,
    ["More Cheap"]      =   1000,
    ["Cheap"]           =   2500,
    ["Default"]         =   5000,
    ["Less Expensive"]  =   7500,
    ["Expensive"]       =  10000,
    ["Very Expensive"]  = 250000
}

--====================================================================================================
--SCIENCE PACKS
--====================================================================================================

-- science packs that are needed to research techs from their respective ages

ei_data.science["dark-age"] = {
    {"ei_dark-age-tech",1},
}

ei_data.science["steam-age"] = {
    {"ei_dark-age-tech",1},
    {"ei_steam-age-tech",1},
}

ei_data.science["electricity-age"] = {
    {"ei_dark-age-tech",1},
    {"ei_steam-age-tech",1},
    {"ei_electricity-age-tech",1},
}

ei_data.science["computer-age"] = {
    {"ei_dark-age-tech",1},
    {"ei_steam-age-tech",1},
    {"ei_electricity-age-tech",1},
    {"ei_computer-age-tech",1},
}

ei_data.science["quantum-age"] = {
    {"ei_dark-age-tech",1},
    {"ei_steam-age-tech",1},
    {"ei_electricity-age-tech",1},
    {"ei_computer-age-tech",1},
    {"ei_quantum-age-tech",1},
}

ei_data.science["exotic-age"] = {
    {"space-science-pack",1},
}

-- inputs for labs

ei_data.lab_inputs["dark-age-lab"] = {
    "ei_dark-age-tech",
    "ei_steam-age-tech",
}

ei_data.lab_inputs["lab"] = {
    "ei_dark-age-tech",
    "ei_steam-age-tech",
    "ei_electricity-age-tech",
    "ei_computer-age-tech",
    -- "ei_rocket-tech",
}

ei_data.lab_inputs["big-lab"] = {
    "ei_dark-age-tech",
    "ei_steam-age-tech",
    "ei_electricity-age-tech",
    "ei_computer-age-tech",
    "ei_quantum-age-tech",
    -- "ei_rocket-tech",
}

-- EI equivalent of vanilla science packs
ei_data.science_dict = {
    ["automation-science-pack"] = "ei_dark-age-tech",
    ["logistic-science-pack"] = "ei_steam-age-tech",
    ["chemical-science-pack"] = "ei_electricity-age-tech",
    ["military-science-pack"] = "ei_electricity-age-tech",
    ["production-science-pack"] = "ei_computer-age-tech",
    -- TODO:
    -- ["utility-science-pack"] = "ei_quantum-age-tech",
    -- ["space-science-pack"] = "ei_rocket-tech",
}

--====================================================================================================
--AGE STRUCTURE
--====================================================================================================

ei_data.ages = {
    "dark-age",
    "steam-age",
    "electricity-age",
    "computer-age",
    "quantum-age",
    "exotic-age"
}

-- store which age comes after which
-- used to make dummy techs

ei_data.ages_dummy_dict = {
    ["dark-age"] = "steam-age",
    ["steam-age"] = "electricity-age",
    ["electricity-age"] = "computer-age",
    ["computer-age"] = "quantum-age",
    ["quantum-age"] = "exotic-age",
}

--====================================================================================================
--ROUGH TECH STRUCTURE
--====================================================================================================

-- list tech names for their respective ages here

ei_data.tech_structure["dark-age"] = {
    "gun-turret",
    "heavy-armor",
    "military",
    "weapon-shooting-speed-1",
    "physical-projectile-damage-1",
    "toolbelt",
    "stone-wall",
    "logistics",
}
-- KEY = TECH, VALUE = PREREQUISITE
ei_data.prerequisites_to_set["dark-age"] = {
    ["heavy-armor"] = "military",
    ["weapon-shooting-speed-1"] = "military",
    ["physical-projectile-damage-1"] = "military",

    -- set mandatory for next age
    -- ["ei_steam-age"] = "military",
    ["ei_steam-age"] = "gun-turret",
}

ei_data.tech_structure["steam-age"] = {
    "electronics",
    -- steel furnace
    "advanced-material-processing",
    -- train
    "automated-rail-transportation",
    "rail-signals",
    "braking-force-1",
    "braking-force-2",
    "weapon-shooting-speed-2",
    "physical-projectile-damage-2",
    "automobilism",
    "engine",
    "flamethrower",
    "flammables",
    "refined-flammables-1",
    "refined-flammables-2",
    "stronger-explosives-1",
    "gate",
    "inserter-capacity-bonus-1",
    "research-speed-1",
    "landfill",
    "steel-axe",
    "steel-processing",
    "military-2",

}

ei_data.tech_structure["electricity-age"] = {
    "oil-processing",
    "railway",
    "fluid-wagon",
    "fluid-handling",
    "automation",
    -- red circ
    "advanced-electronics",
    -- electric furnace
    "advanced-material-processing-2",
    "automation-2",
    "battery",
    "battery-equipment",
    "belt-immunity-equipment",
    "energy-shield-equipment",
    "exoskeleton-equipment",
    "night-vision-equipment",
    "personal-roboport-equipment",
    "modular-armor",
    "power-armor",
    "tank",
    "braking-force-3",
    "braking-force-4",
    "braking-force-5",
    "circuit-network",
    "explosives",
    "stronger-explosives-2",
    "refined-flammables-3",
    "refined-flammables-4",
    "physical-projectile-damage-3",
    "physical-projectile-damage-4",
    "land-mine",
    "cliff-explosives",
    "concrete",
    -- "logistic-system",
    "worker-robots-speed-1",
    "worker-robots-speed-2",
    "electric-energy-accumulators",
    "electric-energy-distribution-1",
    "electric-energy-distribution-2",
    "electric-engine",
    "lubricant",
    "fast-inserter",
    "inserter-capacity-bonus-2",
    "research-speed-2",
    "optics",
    "laser",
    "laser-turret",
    "personal-laser-defense-equipment",
    "laser-shooting-speed-1",
    "laser-shooting-speed-2",
    "laser-shooting-speed-3",
    "logistics-2",
    "mining-productivity-1",
    "nuclear-power",
    "uranium-ammo",
    "uranium-processing",
    -- "nuclear-fuel-reprocessing",
    "plastics",
    "sulfur-processing",
    "solar-energy",
    "solar-panel-equipment",
    "military-3",
    "advanced-oil-processing",
    "coal-liquefaction",
    "defender",
    "destroyer",
    "discharge-defense-equipment",
    "distractor",
    "energy-weapons-damage-1",
    "energy-weapons-damage-2",
    "follower-robot-count-1",
    "follower-robot-count-2",
    "robotics",
    "logistic-robotics",
    "construction-robotics",

}

ei_data.tech_structure["computer-age"] = {
    -- green circ
    "weapon-shooting-speed-3",
    "weapon-shooting-speed-4",
    "stronger-explosives-3",
    "explosive-rocketry",
    "advanced-electronics-2",
    "automation-3",
    "battery-mk2-equipment",
    "energy-shield-mk2-equipment",
    "power-armor-mk2",
    "personal-roboport-mk2-equipment",
    "braking-force-6",
    "braking-force-7",
    "modules",
    -- "effect-transmission",
    "effectivity-module",
    "effectivity-module-2",
    "effectivity-module-3",
    "productivity-module",
    "productivity-module-2",
    "productivity-module-3",
    "speed-module",
    "speed-module-2",
    "speed-module-3",
    "inserter-capacity-bonus-3",
    "inserter-capacity-bonus-4",
    "stronger-explosives-4",
    "stronger-explosives-5",
    "research-speed-3",
    "research-speed-4",
    "refined-flammables-5",
    "refined-flammables-6",
    "weapon-shooting-speed-5",
    "weapon-shooting-speed-6",
    "physical-projectile-damage-5",
    "physical-projectile-damage-6",
    "laser-shooting-speed-4",
    "laser-shooting-speed-5",
    "laser-shooting-speed-6",
    "laser-shooting-speed-7",
    "worker-robots-speed-3",
    "worker-robots-speed-4",
    "worker-robots-storage-1",
    "worker-robots-storage-2",
    "energy-weapons-damage-3",
    "energy-weapons-damage-4",
    "logistics-3",
    "logistic-system",
    "low-density-structure",
    "mining-productivity-2",
    "rocket-control-unit",
    "rocket-fuel",
    "rocket-silo",
    "rocketry",
    "spidertron",
    "stack-inserter",
    "military-4",
    "artillery",
    "artillery-shell-range-1",
    "artillery-shell-speed-1",
    "follower-robot-count-3",
    "follower-robot-count-4",

}

ei_data.tech_structure["quantum-age"] = {
    "atomic-bomb",
    "fusion-reactor-equipment",
    "inserter-capacity-bonus-5",
    "inserter-capacity-bonus-6",
    "inserter-capacity-bonus-7",
    "worker-robots-speed-5",
    "worker-robots-speed-6",
    "worker-robots-storage-3",
    "refined-flammables-7",
    "physical-projectile-damage-7",
    "research-speed-5",
    "research-speed-6",
    "stronger-explosives-6",
    "stronger-explosives-7",
    "mining-productivity-3",
    "mining-productivity-4",
    "energy-weapons-damage-5",
    "energy-weapons-damage-6",
    "energy-weapons-damage-7",
    "follower-robot-count-5",
    "follower-robot-count-6",
    "follower-robot-count-7",

}

ei_data.tech_structure["exotic-age"] = {

}

ei_data.tech_exclude_list = {
    "kovarex-enrichment-process",
    "logistic-science-pack",
    "chemical-science-pack",
    "military-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "space-science-pack",
    "nuclear-fuel-reprocessing",
    "effect-transmission",
}


--====================================================================================================
--OTHER
--====================================================================================================

ei_data.specific_heat = "100KJ"
ei_data.high_specific_heat = "1000KJ"

--====================================================================================================
--FUEL COMBINATIONS FOR FUSION REACTOR
--====================================================================================================

--> refer to the fusion reator prototype definition for more info

-- entries in MJ
-- time 10 since at least 5 of each fuel is required
ei_data.fusion.fuel_combinations = {
    ["ei_heated-protium"] = {
        ["ei_heated-protium"] = nil,
        ["ei_heated-deuterium"] = nil,
        ["ei_heated-tritium"] = nil,
        ["ei_heated-helium-3"] = nil,
        ["ei_heated-lithium-6"] = 60*10,
    },
    ["ei_heated-deuterium"] = {
        ["ei_heated-protium"] = nil,
        ["ei_heated-deuterium"] = 100*10,
        ["ei_heated-tritium"] = 200*10,
        ["ei_heated-helium-3"] = 220*10,
        ["ei_heated-lithium-6"] = 120*10,
    },
    ["ei_heated-tritium"] = {
        ["ei_heated-protium"] = nil,
        ["ei_heated-deuterium"] = 200*10,
        ["ei_heated-tritium"] = 300*10,
        ["ei_heated-helium-3"] = 380*10,
        ["ei_heated-lithium-6"] = nil,
    },
    ["ei_heated-helium-3"] = {
        ["ei_heated-protium"] = nil,
        ["ei_heated-deuterium"] = 220*10,
        ["ei_heated-tritium"] = 380*10,
        ["ei_heated-helium-3"] = 420*10,
        ["ei_heated-lithium-6"] = 220*10,
    },
    ["ei_heated-lithium-6"] = {
        ["ei_heated-protium"] = 60*10,
        ["ei_heated-deuterium"] = 120*10,
        ["ei_heated-tritium"] = nil,
        ["ei_heated-helium-3"] = 220*10,
        ["ei_heated-lithium-6"] = nil,
    },
}

ei_data.fusion.max_power = 420*2*1.2*10 -- 420MW * 2 * 1.2 * 10 = 10.080MW
-- for reference efficient, non breeder, DT = 200MW * 0.75 * 1.2 * 10 = 1.800MW

-- value is multiplied with power output
ei_data.fusion.temp_modes = {
    ["low"] = 0.2,
    ["medium"] = 1,
    ["high"] = 1.2,
}

-- first value is multiplied with power output
-- second value is fuel usage per second
ei_data.fusion.fuel_injection_modes = {
    ["low"] = {0.75, 5},
    ["medium"] = {1, 10},
    ["high"] = {2, 25},
}

-- multiplactors for the neutron flux calculation
ei_data.fusion.fuel_neutron_flux = {
    ["ei_heated-protium"] = 0.75,
    ["ei_heated-deuterium"] = 0.9,
    ["ei_heated-tritium"] = 1,
    ["ei_heated-helium-3"] = 1,
    ["ei_heated-lithium-6"] = 0.75,
}

ei_data.fusion.temp_neutron_flux = {
    ["low"] = 1,
    ["medium"] = 0.3,
    ["high"] = 0,
}

ei_data.fusion.injection_neutron_flux = {
    ["low"] = 1,
    ["medium"] = 1.5,
    ["high"] = 2,
}

-- fuel value of 1 hot coolant in MJ
ei_data.fusion.coolant_fuel_value = 40

return ei_data