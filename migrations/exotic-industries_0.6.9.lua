local ei_tech_scaling = require("scripts/control/tech_scaling")

-- fix techs
for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end

-- recalc new total tech count
ei_tech_scaling.init()

if not storage.gaia_surfaces then storage.gaia_surfaces = {} end
storage.gaia_surfaces["gaia"] = true

game.print("Exotic Industries 0.6.9 migration complete")