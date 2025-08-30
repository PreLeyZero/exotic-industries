-- this file contains the prototype definition for varios stuff from computer age

local ei_data = require("lib/data")

--====================================================================================================
--PROTOTYPE DEFINITIONS
--====================================================================================================

--ITEMS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_module-part",
        type = "item",
        icon = ei_graphics_item_path.."module-part.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b7",
        stack_size = 50
    },
    {
        name = "ei_module-base",
        type = "item",
        icon = ei_graphics_item_path.."module-base.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b8",
        stack_size = 50
    },
    {
        name = "ei_empty-cryo-container",
        type = "item",
        icon = ei_graphics_item_path.."empty-cryo-container.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[barrel]-1",
        stack_size = 50
    },
    {
        name = "ei_cryo-container-nitrogen",
        type = "item",
        icon = ei_graphics_item_path.."cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[barrel]-1",
        stack_size = 50
    },
    {
        name = "ei_cryo-container-oxygen",
        type = "item",
        icon = ei_graphics_item_path.."cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "d[barrel]-2",
        stack_size = 50
    },
    --[[
    {
        name = "ei_charged-energy-crystal",
        type = "item",
        icon = ei_graphics_item_path.."charged-energy-crystal.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "g1",
        stack_size = 100
    },
    ]]
    {
        name = "ei_high-energy-crystal",
        type = "item",
        icon = ei_graphics_item_path.."high-energy-crystal.png",
        icon_size = 64,
        subgroup = "raw-material",
        order = "g1",
        stack_size = 100
    },
    {
        name = "ei_advanced-motor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-motor.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "i[electric-engine-unit]-1",
        stack_size = 50
    },
    {
        name = "ei_rocket-parts",
        type = "item",
        icon = ei_graphics_item_path.."rocket-parts.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "p[rocket-fuel]-x-1",
        stack_size = 100
    },
    {
        name = "ei_advanced-computer-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."advanced-computer-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a4-1",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."advanced-computer-age-tech.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."computer-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_knowledge-computer-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."knowledge-computer-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a4-2",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."knowledge-computer-age-tech.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."computer-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_quantum-age-tech",
        type = "tool",
        icon = ei_graphics_item_path.."quantum-age-tech.png",
        icon_size = 64,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "a5",
        pictures = {
            layers =
            {
              {
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech.png",
                scale = 0.5
              },
              {
                draw_as_light = true,
                flags = {"light"},
                size = 64,
                filename = ei_graphics_item_path.."quantum-age-tech_light.png",
                scale = 0.5
              }
            }
        },
    },
    {
        name = "ei_knowledge-tech",
        type = "tool",
        icon = ei_graphics_item_2_path.."knowledge-science.png",
        icon_size = 128,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "z1",
    },
    {
        name = "ei_knowledge-tech-2",
        type = "tool",
        icon = ei_graphics_item_2_path.."knowledge-science_2.png",
        icon_size = 128,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "z2",
    },
    {
        name = "ei_knowledge-tech-3",
        type = "tool",
        icon = ei_graphics_item_2_path.."knowledge-science_3.png",
        icon_size = 128,
        stack_size = 200,
        durability = 1,
        subgroup = "science-pack",
        order = "z3",
    },
    --[[
    {
        name = "ei_advanced-faulty-semiconductor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-faulty-waver.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b4",
        stack_size = 50
    },
    ]]
    {
        name = "ei_advanced-semiconductor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-waver.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b3-2",
        stack_size = 50
    },
    {
        name = "ei_advanced-base-semiconductor",
        type = "item",
        icon = ei_graphics_item_path.."advanced-base-waver.png",
        icon_size = 128,
        subgroup = "intermediate-product",
        order = "b3-1",
        stack_size = 50
    },
    {
        name = "ei_computing-unit",
        type = "item",
        icon = ei_graphics_item_path.."computing-unit.png",
        icon_size = 64,
        subgroup = "intermediate-product",
        order = "b8-1",
        stack_size = 50
    },
    {
        name = "ei_personal-laser",
        type = "item",
        icon = ei_graphics_item_path.."personal-laser.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "military-equipment",
        order = "b[active-defense]-a[personal-laser-defense-equipment]-a",
        place_as_equipment_result = "ei_personal-laser",
        stack_size = 20
    },
    {
        name = "ei_personal-laser",
        type = "active-defense-equipment",
        sprite = {
            filename = ei_graphics_other_path.."personal-laser.png",
            width = 128,
            height = 128,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 2,
            type = "full"
        },
        energy_source = {
            type = "electric",
            buffer_capacity = "10MJ",
            input_flow_limit = "500kW",
            usage_priority = "primary-input"
        },
        automatic = true,
        attack_parameters = {
            ammo_category = "laser",
            ammo_type = {
                action = {
                    action_delivery = {
                        beam = "laser-beam",
                        duration = 20,
                        max_length = 20,
                        source_offset = {
                            0,
                            -1.3143899999999999
                        },
                        type = "beam"
                    },
                    type = "direct"
                },
                energy_consumption = "100kJ"
            },
            cooldown = 20,
            damage_modifier = 4,
            range = 20,
            type = "beam"
        },
        -- energy_consumption = "100kW",
        take_result = "ei_personal-laser",
        categories = {"armor"}
    },
    {
        name = "ei_personal-leg",
        type = "item",
        icon = ei_graphics_item_path.."personal-leg.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "equipment",
        order = "d[exoskeleton]-b[personal-leg]",
        place_as_equipment_result = "ei_personal-leg",
        stack_size = 20
    },
    {
        name = "ei_personal-leg",
        type = "movement-bonus-equipment",
        sprite = {
            filename = ei_graphics_other_path.."personal-leg.png",
            width = 128,
            height = 256,
            priority = "medium"
        },
        shape = {
            width = 2,
            height = 4,
            type = "full"
        },
        energy_source = {
            type = "electric",
            buffer_capacity = "10MJ",
            input_flow_limit = "550kW",
            usage_priority = "primary-input"
        },
        energy_consumption = "500kW",
        movement_bonus = 0.7,
        take_result = "ei_personal-leg",
        categories = {"armor"}
    },
    {
        name = "ei_compound-ammo",
        type = "ammo",
        icon = ei_graphics_item_path.."compound-ammo.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "ammo",
        order = "a[basic-clips]-d[compound-ammo]",
        magazine_size = 100,
        pictures = {
            layers = {
              {
                filename = ei_graphics_item_path.."compound-ammo.png",
                mipmap_count = 4,
                scale = 0.5,
                size = 64
              },
              {
                draw_as_light = true,
                filename = "__base__/graphics/icons/uranium-rounds-magazine-light.png",
                flags = {
                  "light"
                },
                mipmap_count = 4,
                scale = 0.5,
                size = 64
              }
            }
        },
        stack_size = 200,
        ammo_category = "bullet",
        ammo_type = {
            action = {
                action_delivery = {
                    source_effects = {
                        entity_name = "explosion-gunshot",
                        type = "create-explosion"
                    },
                    target_effects = {
                        {
                            entity_name = "explosion-hit",
                            offset_deviation = {
                                { -0.5, -0.5 },
                                { 0.5, 0.5 }
                            },
                            offsets = {
                                { 0, 1 }
                            },
                            type = "create-entity"
                        },
                        {
                            damage = {
                                amount = 44,
                                type = "physical"
                            },
                            type = "damage"
                        },
                        {
                            damage = {
                                amount = 32,
                                type = "electric"
                            },
                            type = "damage"
                        },
                        {
                            type = "create-sticker",
                            sticker = "stun-sticker"
                        }
                    },
                    type = "instant"
                },
                type = "direct"
            },
        },
    },
    {
        name = "ei_cryodust",
        type = "item",
        icon = ei_graphics_item_2_path.."cryodust.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_alien-items-2",
        order = "a",
        pictures = {
            {
                filename = ei_graphics_item_2_path.."cryodust-1.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_2_path.."cryodust-2.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_2_path.."cryodust-3.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_2_path.."cryodust-4.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_2_path.."cryodust-5.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_2_path.."cryodust-6.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_condensed-cryodust",
        type = "item",
        icon = ei_graphics_item_2_path.."condensed-cryodust.png",
        icon_size = 128,
        stack_size = 100,
        subgroup = "ei_alien-items-2",
        order = "c",
        pictures = {
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-1.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-1.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-2.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-2.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-3.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-3.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-4.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-4.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-5.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-5.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."condensed-cryodust-6.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."condensed-cryodust-6.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
        },
    },
    {
        name = "ei_enriched-cryodust",
        type = "item",
        icon = ei_graphics_item_2_path.."enriched-cryodust.png",
        icon_size = 128,
        stack_size = 100,
        subgroup = "ei_alien-items-2",
        order = "d",
        pictures = {
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."enriched-cryodust.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."enriched-cryodust.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."enriched-cryodust-2.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."enriched-cryodust-2.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."enriched-cryodust-3.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."enriched-cryodust-3.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
            {
            layers = {
                {
                    filename = ei_graphics_item_2_path.."enriched-cryodust-4.png",
                    scale = 0.25,
                    size = 128
                },
                {
                    draw_as_light = true,
                    filename = ei_graphics_item_2_path.."enriched-cryodust-4.png",
                    scale = 0.25,
                    size = 128
                }
            },
            },
        },
    },
    {
        name = "ei_cryocondensate",
        type = "item",
        icon = ei_graphics_item_2_path.."cryocondensate.png",
        icon_size = 64,
        subgroup = "ei_alien-items-2",
        order = "b",
        stack_size = 20
    },
    {
        name = "ei_sus-plating",
        type = "item",
        icon = ei_graphics_item_path.."sus-plating.png",
        icon_size = 64,
        subgroup = "ei_alien-intermediates",
        order = "d-a",
        stack_size = 100
    },
    {
        name = "ei_bio-matter",
        type = "item",
        icon = ei_graphics_item_path.."bio-matter.png",
        icon_size = 64,
        subgroup = "ei_alien-intermediates",
        order = "c-b",
        stack_size = 10
    },
    {
        name = "ei_evolved-alien-seed",
        type = "item",
        icon = ei_graphics_item_path.."evolved-alien-seed.png",
        icon_size = 64,
        subgroup = "ei_alien-items",
        order = "c-a",
        stack_size = 1
    },
    {
        name = "ei_blooming-evolved-alien-seed",
        type = "item",
        icon = ei_graphics_item_path.."blooming-evolved-alien-seed.png",
        icon_size = 64,
        subgroup = "ei_alien-items",
        order = "c-b",
        stack_size = 1
    },
    {
        name = "ei_silicon",
        type = "item",
        icon = ei_graphics_item_path.."silicon.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-secondary",
        order = "b1",
        pictures = {
            {
                filename = ei_graphics_item_path.."silicon.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."silicon-2.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."silicon-3.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."silicon-4.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."silicon-5.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        name = "ei_monosilicon",
        type = "item",
        icon = ei_graphics_item_path.."monosilicon.png",
        icon_size = 64,
        stack_size = 100,
        subgroup = "ei_refining-secondary",
        order = "b2",
        pictures = {
            {
                filename = ei_graphics_item_path.."monosilicon.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."monosilicon-2.png",
                scale = 0.5,
                size = 64
            },
            {
                filename = ei_graphics_item_path.."monosilicon-3.png",
                scale = 0.5,
                size = 64
            },
        },
    },
    {
        type = "item",
        name = "ei_rocket-control-unit",
        icons = {{icon="__base__/graphics/icons/processing-unit.png", tint={r=1.0, g=0.8, b=0.0}}},
        subgroup = "intermediate-product",
        order = "n[ei_rocket-control-unit]",
        stack_size = 10
      },
})

--RECIPES
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_sus-plating",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "iron-plate", amount = 1},
            {type = "item", name = "ei_bio-matter", amount = 1},
            {type = "item", name = "ei_alien-resin", amount = 1},
            {type = "fluid", name = "lubricant", amount = 5},
        },
        results = {
            {type = "item", name = "ei_sus-plating", amount = 1},
            {type = "item", name = "ei_bio-matter", amount = 1, probability = 0.8},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_sus-plating",
    },
    {
        name = "ei_bio_insulated-wire",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "plastic-bar", amount = 2},
            {type = "item", name = "copper-cable", amount = 4},
            {type = "item", name = "ei_bio-matter", amount = 1},
        },
        results = {
            {type = "item", name = "ei_insulated-wire", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_insulated-wire.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-a",
    },
    {
        name = "ei_bio_energy-crystal",
        type = "recipe",
        category = "ei_growing",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_energy-crystal", amount = 1},
            {type = "fluid", name = "ei_acidic-water", amount = 10},
            {type = "item", name = "ei_bio-matter", amount = 1},
        },
        results = {
            {type = "item", name = "ei_energy-crystal", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_energy-crystal.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-c",
    },
    {
        name = "ei_bio_high-energy-crystal",
        type = "recipe",
        category = "ei_growing",
        energy_required = 60,
        ingredients = {
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
            {type = "fluid", name = "ei_crystal-solution", amount = 3},
            {type = "item", name = "ei_bio-matter", amount = 3},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_high-energy-crystal.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-d",
    },
    {
        name = "ei_bio_hydrofluoric-acid",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_fluorite", amount = 1},
            {type = "fluid", name = "water", amount = 100},
            {type = "item", name = "sulfur", amount = 3},
            {type = "item", name = "ei_bio-matter", amount = 2},
        },
        results = {
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 250},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_hydrofluoric-acid.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-e",
    },
    {
        name = "ei_bio_nitric-acid",
        type = "recipe",
        category = "chemistry",
        energy_required = 3,
        ingredients = {
            {type = "item", name = "ei_crushed-gold", amount = 1},
            {type = "fluid", name = "ei_dinitrogen-tetroxide-water-solution", amount = 10},
            {type = "fluid", name = "ei_oxygen-gas", amount = 5},
            {type = "item", name = "ei_bio-matter", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid", amount = 100},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_nitric-acid.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-f",
    },
    {
        name = "ei_bio_electronic-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 6,
        ingredients = {
            {type = "item", name = "battery", amount = 2},
            {type = "item", name = "ei_insulated-wire", amount = 2},
            {type = "item", name = "ei_cpu", amount = 1},
            {type = "item", name = "advanced-circuit", amount = 3},
            {type = "item", name = "ei_bio-matter", amount = 4},
        },
        results = {
            {type = "item", name = "ei_electronic-parts", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."bio_electronic-parts.png",
        icon_size = 64,
        subgroup = "ei_alien-bio",
        order = "a-b",
    },
    {
        name = "ei_concentrated-gaia-water",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_gaia-water", amount = 25},
        },
        results = {
            {type = "fluid", name = "ei_concentrated-gaia-water", amount = 15},
            {type = "fluid", name = "water", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_concentrated-gaia-water",
    },
    {
        name = "ei_water",
        type = "recipe",
        category = "ei_purifier",
        energy_required = 6,
        ingredients = {
            {type = "fluid", name = "ei_concentrated-gaia-water", amount = 100},
        },
        results = {
            {type = "item", name = "ei_sand", amount = 1},
            {type = "item", name = "ei_crushed-coal", amount = 1},
            {type = "item", name = "ei_crushed-sulfur", amount = 1},
            {type = "fluid", name = "water", amount = 50},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_alien-intermediates",
        order = "a-b",
        main_product = "water",
    },
    {
        name = "ei_evolved-alien-seed",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_ammonia-gas", amount = 25},
            {type = "item", name = "ei_alien-seed", amount = 1},
            {type = "fluid", name = "ei_pythogas", amount = 50},
        },
        results = {
            {type = "item", name = "ei_evolved-alien-seed", amount = 1},
            {type = "item", name = "ei_alien-seed", amount = 1, probability = 0.5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_evolved-alien-seed",
    },
    {
        name = "ei_blooming-evolved-alien-seed",
        type = "recipe",
        category = "ei_bio-chamber",
        energy_required = 20,
        ingredients = {
            {type = "fluid", name = "ei_concentrated-gaia-water", amount = 5},
            {type = "item", name = "ei_evolved-alien-seed", amount = 1},
            {type = "fluid", name = "ei_pythogas", amount = 100},
        },
        results = {
            {type = "item", name = "ei_blooming-evolved-alien-seed", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_blooming-evolved-alien-seed",
    },
    {
        name = "ei_bio-sludge",
        type = "recipe",
        category = "ei_bio-reactor",
        energy_required = 16,
        ingredients = {
            {type = "item", name = "explosives", amount = 1},
            {type = "item", name = "ei_blooming-evolved-alien-seed", amount = 1},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 25},
            {type = "fluid", name = "ei_oxygen-gas", amount = 25},
        },
        results = {
            {type = "item", name = "ei_evolved-alien-seed", amount = 1, probability = 0.15},
            {type = "item", name = "ei_blooming-evolved-alien-seed", amount = 1, probability = 0.15},
            {type = "item", name = "ei_bio-matter", amount = 1, probability = 0.5},
            {type = "fluid", name = "ei_bio-sludge", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_bio-sludge",
    },
    {
        name = "ei_bio-matter",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_bio-matter", amount = 1},
            {type = "item", name = "ei_crushed-coal", amount = 1},
            {type = "fluid", name = "ei_bio-sludge", amount = 10},
        },
        results = {
            {type = "item", name = "ei_bio-matter", amount = 2},
            {type = "fluid", name = "ei_bio-sludge", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_bio-matter",
    },
    {
        name = "ei_cryodust",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_gaia-water", amount = 5},
            {type = "item", name = "ei_sand", amount = 1},
            {type = "fluid", name = "ei_cryoflux", amount = 10},
        },
        results = {
            {type = "item", name = "ei_cryodust", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cryodust",
    },
    {
        name = "ei_cryocondensate",
        type = "recipe",
        category = "centrifuging",
        energy_required = 8,
        ingredients = {
            {type = "item", name = "ei_cryodust", amount = 10},
            {type = "item", name = "sulfur", amount = 4},
            {type = "fluid", name = "ei_cryoflux", amount = 25},
        },
        results = {
            {type = "item", name = "ei_cryodust", amount = 3},
            {type = "item", name = "ei_cryocondensate", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_cryocondensate",
    },
    {
        name = "ei_condensed-cryodust",
        type = "recipe",
        category = "ei_destill-tower",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "ei_cryocondensate", amount = 10},
            {type = "item", name = "ei_crushed-coal", amount = 4},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 25},
        },
        results = {
            {type = "item", name = "ei_cryocondensate", amount = 9},
            {type = "item", name = "ei_condensed-cryodust", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_condensed-cryodust",
    },
    {
        name = "ei_compound-ammo",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="uranium-rounds-magazine", amount=15},
            {type="item", name="ei_energy-crystal", amount=15},
            {type="item", name="explosives", amount=20},
        },
        results = {{type="item", name="ei_compound-ammo", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_compound-ammo",
    },
    {
        name = "ei_personal-laser",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="personal-laser-defense-equipment", amount=4},
            {type="item", name="ei_simulation-data", amount=30},
            {type="item", name="ei_high-energy-crystal", amount=20},
        },
        results = {{type="item", name="ei_personal-laser", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_personal-laser",
    },
    {
        name = "ei_personal-leg",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="exoskeleton-equipment", amount=4},
            {type="item", name="ei_simulation-data", amount=30},
            {type="item", name="ei_advanced-motor", amount=20},
        },
        results = {{type="item", name="ei_personal-leg", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_personal-leg",
    },
    {
        name = "ei_advanced-base-semiconductor",
        type = "recipe",
        category = "ei_waver-factory",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_nitric-acid", amount = 5},
            {type = "item", name = "ei_sand", amount = 8},
            {type = "item", name = "ei_semiconductor", amount = 1},
        },
        results = {
            {type = "item", name = "ei_advanced-base-semiconductor", amount = 1, probability = 0.75},
            {type = "item", name = "ei_faulty-semiconductor", amount = 1, probability = 0.25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-base-semiconductor",
    },
    {
        name = "ei_advanced-semiconductor",
        type = "recipe",
        category = "ei_waver-factory",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_crushed-gold", amount = 6},
            {type = "item", name = "ei_energy-crystal", amount = 2},
            {type = "item", name = "ei_advanced-base-semiconductor", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_acidic-water", amount = 10},
            {type = "item", name = "ei_advanced-semiconductor", amount = 1, probability = 0.75},
            {type = "item", name = "ei_faulty-semiconductor", amount = 1, probability = 0.25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-semiconductor",
    },
    {
        name = "ei_computing-unit",
        type = "recipe",
        category = "crafting",
        energy_required = 15,
        ingredients = {
            {type = "item", name = "ei_rocket-control-unit", amount = 1},
            {type = "item", name = "ei_module-base", amount = 1},
            {type = "item", name = "ei_condensed-cryodust", amount = 1},
            {type = "item", name = "ei_sus-plating", amount = 3},
        },
        results = {
            {type = "item", name = "ei_computing-unit", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_computing-unit",
    },
    {
        name = "ei_molten-steel__mix",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_molten-iron", amount = 15},
            {type = "item", name = "ei_crushed-coke", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-steel", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-steel",
        icon_size = 64,
        icon = ei_graphics_other_path.."molten-steel_coke.png"
    },
    {
        name = "ei_molten-steel__oxygen",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_molten-iron", amount = 20},
            {type = "fluid", name = "ei_oxygen-gas", amount = 20},
            {type = "item", name = "coal", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_molten-steel", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_molten-steel",
        icon_size = 64,
        icon = ei_graphics_other_path.."molten-steel_coal.png"
    },
    {
        name = "ei_module-part",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_electronic-parts", amount=1},
            {type="item", name="ei_ceramic", amount=4},
            {type="item", name="ei_crushed-gold", amount=2},
        },
        results = {{type="item", name="ei_module-part", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_module-part",
    },
    {
        name = "ei_rocket-parts",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients =
        {
            {type="item", name="ei_rocket-control-unit", amount=1},
            {type="item", name="low-density-structure", amount=2},
            {type="item", name="ei_steel-mechanical-parts", amount=4},
            {type="item", name="ei_insulated-wire", amount=2},
            {type="item", name="ei_copper-beam", amount=4},
        },
        results = {{type="item", name="ei_rocket-parts", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_rocket-parts",
    },
    {
        name = "ei_module-base",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {type="item", name="ei_module-part", amount=1},
            {type="item", name="ei_energy-crystal", amount=1},
            {type="item", name="ei_glass", amount=2},
        },
        results = {{type="item", name="ei_module-base", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_module-base",
    },
    {
        name = "ei_emtpy-cryo-container",
        type = "recipe",
        category = "crafting",
        energy_required = 6,
        ingredients =
        {
            {type="item", name="plastic-bar", amount=8},
            {type="item", name="barrel", amount=1},
            {type="item", name="ei_ceramic", amount=10},
            {type="item", name="ei_glass", amount=8},
        },
        results = {{type="item", name="ei_empty-cryo-container", amount=1}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_empty-cryo-container",
    },
    {
        name = "ei_fill-cryo-container-nitrogen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 500*ei_lib.config("barrel__multiplier")},
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_cryo-container-nitrogen", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."fill-cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "fill-barrel",
        order = "c-1",
    },
    {
        name = "ei_empty-cryo-container-nitrogen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_cryo-container-nitrogen", amount = 1},
        },
        results = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "fluid", name = "ei_liquid-nitrogen", amount = 490*ei_lib.config("barrel__multiplier")},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."empty-cryo-container-nitrogen.png",
        icon_size = 64,
        subgroup = "barrel",
        order = "c-1",
    },
    {
        name = "ei_fill-cryo-container-oxygen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_liquid-oxygen", amount = 500*ei_lib.config("barrel__multiplier")},
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
        },
        results = {
            {type = "item", name = "ei_cryo-container-oxygen", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."fill-cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "fill-barrel",
        order = "c-2",
    },
    {
        name = "ei_empty-cryo-container-oxygen",
        type = "recipe",
        category = "crafting-with-fluid",
        energy_required = 1,
        ingredients = {
            {type = "item", name = "ei_cryo-container-oxygen", amount = 1},
        },
        results = {
            {type = "item", name = "ei_empty-cryo-container", amount = 1},
            {type = "fluid", name = "ei_liquid-oxygen", amount = 490*ei_lib.config("barrel__multiplier")},
        },
        always_show_made_in = true,
        enabled = false,
        icon = ei_graphics_other_path.."empty-cryo-container-oxygen.png",
        icon_size = 64,
        subgroup = "barrel",
        order = "c-2",
    },
    {
        name = "ei_crystal-solution",
        type = "recipe",
        category = "chemistry",
        energy_required = 10,
        ingredients = {
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 25},
            {type = "item", name = "ei_energy-crystal", amount = 5},
        },
        results = {
            {type = "fluid", name = "ei_crystal-solution", amount = 25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_crystal-solution",
    },
    {
        name = "ei_high-energy-crystal",
        type = "recipe",
        category = "centrifuging",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_crystal-solution", amount = 100},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 1, probability = 0.001},
            {type = "fluid", name = "ei_crystal-solution", amount = 99},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-energy-crystal",
    },
    {
        name = "ei_high-energy-crystal__growing",
        type = "recipe",
        category = "ei_growing",
        energy_required = 60,
        ingredients = {
            {type = "fluid", name = "ei_crystal-solution", amount = 5},
            {type = "item", name = "ei_high-energy-crystal", amount = 1},
        },
        results = {
            {type = "item", name = "ei_high-energy-crystal", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_high-energy-crystal",
    },
    {
        name = "ei_quantum-age-tech",
        type = "recipe",
        category = "crafting",
        energy_required = 24,
        ingredients =
        {
            {type="item", name="ei_simulation-data", amount=20},
            {type="item", name="ei_space-data", amount=3},
            {type="item", name="ei_high-energy-crystal", amount=2},
            {type="item", name="ei_computing-unit", amount=1},
        },
        results = {{type="item", name="ei_quantum-age-tech", amount=8}},
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_quantum-age-tech",
    },
    {
        name = "ei_hydrogen",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "water", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_oxygen-gas", amount = 10},
            {type = "fluid", name = "ei_hydrogen-gas", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_hydrogen-gas",
    },
    {
        name = "ei_ammonia",
        type = "recipe",
        category = "chemistry",
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "ei_hydrogen-gas", amount = 30},
            {type = "fluid", name = "ei_nitrogen-gas", amount = 20},
        },
        results = {
            {type = "fluid", name = "ei_ammonia-gas", amount = 20},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_ammonia-gas",
    },
    {
        name = "ei_dinitrogen-tetroxide",
        type = "recipe",
        category = "chemistry",
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "ei_ammonia-gas", amount = 40},
            {type = "fluid", name = "ei_oxygen-gas", amount = 70},
            {type = "item", name = "ei_crushed-iron", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-gas", amount = 40},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dinitrogen-tetroxide-gas",
    },
    {
        name = "ei_dinitrogen-tetroxide-water-solution",
        type = "recipe",
        category = "chemistry",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-gas", amount = 10},
            {type = "fluid", name = "water", amount = 10},
        },
        results = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-water-solution", amount = 10},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dinitrogen-tetroxide-water-solution",
    },
    {
        name = "ei_nitric-acid",
        type = "recipe",
        category = "chemistry",
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "ei_dinitrogen-tetroxide-water-solution", amount = 20},
            {type = "fluid", name = "ei_oxygen-gas", amount = 10},
            {type = "item", name = "ei_crushed-gold", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_nitric-acid", amount = 40},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_nitric-acid",
    },
    {
        name = "ei_advanced-computer-age-tech",
        type = "recipe",
        category = "advanced-crafting",
        energy_required = 28,
        ingredients = {
            {type = "item", name = "ei_simulation-data", amount = 12},
            {type = "item", name = "electric-engine-unit", amount = 3},
            {type = "item", name = "arithmetic-combinator", amount = 2},
            {type = "fluid", name = "ei_ammonia-gas", amount = 100},
        },
        results = {
            {type = "item", name = "ei_advanced-computer-age-tech", amount = 8},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-computer-age-tech",
    },
    {
        name = "ei_knowledge-computer-age-tech",
        type = "recipe",
        category = "advanced-crafting",
        energy_required = 28,
        ingredients = {
            {type = "item", name = "ei_alien-resin", amount = 10},
            {type = "item", name = "ei_alien-seed", amount = 1},
            {type = "item", name = "constant-combinator", amount = 2},
            {type = "fluid", name = "ei_cryoflux", amount = 100},
        },
        results = {
            {type = "item", name = "ei_knowledge-computer-age-tech", amount = 8},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_knowledge-computer-age-tech",
    },
    {
        name = "ei_advanced-motor",
        type = "recipe",
        category = "crafting",
        energy_required = 10,
        ingredients = {
            {type = "item", name = "electric-engine-unit", amount = 1},
            {type = "item", name = "ei_electronic-parts", amount = 1},
            {type = "item", name = "ei_steel-mechanical-parts", amount = 2},
            {type = "item", name = "ei_condensed-cryodust", amount = 2},
            -- {type = "fluid", name = "lubricant", amount = 15},
        },
        results = {
            {type = "item", name = "ei_advanced-motor", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-motor",
    },
    {
        name = "ei_battery__lithium",
        type = "recipe",
        category = "chemistry",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_lithium-crystal", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 1},
            {type = "fluid", name = "sulfuric-acid", amount = 15},
        },
        results = {
            {type = "item", name = "battery", amount = 2},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "battery",
        icon = ei_graphics_other_path.."lithium-battery.png",
        icon_size = 64,
    },
    {
        name = "ei_copper-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 40},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_pure-copper", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "b",
        icon = ei_graphics_other_path.."copper-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_iron-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 40},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_pure-iron", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "a",
        icon = ei_graphics_other_path.."iron-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_gold-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 1.5,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 60},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_pure-gold", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "c",
        icon = ei_graphics_other_path.."gold-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_lead-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 1.5,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 60},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_pure-lead", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "d",
        icon = ei_graphics_other_path.."lead-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_uranium-extraction",
        type = "recipe",
        category = "centrifuging",
        energy_required = 2.5,
        ingredients = {
            {type = "fluid", name = "ei_dirty-water", amount = 80},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 20},
            {type = "item", name = "ei_crushed-uranium", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        subgroup = "ei_refining-extraction",
        order = "f",
        icon = ei_graphics_other_path.."uranium-extraction.png",
        icon_size = 64,
    },
    {
        name = "ei_dirty-water__stone",
        type = "recipe",
        category = "ei_advanced-chem-plant",
        energy_required = 1,
        ingredients = {
            {type = "fluid", name = "water", amount = 10},
            {type = "item", name = "stone", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_dirty-water", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_dirty-water",
    },
    {
        name = "ei_petroleum-reforming",
        type = "recipe",
        category = "ei_advanced-chem-plant",
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "petroleum-gas", amount = 40},
            {type = "fluid", name = "ei_hydrogen-gas", amount = 10},
        },
        results = {
            {type = "fluid", name = "water", amount = 5},
            {type = "fluid", name = "heavy-oil", amount = 5},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "heavy-oil",
        icon = ei_graphics_tech_path.."petroleum-reforming.png",
        icon_size = 128,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-g[petroleum-reforming]",
    },
    {
        name = "ei_silicon",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "fluid", name = "ei_hydrogen-gas", amount = 5},
            {type = "fluid", name = "ei_molten-glass", amount = 10},
        },
        results = {
            {type = "item", name = "ei_silicon", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_silicon",
    },
    {
        name = "ei_monosilicon",
        type = "recipe",
        category = "chemistry",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_silicon", amount = 5},
            {type = "fluid", name = "ei_oxygen-gas", amount = 5},
        },
        results = {
            {type = "item", name = "ei_silicon", amount = 5, probability = 0.75},
            {type = "item", name = "ei_monosilicon", amount = 1, probability = 0.25},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_monosilicon",
    },
    {
        name = "ei_semiconductor__monosilicon",
        type = "recipe",
        category = "ei_waver-factory",
        energy_required = 5,
        ingredients = {
            {type = "fluid", name = "ei_hydrofluoric-acid", amount = 10},
            {type = "item", name = "ei_crushed-gold", amount = 5},
            {type = "item", name = "ei_monosilicon", amount = 1},
        },
        results = {
            {type = "item", name = "ei_semiconductor", amount = 4},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_semiconductor",
        icon = ei_graphics_other_path.."monosilicon_waver.png",
        icon_size = 128,
    },
    {
        name = "ei_advanced-semiconductor__monosilicon",
        type = "recipe",
        category = "ei_waver-factory",
        energy_required = 2,
        ingredients = {
            {type = "item", name = "ei_monosilicon", amount = 2},
            {type = "item", name = "ei_crushed-gold", amount = 6},
            {type = "item", name = "ei_energy-crystal", amount = 2},
            {type = "item", name = "ei_advanced-base-semiconductor", amount = 1},
        },
        results = {
            {type = "fluid", name = "ei_acidic-water", amount = 10},
            {type = "item", name = "ei_advanced-semiconductor", amount = 3},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_advanced-semiconductor",
        icon = ei_graphics_other_path.."monosilicon_advanced-waver.png",
        icon_size = 128,
    },
    {
        type = "recipe",
        name = "ei_rocket-control-unit",
        energy_required = 30,
        enabled = false,
        category = "crafting",
        ingredients =
        {
            {type="item", name="processing-unit", amount=1},
            {type="item", name="ei_high-energy-crystal", amount=1},
            {type="item", name="ei_insulated-wire", amount=6},
        },
        results={{type = "item", name= "ei_rocket-control-unit", amount=1}}
      },
})

--TECHS
------------------------------------------------------------------------------------------------------
data:extend({
    {
        name = "ei_sus-plating",
        type = "technology",
        icon = ei_graphics_tech_path.."sus-plating.png",
        icon_size = 128,
        prerequisites = {"ei_bio-reactor"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_sus-plating"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    -- bio variantes for insulted-wire, energy-crystal, high-energy-crystal, nitric acid and hydrofluoric-acid
    {
        name = "ei_bio_insulated-wire",
        type = "technology",
        icon = ei_graphics_other_path.."bio_insulated-wire.png",
        icon_size = 64,
        prerequisites = {"ei_bio-reactor"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_insulated-wire"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_bio_energy-crystal",
        type = "technology",
        icon = ei_graphics_other_path.."bio_energy-crystal.png",
        icon_size = 64,
        prerequisites = {"ei_bio-reactor", "ei_grower"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_energy-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_bio_high-energy-crystal",
        type = "technology",
        icon = ei_graphics_other_path.."bio_high-energy-crystal.png",
        icon_size = 64,
        prerequisites = {"ei_bio_energy-crystal"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_high-energy-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_bio_nitric-acid",
        type = "technology",
        icon = ei_graphics_other_path.."bio_nitric-acid.png",
        icon_size = 64,
        prerequisites = {"ei_bio_hydrofluoric-acid", "ei_nitric-acid"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_nitric-acid"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_bio_hydrofluoric-acid",
        type = "technology",
        icon = ei_graphics_other_path.."bio_hydrofluoric-acid.png",
        icon_size = 64,
        prerequisites = {"ei_bio-reactor"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_hydrofluoric-acid"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_bio_electronic-parts",
        type = "technology",
        icon = ei_graphics_other_path.."bio_electronic-parts.png",
        icon_size = 64,
        prerequisites = {"ei_bio_insulated-wire"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_bio_electronic-parts"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-2"],
            time = 20
        },
    },
    {
        name = "ei_personal-leg",
        type = "technology",
        icon = ei_graphics_tech_path.."personal-leg.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"military-4", "automation-3", "ei_computer-core"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-leg"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    {
        name = "ei_personal-laser",
        type = "technology",
        icon = ei_graphics_tech_path.."personal-laser.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = {"military-4", "ei_high-energy-crystal", "ei_computer-core"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_personal-laser"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_dirty-water-usage",
        type = "technology",
        icon = ei_graphics_tech_path.."dirty-water-usage.png",
        icon_size = 128,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_iron-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_copper-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lead-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_uranium-extraction"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_gold-extraction"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_cryodust",
        type = "technology",
        icon = ei_graphics_tech_2_path.."cryodust.png",
        icon_size = 128,
        prerequisites = {"ei_knowledge-computer-age-tech"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_cryodust"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_cryocondensate"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_condensed-cryodust"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_crushed-coal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["knowledge-computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    {
        name = "ei_advanced-steel",
        type = "technology",
        icon = ei_graphics_tech_path.."steel-processing.png",
        icon_size = 256,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_molten-steel__mix"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_oxygen-steel",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-steel.png",
        icon_size = 256,
        prerequisites = {"ei_advanced-steel", "ei_oxygen-gas"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_molten-steel__oxygen"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_lithium-battery",
        type = "technology",
        icon = ei_graphics_tech_path.."lithium-battery.png",
        icon_size = 256,
        prerequisites = {"processing-unit"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_battery__lithium"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_lithium-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_silicon",
        type = "technology",
        icon = ei_graphics_tech_path.."silicon.png",
        icon_size = 128,
        prerequisites = {"processing-unit"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_silicon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_monosilicon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-semiconductor__monosilicon"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_semiconductor__monosilicon"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "advanced-computer-age",
    },
    {
        name = "ei_dirty-water-production",
        type = "technology",
        icon = ei_graphics_tech_path.."dirty-water-production.png",
        icon_size = 128,
        prerequisites = {"ei_advanced-chem-plant", "ei_dirty-water-usage"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_dirty-water__stone"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["advanced-computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    {
        name = "ei_petroleum-reforming",
        type = "technology",
        icon = ei_graphics_tech_path.."petroleum-reforming.png",
        icon_size = 128,
        prerequisites = {"ei_advanced-chem-plant", "ei_ammonia"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_petroleum-reforming"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "knowledge-computer-age",
    },
    {
        name = "ei_oxygen-gas",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-lufter.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_oxygen-gas"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_liquid-oxygen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_oxygen-gas__vent"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_rocket-parts",
        type = "technology",
        icon = ei_graphics_tech_path.."rocket-parts.png",
        icon_size = 128,
        prerequisites = {"ei_rocket-control-unit", "low-density-structure", "rocketry"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_rocket-parts"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_high-energy-crystal",
        type = "technology",
        icon = ei_graphics_tech_path.."high-energy-crystal.png",
        icon_size = 128,
        prerequisites = {"ei_computer-age"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_crystal-solution"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_high-energy-crystal"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_high-energy-crystal__growing",
        type = "technology",
        icon = ei_graphics_tech_path.."high-energy-crystal-growing.png",
        icon_size = 256,
        prerequisites = {"ei_high-energy-crystal"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_high-energy-crystal__growing"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_cryo-container",
        type = "technology",
        icon = ei_graphics_tech_path.."cryo-container.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_emtpy-cryo-container"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_fill-cryo-container-nitrogen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_empty-cryo-container-nitrogen"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_oxygen-cryo-container",
        type = "technology",
        icon = ei_graphics_tech_path.."oxygen-cryo-container.png",
        icon_size = 128,
        prerequisites = {"ei_cryo-container", "ei_oxygen-gas"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_fill-cryo-container-oxygen"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_empty-cryo-container-oxygen"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_ammonia",
        type = "technology",
        icon = ei_graphics_tech_path.."ammonia.png",
        icon_size = 128,
        prerequisites = {"ei_cooler"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_ammonia"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_hydrogen"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_dinitrogen-tetroxide",
        type = "technology",
        icon = ei_graphics_tech_path.."dinitrogen-tetroxide.png",
        icon_size = 128,
        prerequisites = {"ei_ammonia", "ei_oxygen-gas"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_dinitrogen-tetroxide"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_advanced-computer-age-tech",
        type = "technology",
        icon = ei_graphics_tech_path.."simulation-computer-age-tech.png",
        icon_size = 256,
        prerequisites = {"ei_big-lab", "ei_ammonia"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_advanced-computer-age-tech"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_knowledge-computer-age-tech",
        type = "technology",
        icon = ei_graphics_tech_path.."knowledge-computer-age-tech.png",
        icon_size = 256,
        prerequisites = {"ei_big-lab", "ei_gate", "ei_bio-chamber"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_knowledge-computer-age-tech"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        name = "ei_nitric-acid",
        type = "technology",
        icon = ei_graphics_tech_path.."nitric-acid.png",
        icon_size = 128,
        prerequisites = {"ei_dinitrogen-tetroxide"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_dinitrogen-tetroxide-water-solution"
            },
            {
                type = "unlock-recipe",
                recipe = "ei_nitric-acid"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
    },
    {
        type = "technology",
        name = "ei_rocket-control-unit",
        icons = {{icon="__base__/graphics/technology/processing-unit.png", tint={r=1.0, g=1.0, b=0.0}, icon_size = 256}},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "ei_rocket-control-unit"
          }
        },
        prerequisites = {"processing-unit", "ei_high-energy-crystal"},
        unit =
        {
            count = 100,
            ingredients = ei_data.science["computer-age"],
            time = 20
        },
        age = "computer-age",
        order = "k-a"
    },
})

table.insert(data.raw["technology"]["processing-unit"].effects, {
    type = "unlock-recipe",
    recipe = "ei_advanced-semiconductor"
})

table.insert(data.raw["technology"]["processing-unit"].effects, {
    type = "unlock-recipe",
    recipe = "ei_advanced-base-semiconductor"
})

table.insert(data.raw["technology"]["speed-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["speed-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})

table.insert(data.raw["technology"]["productivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["productivity-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})

table.insert(data.raw["technology"]["efficiency-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-base"
})

table.insert(data.raw["technology"]["efficiency-module"].effects, {
    type = "unlock-recipe",
    recipe = "ei_module-part"
})

table.insert(data.raw["technology"]["ei_quantum-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_quantum-age-tech"
})

table.insert(data.raw["technology"]["ei_quantum-age"].effects, {
    type = "unlock-recipe",
    recipe = "ei_computing-unit"
})

table.insert(data.raw["technology"]["automation-3"].effects, {
    type = "unlock-recipe",
    recipe = "ei_advanced-motor"
})

table.insert(data.raw["technology"]["military-4"].effects, {
    type = "unlock-recipe",
    recipe = "ei_compound-ammo"
})

table.insert(data.raw["technology"]["ei_quantum-age"].prerequisites, "rocket-silo")
table.insert(data.raw["technology"]["ei_quantum-age"].prerequisites, "ei_sus-plating")