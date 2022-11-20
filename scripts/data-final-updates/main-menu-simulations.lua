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
  length = 60*25,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-22tiles", limit = 1}[1]  
    game.camera_position = {logo.position.x, logo.position.y + 7}
    game.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}