ei_data = require("lib/data")

--====================================================================================================
--CHARGED GRENADE
--====================================================================================================

data:extend({
    {
        name = "ei_charged-grenade",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients = {
            {type = "item", name = "ei_energy-crystal", amount = 2},
            {type = "item", name = "ei_ceramic", amount = 4},
            {type = "item", name = "grenade", amount = 2},
        },
        results = {
            {type = "item", name = "ei_charged-grenade", amount = 1},
        },
        always_show_made_in = true,
        enabled = false,
        main_product = "ei_charged-grenade",
    },
    {
        name = "ei_charged-grenade",
        type = "technology",
        icon = ei_graphics_tech_path.."charged-grenade.png",
        icon_size = 256/2,
        prerequisites = {"ei_grower", "stronger-explosives-2"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "ei_charged-grenade"
            },
        },
        unit = {
            count = 100,
            ingredients = ei_data.science["electricity-age"],
            time = 20
        },
        age = "electricity-age",
    },
})


local ei_explosion = table.deepcopy(data.raw['explosion']['grenade-explosion'])
ei_explosion.name = 'ei_charged-grenade-explosion'
local ei_grenade = table.deepcopy(data.raw['projectile']['grenade'])
ei_grenade.name = 'ei_charged-grenade'

ei_grenade.action = {
  {
    type = 'direct',
    action_delivery = {
      type = 'instant',
      target_effects = {
        {
          type = 'create-entity',
          entity_name = 'ei_charged-grenade-explosion',
          trigger_created_entity = true
        }
      }
    }
  },
  ---note here
  {
    type = 'cluster',
    cluster_count = 16,
    distance = 7.5,
    distance_deviation = 1,
    action_delivery = {
        {
            type = 'beam',
            add_to_shooter = false,
            duration = 15,
            beam = 'electric-beam-no-sound',
            max_length = 16,
            source_offset = {0, -0.5}
        }
    }
  },
  {
    type = 'area',
    radius = 7.5,
    force = 'not-same',
    action_delivery = {
      {
        type = 'instant',
        target_effects = {
          {
            type = 'damage',
            damage = {
              amount = 20,
              type = 'explosion'
            }
          },
          {
            type = 'create-sticker',
            sticker = 'stun-sticker'
          },
          {
            type = "push-back",
            distance = 4
          }
        }
      }
    }
  }
}

local ei_capsule = table.deepcopy(data.raw['capsule']['grenade'])
ei_capsule.name = 'ei_charged-grenade'
ei_capsule.icon_size = 64
ei_capsule.icon = ei_graphics_item_path.."charged-grenade.png"
ei_capsule.order = "a[grenade]-c[ei_charged-grenade]"

ei_capsule.capsule_action.attack_parameters.ammo_type.action[3] = {
    type = "direct",
    action_delivery =
    {
      type = "projectile",
      projectile = "ei_charged-grenade",
      starting_speed = 0.3
    }
}

data:extend{ei_explosion, ei_grenade, ei_capsule}