-- set all currentlly existing main menu simulations to be nil
-- make EI main menu simulation

--====================================================================================================
--MAIN MENU SIMULATIONS
--====================================================================================================

local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

-- remove all existing main menu simulations
for i,v in pairs(main_menu_simulations) do
    main_menu_simulations[i] = nil
end

-- add EI main menu simulation
data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_1 =
{
  checkboard = false,
  save = ei_graphics_menu_path.."ei_menu_1.zip",
  length = 60*30,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-22tiles", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y + 7}
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}

-- simulations when exotic-industries-containers is enabled
if mods["exotic-industries-containers"] then
  data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_2 =
  {
    checkboard = false,
    save = ei_graphics_menu_path.."ei_menu_2.zip",
    length = 60*30,
    init = [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
      game.camera_position = {logo.position.x, logo.position.y - 9}
      game.camera_zoom = 1
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 1
    ]],
  }

  data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_3 =
  {
    checkboard = false,
    save = ei_graphics_menu_path.."ei_menu_3.zip",
    length = 60*30,
    init = [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
      game.camera_position = {logo.position.x, logo.position.y}
      game.camera_zoom = 0.7
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 1
    ]],
  }
end