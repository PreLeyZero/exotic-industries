local model = {}

-- command '/discover'
function model.discover_tech_tree(event)
  if event.command ~= "discover" then
    return
  end

  if not event.player_index then
    return
  end

  local player = game.get_player(event.player_index)

  if not player.admin then
    return
  end

  game.print("Discovering technology tree")
  -- so that we dont research hidden stuff from compats
  player.force.research_all_technologies(false)

  -- manually add the from EI hidden ones
  local techs = {"ei_steam-age", "ei_electricity-age", "ei_computer-age", "ei_quantum-age", "ei_exotic-age", "ei_black-hole-exploration", "ei_black-hole"}
  for _, tech in pairs(techs) do player.force.technologies[tech].researched = true end
end

-- command '/tp SURFACE_NAME_OR_INDEX'
function model.teleport_to(event)
  if event.command ~= 'tp' then
    return
  end

  if not event.parameters then
    return
  end

  if not event.player_index then
    return
  end

  local player = game.get_player(event.player_index)

  if not player.admin then
    return
  end

  local destination = game.get_surface(event.parameters)

  if destination == nil then
    return
  end

  game.print("Teleporting")
  player.teleport({0,0}, destination)
end

return model