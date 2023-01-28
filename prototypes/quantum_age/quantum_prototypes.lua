-- this file contains the prototype definition for varios stuff from quantum age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
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
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
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
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-pure-neodym-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
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
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-coal-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."crushed-coal-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
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
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."carbon-nanotube-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
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
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."magnet-data_light.png",
                scale = 0.25/2
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
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."simulation-data_light.png",
                scale = 0.25/2
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
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."sun-data.png",
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."space-data_light.png",
                scale = 0.25/2
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
        stack_size = 200,
        pictures = {
            layers =
            {
              {
                size = 128,
                filename = ei_graphics_item_path.."gas-giant-data.png",
                scale = 0.25/2
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 128,
                filename = ei_graphics_item_path.."space-data_light.png",
                scale = 0.25/2
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
        order = "d[empty-barrel]-2",
    },
    {
        name = "ei_eu-circuit",
        type = "item",
        icon = ei_graphics_item_path.."eu-circuit.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "intermediate-product",
        order = "g[processing-unit]-a",
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
        order = "b-a",
    },
    {
        name = "ei_exotic-matter-down",
        type = "item",
        icon = ei_graphics_item_path.."exotic-matter-down.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-items",
        order = "b-b",
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
        fuel_value = "500MJ",
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
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-1.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-2.png",
                icon_mipmaps = 4,
                scale = 0.25,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."lithium-crystal-3.png",
                icon_mipmaps = 4,
                scale = 0.25,
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
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_crushed-neodym",
        type = "recipe",
        category = "ei_crushing",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_neodym-chunk", amount = 6},
        },
        results = {
            {type = "item", name = "ei_crushed-neodym", amount = 3},
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
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 50},
        },
        results = {
            {type = "item", name = "ei_pure-crushed-neodym", amount = 5},
            {type = "item", name = "stone", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_pure-crushed-neodym",
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
        name = "ei_cast-neodym:ingot",
        type = "recipe",
        category = "ei_casting",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_molten-neodym", amount = 10},
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
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 5},
        },
        results = {
            {type = "item", name = "ei_neodym-plate", amount = 1},
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
            {type = "item", name = "ei_neodym-plate", amount = 2},
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
        name = "ei_fission-tech:u235",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "uranium-235", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:u233",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_uranium-233", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:pt239",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_plutonium-239", amount = 1},
        },
        results = {
            {type = "item", name = "ei_fission-tech", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_fission-tech",
    },
    {
        name = "ei_fission-tech:th232",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "stone", amount = 6},
            {type = "item", name = "ei_uranium-test-fuel", amount = 1},
            {type = "item", name = "ei_thorium-232", amount = 1},
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
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "item", name = "ei_magnet", amount = 2},
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
            {type = "fluid", name = "ei_computing-power", amount = 200},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 200},
            {type = "item", name = "ei_superior-data", amount = 5},
            {type = "item", name = "ei_plasma-data", amount = 5},
            {type = "item", name = "ei_magnet-data", amount = 5},
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
        energy_required = 30,
        ingredients = {
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
            {type = "item", name = "ei_simulation-data", amount = 3},
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
        energy_required = 120,
        ingredients = {
            {type = "item", name = "ei_space-data", amount = 10},
            {type = "item", name = "ei_advanced-rocket-fuel", amount = 10},
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
            {type = "item", name = "ei_high-tech-parts", amount = 1},
            {type = "item", name = "ei_moon-rock", amount = 1},
            {type = "item", name = "ei_mars-rock", amount = 1},
            {type = "item", name = "ei_uran-rock", amount = 1},
            {type = "item", name = "ei_sulf-rock", amount = 1},
            {type = "item", name = "ei_gas-giant-data", amount = 1},
            {type = "item", name = "ei_sun-data", amount = 1},

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
            {type = "item", name = "fusion-reactor-equipment", amount = 1},
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
        category = "ei_exotic-assembler",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "item", name = "ei_exotic-matter-up", amount = 1},
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
        category = "ei_exotic-assembler",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "processing-unit", amount = 1},
            {type = "item", name = "ei_exotic-matter-up", amount = 1},
            {type = "item", name = "ei_superior-data", amount = 1},
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
        category = "ei_exotic-assembler",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_magnet", amount = 1},
            {type = "item", name = "ei_exotic-matter-down", amount = 1},
        },
        results = {
            {type = "item", name = "ei_eu-magnet", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_eu-magnet",
    },
    {
        name = "ei_high-tech-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 20,
        ingredients = {
            {type = "item", name = "ei_eu-magnet", amount = 1},
            {type = "item", name = "ei_eu-circuit", amount = 1},
            {type = "item", name = "ei_plasma-cube", amount = 1},
        },
        results = {
            {type = "item", name = "ei_high-tech-parts", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-tech-parts",
    },
    {
        name = "ei_advanced-rocket-fuel",
        type = "recipe",
        category = "centrifuging",
        energy_required = 10,
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
            {type = "item", name = "ei_fluorite", amount = 2},
        },
        results = {
            {type = "fluid", name = "ei_oxygen-difluoride", amount = 25},
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
        energy_required = 0.5,
        ingredients = {
            {type = "item", name = "ei_lithium-crystal", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_lithium-6", amount = 1, probability = 0.07},
            {type = "fluid", name = "ei_lithium-7", amount = 1, probability = 0.93},
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
            {type = "fluid", name = "ei_heated-lithium-6", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_heated-lithium-6",
    },
    {
        name = "ei_charged-neutron-container:pt239",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 2},
            {type = "item", name = "ei_plutonium-239", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container:u235",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 2},
            {type = "item", name = "uranium-235", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container:u233",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 2},
            {type = "item", name = "ei_uranium-233", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container:th232",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 1},
            {type = "item", name = "ei_thorium-232", amount = 1},
        },
        results = {
            {type = "item", name = "ei_charged-neutron-container", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-neutron-container",
    },
    {
        name = "ei_charged-neutron-container:u238",
        type = "recipe",
        category = "ei_fission-facility",
        energy_required = 100,
        ingredients = {
            {type = "item", name = "ei_neutron-container", amount = 1},
            {type = "item", name = "uranium-238", amount = 20},
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
})

--TECHS
------------------------------------------------------------------------------------------------------
data:extend({
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
                recipe = "ei_molten-neodym"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cast-neodym:ingot"
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
        prerequisites = {"ei_bio-chamber"},
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
                recipe = "ei_charged-neutron-container:pt239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container:u235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container:u238"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container:u233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_charged-neutron-container:th232"
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
        prerequisites = {"fusion-reactor-equipment", "ei_lithium-processing", "energy-weapons-damage-6"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_deuterium:activator"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_tritium:activator"
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
        prerequisites = {"fusion-reactor-equipment"},
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
                recipe = "ei_fission-tech:u235"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:u233"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:pt239"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fission-tech:th232"
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
                recipe = "ei_lithium-6:activator"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["fusion-quantum-age"],
            time = 20
        },
        age = "fusion-quantum-age",
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
    }
})

table.insert(data.raw["technology"]["ei_exotic-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_exotic-age-tech"
})

data.raw["technology"]["ei_exotic-age"].prerequisites = {
    "ei_high-tech-parts", "ei_moon-mining", "ei_uran-mining", "ei_mars-mining", "ei_sulf-mining", "ei_sun-watching", "ei_gas-giant-watching" 
}