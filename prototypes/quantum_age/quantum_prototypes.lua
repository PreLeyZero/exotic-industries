-- this file contains the prototype definition for varios stuff from quantum age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
    -- new module tier 4-6
    {
        name = "ei_speed-module-4",
        type = "module",
        icon = ei_graphics_item_path.."speed-module-4.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "a[speed]-c[speed-module-3]-a",
        category = "speed",
        tier = 4,
        effect = { speed = 0.6, consumption = 0.4},
    },
    {
        name = "ei_speed-module-5",
        type = "module",
        icon = ei_graphics_item_path.."speed-module-5.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "a[speed]-c[speed-module-3]-b",
        category = "speed",
        tier = 5,
        effect = { speed = 0.7, consumption = 0.5},
    },
    {
        name = "ei_speed-module-6",
        type = "module",
        icon = ei_graphics_item_path.."speed-module-6.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "a[speed]-c[speed-module-3]-c",
        category = "speed",
        tier = 6,
        effect = { speed = 0.8, consumption = 0.5},
    },
    {
        name = "ei_efficiency-module-4",
        type = "module",
        icon = ei_graphics_item_path.."effectivity-module-4.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[efficiency]-c[efficiency-module-3]-a",
        category = "efficiency",
        tier = 4,
        effect = {consumption = -0.6},
    },
    {
        name = "ei_efficiency-module-5",
        type = "module",
        icon = ei_graphics_item_path.."effectivity-module-5.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[efficiency]-c[efficiency-module-3]-b",
        category = "efficiency",
        tier = 5,
        effect = {consumption = -0.8},
    },
    {
        name = "ei_efficiency-module-6",
        type = "module",
        icon = ei_graphics_item_path.."effectivity-module-6.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[efficiency]-c[efficiency-module-3]-c",
        category = "efficiency",
        tier = 6,
        effect = {consumption = -1},
    },
    {
        name = "ei_productivity-module-4",
        type = "module",
        icon = ei_graphics_item_path.."productivity-module-4.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[productivity]-c[productivity-module]-a",
        category = "productivity",
        tier = 4,
        effect = {
            productivity = 0.1,
            consumption = 0.6,
            pollution = 0.2,
            speed = -0.25
        },
    },
    {
        name = "ei_productivity-module-5",
        type = "module",
        icon = ei_graphics_item_path.."productivity-module-5.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[productivity]-c[productivity-module]-b",
        category = "productivity",
        tier = 5,
        effect = {
            productivity = 0.13,
            consumption = 0.8,
            pollution = 0.4,
            speed = -0.4
        },
    },
    {
        name = "ei_productivity-module-6",
        type = "module",
        icon = ei_graphics_item_path.."productivity-module-6.png",
        icon_size = 64,
        stack_size = 50,
        subgroup = "module",
        order = "c[productivity]-c[productivity-module]-c",
        category = "productivity",
        tier = 6,
        effect = {
            productivity = 0.16,
            consumption = 1.0,
            pollution = 0.6,
            speed = -0.8
        },
    },
    {
        name = "ei_gauss-module",
        type = "module",
        icon = ei_graphics_item_path.."gauss-module.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "module",
        order = "c[productivity]-z",
        category = "productivity",
        tier = 7,
        effect = {
            productivity = 0.2,
            consumption = 2,
            pollution = 2,
            speed = -2
        },
    },
    {
        name = "ei_photon-cavity",
        type = "item",
        icon = ei_graphics_item_path.."photon-cavity.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "b8-d",
    },
    {
        name = "ei_gluon-cavity",
        type = "item",
        icon = ei_graphics_item_path.."z-boson-cavity.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "b8-c",
    },
    {
        name = "ei_z-boson-cavity",
        type = "item",
        icon = ei_graphics_item_path.."gluon-cavity.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "b8-b",
    },
    {
        name = "ei_clean-plating",
        type = "item",
        icon = ei_graphics_item_path.."clean-plating.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-intermediates",
        order = "d-x-a",
    },
    {
        name = "ei_circuit-board",
        type = "item",
        icon = ei_graphics_item_path.."circuit-board.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "raw-material",
        order = "x-a",
    },
    {
        name = "ei_pre-circuit-board",
        type = "item",
        icon = ei_graphics_item_path.."pre-circuit-board.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "raw-material",
        order = "x",
    },
    {
        name = "ei_cavity",
        type = "item",
        icon = ei_graphics_item_path.."cavity.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "b8-a",
    },
    {
        name = "ei_crushed-neodym",
        type = "item",
        icon = ei_graphics_item_path.."crushed-neodym.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "d2",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-neodym.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_pure-crushed-neodym",
        type = "item",
        icon = ei_graphics_item_path.."crushed-pure-neodym-3.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "c-b",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_crushed-coal",
        type = "item",
        icon = ei_graphics_item_path.."crushed-coal.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-crushed",
        order = "c1",
        fuel_category = "chemical",
        fuel_value = "2MJ",
        pictures = {
            {
                filename = ei_graphics_item_path.."crushed-coal.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-coal-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-coal-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_carbon",
        type = "item",
        icon = ei_graphics_item_path.."carbon.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "h[battery]-a[carbon]",
    },
    {
        name = "ei_carbon-nanotube",
        type = "item",
        icon = ei_graphics_item_path.."carbon-nanotube.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "h[battery]-b[carbon]",
        pictures = {
            {
                filename = ei_graphics_item_path.."carbon-nanotube.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_carbon-structure",
        type = "item",
        icon = ei_graphics_item_path.."carbon-structure.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "h[battery]-c[carbon]",
    },
    {
        name = "ei_magnet",
        type = "item",
        icon = ei_graphics_item_path.."magnet.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "b9",
    },
    {
        name = "ei_magnet-data",
        type = "item",
        icon = ei_graphics_item_path.."magnet-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-a-f",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."magnet-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."magnet-data_light.png",
                scale = 0.25
              }
            }
          },
    },
    {
        name = "ei_fusion-data",
        type = "item",
        icon = ei_graphics_item_path.."fusion-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-a-g",
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."fusion-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."simulation-data_light.png",
                scale = 0.25
              }
            }
          },
    },
    {
        name = "ei_sun-data",
        type = "item",
        icon = ei_graphics_item_path.."sun-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-b-a",
        stack_size = 1000,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."sun-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."space-data_light.png",
                scale = 0.25
              }
            }
          },
    },
    {
        name = "ei_gas-giant-data",
        type = "item",
        icon = ei_graphics_item_path.."gas-giant-data.png",
        icon_size = 128,
        subgroup = "ei_refining-tech",
        order = "a-b-b",
        stack_size = 1000,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."gas-giant-data.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."space-data_light.png",
                scale = 0.25
              }
            }
          },
    },
    {
        name = "ei_fusion-quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."fusion-quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a5-1",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."fusion-quantum-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_space-quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."exotic-quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a5-2",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."exotic-quantum-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_moon-fish",
        type = "item",
        icon = ei_graphics_item_path.."moon-fish.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "raw-resource",
        order = "h[moon-fish]",
    },
    {
        name = "ei_dt-mix",
        type = "item",
        icon = ei_graphics_item_path.."dt-mix.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_nuclear-fission-fuel",
        order = "c-1",
        fuel_category = "ei_fusion-fuel",
        fuel_value = "1TJ",
        fuel_acceleration_multiplier = 2.0,
        fuel_top_speed_multiplier = 3.0,
    },
    {
        name = "ei_fusion-drive",
        type = "item",
        icon = ei_graphics_item_path.."fusion-drive.png",
        icon_size = 128,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "p[rocket-fuel]-x-2",
    },
    {
        name = "ei_odd-plating",
        type = "item",
        icon = ei_graphics_item_path.."odd-plating.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-intermediates",
        order = "d-x",
    },
    {
        name = "ei_exotic-ore",
        type = "item",
        icon = ei_graphics_item_path.."exotic-ore.png",
        icon_size = 64,
        stack_size = 20,
        subgroup = "ei_refining-purified",
        order = "x-1",
    },
    {
        name = "ei_plasma-cube",
        type = "item",
        icon = ei_graphics_item_path.."plasma-cube.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "d[barrel]-2",
    },
    {
        name = "ei_eu-circuit",
        type = "item",
        icon = ei_graphics_item_path.."eu-circuit.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "g[processing-unit]-b",
    },
    {
        name = "ei_eu-magnet",
        type = "item",
        icon = ei_graphics_item_path.."eu-magnet.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "b9-a",
    },
    {
        name = "ei_exotic-matter-up",
        type = "item",
        icon = ei_graphics_item_path.."exotic-matter-up.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-items",
        order = "d-a",
    },
    {
        name = "ei_exotic-matter-down",
        type = "item",
        icon = ei_graphics_item_path.."exotic-matter-down.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-items",
        order = "d-b",
    },
    {
        name = "ei_high-tech-parts",
        type = "item",
        icon = ei_graphics_item_path.."high-tech-parts.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "b6-a",
    },
    {
        name = "ei_advanced-rocket-fuel",
        type = "item",
        icon = ei_graphics_item_path.."advanced-rocket-fuel.png",
        icon_size = 64,
        stack_size = 10,
        subgroup = "intermediate-product",
        order = "p[rocket-fuel]-b",
        fuel_category = "ei_rocket-fuel",
        fuel_value = "180MJ",
        fuel_acceleration_multiplier = 2.1,
        fuel_top_speed_multiplier = 1.3,
    },
    {
        name = "ei_lithium-crystal",
        type = "item",
        icon = ei_graphics_item_path.."lithium-crystal.png",
        icon_mipmaps = 4,
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-purified",
        order = "b-b",
        pictures = {
            {
                filename = ei_graphics_item_path.."lithium-crystal.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-1.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-2.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-3.png",
                icon_mipmaps = 4,
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_exotic-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."exotic-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a6",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."exotic-age-tech.png",
                scale = 0.25
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."exotic-age-tech_light.png",
                scale = 0.25
              }
            }
        },
    },
    {
        name = "ei_bio-armor",
        type = "armor",
        icon = ei_graphics_item_path.."bio-armor.png",
        icon_size = 64,
        stack_size = 1,
        subgroup = "armor",
        order = "f",
        resistances = {
            {type = "physical", decrease = 20, percent = 60},
            {type = "acid", decrease = 5, percent = 85},
            {type = "explosion", decrease = 80, percent = 70},
            {type = "fire", decrease = 20, percent = 70},
            {type = "laser", decrease = 20, percent = 60},
            {type = "electric", decrease = 0, percent = 100},
            {type = "impact", decrease = 5, percent = 90},
            
        },
        equipment_grid = "ei_bio-armor",
        inventory_size_bonus = 60,
        infinite = true,
    },
    {
        name = "ei_personal-solar-3",
        type = "item",
        icon = ei_graphics_item_path.."personal-solar-3.png",
        icon_size = 64,
        subgroup = "equipment",
        order = "a[energy-source]-c[personal-solar-panel]",
        stack_size = 20,
        place_as_equipment_result = "ei_personal-solar-3",
    },
    {
        name = "ei_personal-solar-3",
        type = "solar-panel-equipment",
        power = "150kW",
        categories = {"armor"},
        sprite = {
            filename = ei_graphics_other_path.."personal-solar-3.png",
            width = 64,
            height = 64,
            priority = "medium"
        },
        shape = {
            width = 1,
            height = 1,
            type = "full"
        },
        energy_source = {
            type = "electric",
            usage_priority = "primary-output"
        },
        take_result = "ei_personal-solar-3",
    },
    {
        name = "ei_personal-shield",
        type = "item",
        icon = ei_graphics_item_path.."personal-shield.png",
        icon_size = 64,
        subgroup = "military-equipment",
        order = "a[shield]-c[personal-shield]",
        stack_size = 10,
        place_as_equipment_result = "ei_personal-shield",
    },
    {
        name = "ei_personal-shield",
        type = "energy-shield-equipment",
        sprite = {
            filename = ei_graphics_other_path.."personal-shield.png",
            width = 256,
            height = 256,
            priority = "medium"
        },
        shape = {
            width = 3,
            height = 3,
            type = "full"
        },
        max_shield_value = 500,
        energy_per_shield = "50kJ",
        categories = {"armor"},
        energy_source = {
            type = "electric",
            buffer_capacity = "1000kJ",
            input_flow_limit = "1500kW",
            usage_priority = "primary-input"
        },
        take_result = "ei_personal-shield",
    },
    {
        name = "ei_bug-zapper",
        type = "item",
        icon = ei_graphics_item_path.."bug-zapper.png",
        icon_size = 64,
        subgroup = "military-equipment",
        order = "c[zapper]-a[bug-zapper]",
        stack_size = 1,
        place_as_equipment_result = "ei_bug-zapper",
    },
    {
        name = "ei_bug-zapper",
        type = "active-defense-equipment",
        sprite = {
            filename = ei_graphics_other_path.."bug-zapper.png",
            width = 256,
            height = 256,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        categories = {"armor"},
        energy_source = {
            type = "electric",
            buffer_capacity = "200MJ",
            input_flow_limit = "10MW",
            usage_priority = "primary-input"
        },
        attack_parameters = {
            type = "projectile",
            ammo_category = "electric",
            damage_modifier = 1000,
            cooldown = 600,
            projectile_center = {0, 0},
            projectile_creation_distance = 0.6,
            range = 500,
            sound = {
                filename = "__base__/sound/fight/pulse.ogg",
                volume = 0.7
            },
            ammo_type = {
                type = "projectile",
                energy_consumption = "100MJ",
                action = {
                    {
                        type = "area",
                        radius = 500,
                        force = "enemy",
                        action_delivery = {
                            {
                                type = "instant",
                                target_effects = {
                                    {
                                        type = "create-sticker",
                                        sticker = "stun-sticker"
                                    },
                                    {
                                        type = "push-back",
                                        distance = 4
                                    }
                                }
                            },
                            {
                                type = "beam",
                                beam = "electric-beam-no-sound",
                                max_length = 500,
                                duration = 120,
                                source_offset = {0, -0.5},
                                add_to_shooter = false
                            }
                        }
                    }
                }
            }
        },
        automatic = false,
    },
    {
        name = "ei_bug-zapper-remote",
        type = "capsule",
        icon = "__base__/graphics/icons/discharge-defense-equipment-controller.png",
        icon_size = 64, icon_mipmaps = 4,
        capsule_action = {
            type = "equipment-remote",
            equipment = "ei_bug-zapper"
        },
        subgroup = "military-equipment",
        order = "c[zapper]-b[bug-zapper-remote]",
        stack_size = 1
    },
    {
        name = "ei_heavy-minigun",
        type = "gun",
        icon = ei_graphics_item_path.."heavy-minigun.png",
        icon_size = 128,
        stack_size = 1,
        subgroup = "gun",
        order = "a[basic-clips]-d[minigun]",
        attack_parameters = {
            ammo_category = "bullet",
            cooldown = 0.5,
            movement_slow_down_factor = 0.95,
            projectile_creation_distance = 1.125,
            range = 40,
            shell_particle = {
                center = {
                    0,
                    0.1
                },
                creation_distance = -0.5,
                direction_deviation = 0.1,
                name = "shell-particle",
                speed = 0.1,
                speed_deviation = 0.03,
                starting_frame_speed = 0.4,
                starting_frame_speed_deviation = 0.1
            },
            sound = {
                {
                    filename = "__base__/sound/fight/submachine-gunshot-1.ogg",
                    volume = 0.6
                },
                {
                    filename = "__base__/sound/fight/submachine-gunshot-2.ogg",
                    volume = 0.6
                },
                {
                    filename = "__base__/sound/fight/submachine-gunshot-3.ogg",
                    volume = 0.6
                }
            },
            type = "projectile"
        },
    },
    {
        name = "ei_personal-reactor",
        type = "item",
        icon = ei_graphics_item_path.."personal-reactor.png",
        icon_size = 64,
        subgroup = "equipment",
        order = "a[energy-source]-f[personal-reactor]",
        stack_size = 1,
        place_as_equipment_result = "ei_personal-reactor",
    },
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_heavy-minigun",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="ei_minigun", amount=10},
            {type="item", name="ei_carbon-structure", amount=25},
            {type="item", name="ei_odd-plating", amount=25},
            {type="item", name="ei_advanced-motor", amount=100},
        },
        results = {{type="item", name="ei_heavy-minigun", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_heavy-minigun",
    },
    {
        name = "ei_bug-zapper",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="discharge-defense-equipment", amount=20},
            {type="item", name="ei_carbon-structure", amount=25},
            {type="item", name="ei_high-tech-parts", amount=25},
        },
        results = {{type="item", name="ei_bug-zapper", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_bug-zapper",
    },
    {
        name = "ei_bug-zapper-remote",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients =
        {
            {type="item", name="discharge-defense-remote", amount=1},
        },
        results = {{type="item", name="ei_bug-zapper-remote", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_bug-zapper-remote",
    },
    {
        name = "ei_personal-shield",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="energy-shield-mk2-equipment", amount=6},
            {type="item", name="ei_carbon-structure", amount=10},
            {type="item", name="ei_superior-data", amount=25},
        },
        results = {{type="item", name="ei_personal-shield", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_personal-shield",
    },
    {
        name = "ei_personal-solar-3",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_solar-panel-3", amount = 4},
            {type = "item", name = "ei_carbon-structure", amount = 6},
            {type = "item", name = "ei_personal-solar-2", amount = 2},
        },
        results = {
            {type = "item", name = "ei_personal-solar-3", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_personal-solar-3",
    },
    {
        name = "ei_crushed-neodym",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_neodym-chunk", amount = 6},
        },
        results = {
            {type = "item", name = "ei_crushed-neodym", amount = 2},
            {type = "item", name = "stone", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-neodym",
    },
    {
        name = "ei_pure-crushed-neodym",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_crushed-neodym", amount = 25},
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 15},
        },
        results = {
            {type = "item", name = "ei_pure-crushed-neodym", amount = 5},
            {type = "fluid", name = "ei_neodym-solution", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_pure-crushed-neodym",
    },
    {
        name = "ei_neodym-solution",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_neodym-solution", amount = 25},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 15},
            {type = "item", name = "ei_crushed-neodym", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crushed-neodym",
        icon = ei_graphics_other_path.."neodym-solution.png",
        icon_size = 64,
        subgroup = "ei_refining-extraction",
        order = "g-b",
    },
    {
        name = "ei_molten-neodym",
        type = "recipe",
        category = "ei_arc-furnace",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_pure-crushed-neodym", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-neodym", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-neodym",
    },
    {
        name = "ei_cast-neodym__ingot",
        type = "recipe",
        category = "ei_casting",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_molten-neodym", amount = 10},
            {type = "item", name = "ei_crushed-coal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-ingot",
    },
    {
        name = "ei_neodym-plate",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neodym-ingot", amount = 1},
            {type = "item", name = "ei_cryodust", amount = 1},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 5},
        },
        results = {
            {type = "item", name = "ei_neodym-plate", amount = 1},
            {type = "fluid", name = "ei_cryoflux", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_neodym-plate",
    },
    {
        name = "ei_magnet",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neodym-plate", amount = 3},
            {type = "item", name = "ei_gold-plate", amount = 2},
            {type = "item", name = "ei_insulated-wire", amount = 25},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_magnet", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_magnet",
    },
    {
        name = "ei_pre-circuit-board",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_ceramic", amount = 3},
            {type = "item", name = "ei_gold-plate", amount = 1},
            {type = "item", name = "ei_clean-plating", amount = 2},
        },
        results = {
            {type = "item", name = "ei_pre-circuit-board", amount = 6},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_pre-circuit-board",
    },
    {
        name = "ei_circuit-board",
        type = "recipe",
        category = "smelting",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_pre-circuit-board", amount = 1},
        },
        results = {
            {type = "item", name = "ei_circuit-board", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_circuit-board",
    },
    {
        name = "ei_processing-unit__circuit-board",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_advanced-semiconductor", amount = 1},
            {type = "item", name = "ei_electronic-parts", amount = 1},
            {type = "item", name = "ei_superior-data", amount = 8},
            {type = "item", name = "ei_circuit-board", amount = 1},
        },
        results = {
            {type = "item", name = "processing-unit", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "processing-unit",
        subgroup = "intermediate-product",
        order = "g[processing-unit]-a",
        icon = ei_graphics_other_path.."processing-unit.png",
        icon_size = 64,
    },
    {
        name = "ei_fission-tech__u235",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "uranium-235", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 2},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech__u233",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_uranium-233", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 2},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech__pt239",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_plutonium-239", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 2},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech__th232",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_thorium-232", amount = 1},
            {type = "item", name = "ei_lead-plate", amount = 2},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_magnet-data",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 100},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
            {type = "item", name = "ei_magnet", amount = 1},
        },
        results = {
            {type = "item", name = "ei_magnet-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_magnet-data",
    },
    {
        name = "ei_fusion-data",
        type = "recipe",
        category = "ei_quantum-computer",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_computing-power", amount = 100},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 100},
            {type = "item", name = "ei_superior-data", amount = 3},
            {type = "item", name = "ei_plasma-data", amount = 3},
            {type = "item", name = "ei_magnet-data", amount = 3},
        },
        results = {
            {type = "item", name = "ei_fusion-data", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fusion-data",
    },
    {
        name = "ei_fusion-quantum-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
            {type = "item", name = "ei_simulation-data", amount = 20},
            {type = "item", name = "ei_fusion-data", amount = 3},
        },
        results = {
            {type = "item", name = "ei_fusion-quantum-age-tech", amount = 10},
            {type = "item", name = "ei_neutron-container", amount = 1, probability = 0.99},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fusion-quantum-age-tech",
    },
    {
        name = "ei_space-quantum-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_space-data", amount = 4},
            {type = "item", name = "ei_advanced-rocket-fuel", amount = 4},
            {type = "item", name = "ei_moon-fish", amount = 1},
        },
        results = {
            {type = "item", name = "ei_space-quantum-age-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_space-quantum-age-tech",
    },
    {
        name = "ei_exotic-age-tech",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 240,
        ingredients = {
            {type = "item", name = "ei_high-tech-parts", amount = 2},
            {type = "item", name = "ei_superior-data", amount = 10},
            {type = "item", name = "ei_cavity", amount = 1},
        },
        results = {
            {type = "item", name = "ei_exotic-age-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_exotic-age-tech",
    },
    {
        name = "ei_fusion-drive",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_personal-reactor", amount = 1},
            {type = "item", name = "energy-shield-mk2-equipment", amount = 2},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 20},
        },
        results = {
            {type = "item", name = "ei_fusion-drive", amount = 100},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fusion-drive",
    },
    {
        name = "ei_dt-mix",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "fluid", name = "ei_deuterium", amount = 1},
            {type = "fluid", name = "ei_tritium", amount = 1},
        },
        results = {
            {type = "item", name = "ei_dt-mix", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dt-mix",
    },
    {
        name = "ei_plasma-cube",
        type = "recipe",
        category = "ei_advanced-chem-plant",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_empty-cryo-container", amount = 4},
            {type = "item", name = "ei_carbon-structure", amount = 2},
            {type = "fluid", name = "ei_heated-protium", amount = 10},
        },
        results = {
            {type = "item", name = "ei_plasma-cube", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_plasma-cube",
    },
    {
        name = "ei_eu-circuit",
        type = "recipe",
        category = "crafting",
        energy_required = 14,
        ingredients = {
            {type = "item", name = "processing-unit", amount = 2},
            {type = "item", name = "ei_enriched-cryodust", amount = 4},
            {type = "item", name = "ei_circuit-board", amount = 1},
            {type = "item", name = "ei_superior-data", amount = 8},
        },
        results = {
            {type = "item", name = "ei_eu-circuit", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_eu-circuit",
    },
    {
        name = "ei_eu-magnet",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_magnet", amount = 6},
            {type = "item", name = "ei_enriched-cryodust", amount = 1},
            {type = "item", name = "ei_clean-plating", amount = 2},
            {type = "fluid", name = "ei_oxygen-gas", amount = 200},
        },
        results = {
            {type = "item", name = "ei_eu-magnet", amount = 1},
            {type = "item", name = "ei_cryocondensate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_eu-magnet",
    },
    {
        name = "ei_enriched-cryodust",
        type = "recipe",
        category = "ei_growing",
        energy_required = 30,
        ingredients = {
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
            {type = "item", name = "ei_condensed-cryodust", amount = 10},
            {type = "fluid", name = "ei_bio-sludge", amount = 50},
        },
        results = {
            {type = "item", name = "ei_enriched-cryodust", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_enriched-cryodust",
    },
    {
        name = "ei_high-tech-parts",
        type = "recipe",
        category = "ei_exotic-assembler",
        energy_required = 20,
        ingredients = {
            {type = "item", name = "ei_eu-magnet", amount = 1},
            {type = "item", name = "ei_eu-circuit", amount = 1},
            {type = "item", name = "ei_plasma-cube", amount = 1},
            {type = "item", name = "ei_exotic-matter-up", amount = 1},
        },
        results = {
            {type = "item", name = "ei_high-tech-parts", amount = 5},
            {type = "item", name = "ei_exotic-matter-down", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-tech-parts",
    },
    {
        name = "ei_bio-armor",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients = {
            {type = "item", name = "ei_odd-plating", amount = 40},
            {type = "item", name = "power-armor-mk2", amount = 1},
            {type = "item", name = "ei_superior-data", amount = 100},
            {type = "item", name = "ei_magnet", amount = 20},
        },
        results = {
            {type = "item", name = "ei_bio-armor", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_bio-armor",
    },
    {
        name = "ei_advanced-rocket-fuel",
        type = "recipe",
        category = "centrifuging",
        energy_required = 20,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-difluoride", amount = 15},
            {type = "item", name = "rocket-fuel", amount = 2},
        },
        results = {
            {type = "item", name = "ei_advanced-rocket-fuel", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-rocket-fuel",
    },
    {
        name = "ei_oxygen-difluoride",
        type = "recipe",
        category = "chemistry",
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 50},
            {type = "item", name = "ei_sand", amount = 3},
            {type = "item", name = "ei_alien-resin", amount = 1},
            {type = "item", name = "ei_fluorite", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_oxygen-difluoride", amount = 35},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_oxygen-difluoride",
    },
    {
        name = "ei_lithium-crystal",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 10},
            {type = "fluid", name = "ei_liquid-oxygen", amount = 15},
            {type = "item", name = "ei_sand", amount = 3},
        },
        results = {
            {type = "item", name = "ei_lithium-crystal", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_lithium-crystal",
    },
    {
        name = "ei_lithium-seperation",
        type = "recipe",
        category = "oil-processing",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_lithium-crystal", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_lithium-6", amount = 10, probability = 0.07},
            {type = "fluid", name = "ei_lithium-7", amount = 10, probability = 0.93},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_lithium-6",
    },
    {
        name = "ei_heated-lithium-6",
        type = "recipe",
        category = "ei_plasma-heater",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_lithium-6", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_heated-lithium-6", amount = ei_data.fusion.plasma_per_unit},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-lithium-6",
    },
    {
        name = "ei_charged-neutron-container__pt239",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 6},
            {type = "item", name = "ei_plutonium-239", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 6},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container__u235",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 4},
            {type = "item", name = "uranium-235", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container__u233",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 4},
            {type = "item", name = "ei_uranium-233", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container__th232",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 2},
            {type = "item", name = "ei_thorium-232", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container__u238",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 1},
            {type = "item", name = "uranium-238", amount = 10},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_fish-growing",
        type = "recipe",
        category = "ei_growing",
        energy_required = 120,
        ingredients = {
            {type = "fluid", name = "water", amount = 100},
            {type = "item", name = "raw-fish", amount = 1},
            {type = "item", name = "ei_alien-resin", amount = 25},
        },
        results = {
            {type = "item", name = "raw-fish", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "raw-fish",
    },
    {
        name = "ei_odd-plating",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_oxygen-difluoride", amount = 5},
            {type = "item", name = "ei_sus-plating", amount = 1},
            {type = "item", name = "ei_condensed-cryodust", amount = 1},
            {type = "item", name = "ei_alien-resin", amount = 4},
        },
        results = {
            {type = "item", name = "ei_odd-plating", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_odd-plating",
    },
    {
        name = "ei_bio_carbon-structure",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_carbon-nanotube", amount = 2},
            {type = "item", name = "low-density-structure", amount = 2},
            {type = "item", name = "ei_bio-matter", amount = 3},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 150},
        },
        results = {
            {type = "item", name = "ei_carbon-structure", amount = 8},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_carbon-structure.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-g",
    },
    {
        name = "ei_bio_magnet",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neodym-plate", amount = 3},
            {type = "item", name = "ei_gold-plate", amount = 2},
            {type = "item", name = "ei_insulated-wire", amount = 20},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
            {type = "item", name = "ei_bio-matter", amount = 3},
        },
        results = {
            {type = "item", name = "ei_magnet", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_magnet.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-h",
    },
    {
        name = "ei_bio_rocket-fuel",
        type = "recipe",
        category = "ei_advanced-refinery",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "solid-fuel", amount = 20},
            {type = "item", name = "ei_cryodust", amount = 5},
            {type = "item", name = "ei_bio-matter", amount = 4},
            {type = "fluid", name = "petroleum-gas", amount = 45},
            {type = "fluid", name = "ei_ammonia-gas", amount = 55},
        },
        results = {
            {type = "item", name = "rocket-fuel", amount = 12},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_rocket-fuel.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-i",
    },
    {
        name = "ei_rocket-parts__odd-plating",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="ei_rocket-control-unit", amount=1},
            {type="item", name="ei_carbon-structure", amount=2},
            {type="item", name="ei_steel-mechanical-parts", amount=8},
            {type="item", name="ei_insulated-wire", amount=6},
            {type="item", name="ei_odd-plating", amount=4},
        },
        results = {{type="item", name="ei_rocket-parts", amount=4}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_rocket-parts",
    },
    {
        name = "ei_neodym-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 3.5,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 100},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_crushed-neodym", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "e",
        icon = ei_graphics_other_path.."neodym-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_clean-plating",
        type = "recipe",
        category = "ei_bio-reactor",
        energy_required = 40,
        ingredients = {
            {type = "fluid", name = "ei_concentrated-gaia-water", amount = 50},
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 10},
            {type = "item", name = "ei_odd-plating", amount = 2},
            {type = "item", name = "plastic-bar", amount = 20},
            {type = "item", name = "ei_neodym-plate", amount = 1},
        },
        results = {
            {type = "item", name = "ei_clean-plating", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_clean-plating",
    },
    {
        name = "ei_cavity",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 40,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 200},
            {type = "item", name = "ei_clean-plating", amount = 4},
            {type = "item", name = "ei_glass", amount = 15},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 10},
            {type = "item", name = "ei_eu-magnet", amount = 2},
            {type = "item", name = "ei_superior-data", amount = 10},
        },
        results = {
            {type = "item", name = "ei_cavity", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cavity",
    },
    {
        name = "ei_photon-cavity",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 300,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 25},
            {type = "item", name = "ei_sun-data", amount = 10},
            {type = "item", name = "ei_cavity", amount = 1},
        },
        results = {
            {type = "item", name = "ei_photon-cavity", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_photon-cavity",
    },
    {
        name = "ei_gluon-cavity",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 300,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 25},
            {type = "item", name = "ei_blooming-evolved-alien-seed", amount = 10},
            {type = "item", name = "ei_cavity", amount = 1},
        },
        results = {
            {type = "item", name = "ei_gluon-cavity", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_gluon-cavity",
    },
    {
        name = "ei_z-boson-cavity",
        type = "recipe",
        category = "ei_nano-factory",
        energy_required = 300,
        ingredients = {
            {type = "fluid", name = "ei_nitrogen-gas", amount = 25},
            {type = "item", name = "ei_gas-giant-data", amount = 10},
            {type = "item", name = "ei_cavity", amount = 1},
        },
        results = {
            {type = "item", name = "ei_z-boson-cavity", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_z-boson-cavity",
    },
    {
        name = "ei_speed-module-4",
        type = "recipe",
        category = "crafting",
        energy_required = 80,
        ingredients = {
            {type = "item", name = "speed-module-3", amount = 2},
            {type = "item", name = "ei_computing-unit", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_speed-module-4", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_speed-module-4",
    },
    {
        name = "ei_efficiency-module-4",
        type = "recipe",
        category = "crafting",
        energy_required = 80,
        ingredients = {
            {type = "item", name = "efficiency-module-3", amount = 2},
            {type = "item", name = "ei_computing-unit", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_efficiency-module-4", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_efficiency-module-4",
    },
    {
        name = "ei_productivity-module-4",
        type = "recipe",
        category = "crafting",
        energy_required = 80,
        ingredients = {
            {type = "item", name = "productivity-module-3", amount = 2},
            {type = "item", name = "ei_computing-unit", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_productivity-module-4", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_productivity-module-4",
    },
    {
        name = "ei_speed-module-5",
        type = "recipe",
        category = "crafting",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_speed-module-4", amount = 2},
            {type = "item", name = "ei_odd-plating", amount = 10},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_speed-module-5", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_speed-module-5",
    },
    {
        name = "ei_efficiency-module-5",
        type = "recipe",
        category = "crafting",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_efficiency-module-4", amount = 2},
            {type = "item", name = "ei_odd-plating", amount = 10},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_efficiency-module-5", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_efficiency-module-5",
    },
    {
        name = "ei_productivity-module-5",
        type = "recipe",
        category = "crafting",
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_productivity-module-4", amount = 2},
            {type = "item", name = "ei_odd-plating", amount = 10},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_productivity-module-5", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_productivity-module-5",
    },
    {
        name = "ei_speed-module-6",
        type = "recipe",
        category = "crafting",
        energy_required = 240,
        ingredients = {
            {type = "item", name = "ei_speed-module-5", amount = 2},
            {type = "item", name = "ei_photon-cavity", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_speed-module-6", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_speed-module-6",
    },
    {
        name = "ei_efficiency-module-6",
        type = "recipe",
        category = "crafting",
        energy_required = 240,
        ingredients = {
            {type = "item", name = "ei_efficiency-module-5", amount = 2},
            {type = "item", name = "ei_gluon-cavity", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_efficiency-module-6", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_efficiency-module-6",
    },
    {
        name = "ei_productivity-module-6",
        type = "recipe",
        category = "crafting",
        energy_required = 240,
        ingredients = {
            {type = "item", name = "ei_productivity-module-5", amount = 2},
            {type = "item", name = "ei_z-boson-cavity", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
        },
        results = {
            {type = "item", name = "ei_productivity-module-6", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_productivity-module-6",
    },
    {
        name = "ei_gauss-module",
        type = "recipe",
        category = "crafting",
        energy_required = 600,
        ingredients = {
            {type = "item", name = "ei_productivity-module-6", amount = 4},
            {type = "item", name = "ei_speed-module-6", amount = 4},
            {type = "item", name = "ei_efficiency-module-6", amount = 4},
            {type = "item", name = "ei_high-tech-parts", amount = 25},
        },
        results = {
            {type = "item", name = "ei_gauss-module", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_gauss-module",
    },
    {
        name = "ei_personal-reactor",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="ei_plasma-cube", amount=4},
            {type="item", name="processing-unit", amount=100},
            {type="item", name="ei_fusion-data", amount=40},
        },
        results = {{type="item", name="ei_personal-reactor", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_personal-reactor",
    },
})

--TECHS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_neodym-dirty-water-usage",
        type = "technology",
        icon = ei_graphics_tech_path.."dirty-water-usage.png",
        icon_size = 128,
        prerequisites = {"ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-extraction"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_bio_carbon-structure",
        type = "technology",
        icon = ei_graphics_other_path.."bio_carbon-structure.png",
        icon_size = 64,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_carbon-structure"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-3"],
            time = 20
        },
    },
    {
        name = "ei_bio_rocket-fuel",
        type = "technology",
        icon = ei_graphics_other_path.."bio_rocket-fuel.png",
        icon_size = 64,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_rocket-fuel"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-3"],
            time = 20
        },
    },
    {
        name = "ei_bio_magnet",
        type = "technology",
        icon = ei_graphics_other_path.."bio_magnet.png",
        icon_size = 64,
        prerequisites = {"ei_odd-plating", "ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_magnet"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-3"],
            time = 20
        },
    },
    {
        name = "ei_neodym-refining",
        type = "technology",
        icon = ei_graphics_tech_path.."neodym-refining.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_pure-crushed-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-solution"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_molten-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cast-neodym__ingot"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neodym-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_magnet"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_magnet-data",
        type = "technology",
        icon = ei_graphics_tech_path.."magnet-data.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-computer"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_magnet-data"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_fish-growing",
        type = "technology",
        icon = ei_graphics_tech_path.."fish-growing.png",
        icon_size = 256,
        prerequisites = {"ei_quantum-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fish-growing"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_oxygen-difluoride",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-difluoride.png",
        icon_size = 128,
        prerequisites = {"ei_quantum-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_oxygen-difluoride"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_cavity",
        type = "technology",
        icon = ei_graphics_tech_path.."cavity.png",
        icon_size = 128,
        prerequisites = {"ei_clean-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_cavity"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_clean-plating",
        type = "technology",
        icon = ei_graphics_tech_path.."clean-plating.png",
        icon_size = 128,
        prerequisites = {"ei_odd-plating", "ei_quantum-computer", "ei_enriched-cryodust"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_clean-plating"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_eu-magnet"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_odd-plating",
        type = "technology",
        icon = ei_graphics_tech_path.."odd-plating.png",
        icon_size = 128,
        prerequisites = {"ei_oxygen-difluoride", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_odd-plating"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_rocket-parts__odd-plating"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_fusion-data",
        type = "technology",
        icon = ei_graphics_tech_path.."fusion.png",
        icon_size = 256,
        prerequisites = {"ei_magnet-data", "ei_plasma-heater", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fusion-data"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fusion-quantum-age-tech"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neutron-container"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container__pt239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container__u235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container__u238"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container__u233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container__th232"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_tritium-breeding",
        type = "technology",
        icon = ei_graphics_tech_path.."tritium-breeding.png",
        icon_size = 256,
        prerequisites = {"ei_fusion-reactor", "laser-weapons-damage-6", "ei_neutron-collector"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_deuterium__activator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_tritium__activator"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
    },
    {
        name = "ei_fusion-drive",
        type = "technology",
        icon = ei_graphics_item_path.."fusion-drive.png",
        icon_size = 128,
        prerequisites = {"ei_personal-reactor"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fusion-drive"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_dt-mix"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
    },
    {
        name = "ei_advanced-fission-tech",
        type = "technology",
        icon = ei_graphics_tech_path.."advanced-fission-tech.png",
        icon_size = 256,
        prerequisites = {"ei_neodym-refining"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech__u235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech__u233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech__pt239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech__th232"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_lithium-processing",
        type = "technology",
        icon = ei_graphics_tech_path.."lithium-processing.png",
        icon_size = 128,
        prerequisites = {"ei_fusion-data"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_lithium-crystal"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lithium-seperation"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_heated-lithium-6"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_neutron-activator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lithium-6__activator"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
    },
    {
        name = "ei_bio-armor",
        type = "technology",
        icon = ei_graphics_tech_path.."bio-armor.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio-armor"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_personal-solar-3",
        type = "technology",
        icon = ei_graphics_tech_path.."personal-solar-3.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_solar-panel-3", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-solar-3"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_personal-shield",
        type = "technology",
        icon = ei_graphics_other_path.."personal-shield.png",
        icon_size = 256,
        prerequisites = {"ei_quantum-computer", "ei_nano-factory"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-shield"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_bug-zapper",
        type = "technology",
        icon = ei_graphics_other_path.."bug-zapper.png",
        icon_size = 256,
        prerequisites = {"ei_high-tech-parts"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bug-zapper"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_bug-zapper-remote"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_heavy-minigun",
        type = "technology",
        icon = ei_graphics_tech_path.."heavy-minigun.png",
        icon_size = 256,
        prerequisites = {"ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_heavy-minigun"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_speed-module-4",
        type = "technology",
        icon = ei_graphics_tech_path.."speed-module-4.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_neodym-refining", "speed-module-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_speed-module-4"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_efficiency-module-4",
        type = "technology",
        icon = ei_graphics_tech_path.."effectivity-module-4.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_neodym-refining", "efficiency-module-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_efficiency-module-4"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_productivity-module-4",
        type = "technology",
        icon = ei_graphics_tech_path.."productivity-module-4.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_neodym-refining", "productivity-module-3"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_productivity-module-4"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_speed-module-5",
        type = "technology",
        icon = ei_graphics_tech_path.."speed-module-5.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_speed-module-4", "ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_speed-module-5"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_efficiency-module-5",
        type = "technology",
        icon = ei_graphics_tech_path.."effectivity-module-5.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_efficiency-module-4", "ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_efficiency-module-5"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_productivity-module-5",
        type = "technology",
        icon = ei_graphics_tech_path.."productivity-module-5.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_productivity-module-4", "ei_odd-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_productivity-module-5"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_speed-module-6",
        type = "technology",
        icon = ei_graphics_tech_path.."speed-module-6.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_speed-module-5", "ei_cavity"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_speed-module-6"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_photon-cavity"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_efficiency-module-6",
        type = "technology",
        icon = ei_graphics_tech_path.."effectivity-module-6.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_efficiency-module-5", "ei_cavity", "ei_sun-watching"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_efficiency-module-6"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_gluon-cavity"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_productivity-module-6",
        type = "technology",
        icon = ei_graphics_tech_path.."productivity-module-6.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"ei_productivity-module-5", "ei_cavity", "ei_gas-giant-watching"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_productivity-module-6"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_z-boson-cavity"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["space-quantum-age"],
            time = 20
        },
        age = "space-quantum-age",
    },
    {
        name = "ei_gauss-module",
        type = "technology",
        icon = ei_graphics_tech_path.."gauss-module.png",
        icon_size = 128,
        prerequisites = {"ei_productivity-module-6", "ei_speed-module-6", "ei_efficiency-module-6", "ei_high-tech-parts"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_gauss-module"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["both-quantum-age"],
            time = 20
        },
        age = "both-quantum-age",
    },
    {
        name = "ei_enriched-cryodust",
        type = "technology",
        icon = ei_graphics_tech_2_path.."enriched-cryodust.png",
        icon_size = 256,
        prerequisites = {"ei_fish-growing"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_enriched-cryodust"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_plasma-cube",
        type = "technology",
        icon = ei_graphics_tech_path.."plasma-cube.png",
        icon_size = 128,
        prerequisites = {"ei_fusion-data"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_plasma-cube"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
    },
    {
        name = "ei_eu-circuit",
        type = "technology",
        icon = ei_graphics_tech_path.."eu-circuits.png",
        icon_size = 128,
        prerequisites = {"ei_clean-plating"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_pre-circuit-board"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_circuit-board"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_eu-circuit"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_processing-unit__circuit-board"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
    {
        name = "ei_personal-reactor",
        type = "technology",
        icon = ei_graphics_other_path.."personal-reactor.png",
        icon_size = 256,
        prerequisites = {"ei_fusion-reactor", "ei_plasma-cube"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-reactor"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["quantum-age"],
            time = 20
        },
        age = "quantum-age",
    },
})

--OTHER
------------------------------------------------------------------------------------------------------
data:extend({
    {
        type = "sprite",
        name = "ei_overload-icon",
        filename = ei_graphics_other_path.."overload-icon.png",
        size = 64,
        scale = 1
    },
    {
        type = "animation",
        name = "ei_overload-animation",
        filename = ei_graphics_other_path.."overload-animation.png",
        draw_as_glow = true,
        line_length = 16,
        width = 592/16,
        height = 35,
        frame_count = 16,
        animation_speed = 1,
        scale = 1,
    },
    {
        type = "animation",
        name = "ei_neutron-collector_top",
        filename = ei_graphics_entity_path.."neutron-collector_top.png",
        line_length = 8,
        lines_per_file = 8,
        --width = 36,
        --height = 29,
        width = 512,
        height = 512,
        frame_count = 64,
        animation_speed = 1,
        shift = {0,-0.2},
	    scale = 0.44/2,
        run_mode = "backward",
    },
    {
        name = "ei_bio-armor",
        type = "equipment-grid",
        equipment_categories = {"armor"},
        width = 14,
        height = 14,
    },
    {
        name = "ei_personal-reactor",
        type = "generator-equipment",
        power = "3MW",
        categories = {"armor"},
        sprite = {
            filename = ei_graphics_other_path.."personal-reactor.png",
            width = 256,
            height = 256,
            priority = "medium"
        },
        shape = {
            width = 4,
            height = 4,
            type = "full"
        },
        energy_source = {
            type = "electric",
            usage_priority = "secondary-output"
        },
        take_result = "ei_personal-reactor",
    },
})

table.insert(data.raw["technology"]["ei_exotic-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_exotic-age-tech"
})

data.raw["technology"]["ei_exotic-age"].prerequisites = {
    "ei_high-tech-parts", "ei_cavity"
}