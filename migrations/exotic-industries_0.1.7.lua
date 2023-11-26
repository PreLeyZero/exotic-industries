-- fix techs
for _, force in pairs(game.forces) do
    force.reset_recipes()
    force.reset_technologies()
    force.reset_technology_effects()
end

game.print("Exotic Industries 0.1.7 migration complete")
