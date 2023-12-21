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
  player.force.research_all_technologies(true)
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