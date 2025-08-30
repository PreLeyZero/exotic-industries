-- set all currentlly existing main menu simulations to be nil
-- make EI main menu simulation

--====================================================================================================
--MAIN MENU SIMULATIONS
--====================================================================================================

local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations
local util = require("__core__.lualib.util")
local foo = false
if tonumber(util.split(mods["base"], ".")[3]) >= 77 then
  foo = true
end

-- remove all existing main menu simulations
for i,v in pairs(main_menu_simulations) do
    main_menu_simulations[i] = nil
end

-- if K2 is enabled then use the K2 main menu simulation
if mods["Krastorio2"] and mods["exotic-industries-trains"] then
  data.raw["utility-constants"]["default"].main_menu_simulations.ei_k2_menu =
  {
  checkboard = false,
  save = ei_graphics_menu_path.."ei_k2_menu.zip",
  length = 60*60*10,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "iron-chest", limit = 1}[1]  
    game.simulation.camera_position = {logo.position.x, logo.position.y}
    game.simulation.camera_zoom = 0.7
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
  }

  return
end


-- add EI main menu simulation
data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_1 =
{
  checkboard = false,
  save = ei_graphics_menu_path.."ei_menu_1.zip",
  length = 60*30,
  init = [[
    local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-22tiles", limit = 1}[1]  
    game.simulation.camera_position = {logo.position.x, logo.position.y + 7}
    game.simulation.camera_zoom = 1
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1
  ]],
}

-- simulations when exotic-industries-containers is enabled
if mods["exotic-industries-containers"] then
  if foo == true then
  data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_2 =
  {
    checkboard = false,
    save = ei_graphics_menu_path.."ei_menu_2.zip",
    length = 60*30,
    init = [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
      game.simulation.camera_position = {logo.position.x, logo.position.y - 9}
      game.simulation.camera_zoom = 1
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 1
    ]],
  }
  end

  data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_3 =
  {
    checkboard = false,
    save = ei_graphics_menu_path.."ei_menu_3.zip",
    length = 60*30,
    init = [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
      game.simulation.camera_position = {logo.position.x, logo.position.y}
      game.simulation.camera_zoom = 0.7
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 1
    ]],
  }
end

if mods["exotic-industries-containers"] then
  if mods["exotic-industries-robots"] then
    if foo == true then
    data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_5 =
    {
      checkboard = false,
      save = ei_graphics_menu_path.."ei_menu_5.zip",
      length = 60*30,
      init = [[
        local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]  
        game.simulation.camera_position = {logo.position.x, logo.position.y}
        game.simulation.camera_zoom = 0.7
        game.tick_paused = false
        game.surfaces.nauvis.daytime = 1
      ]],
    }
    end
  end
end

if foo == true then
-- simulations when exotic-industries-tanks is enabled
if mods["exotic-industries-tanks"] then
  data.raw["utility-constants"]["default"].main_menu_simulations.ei_menu_4 =
  {
    checkboard = false,
    save = ei_graphics_menu_path.."ei_menu_4.zip",
    length = 60*30,
    init = [[
      local logo = game.surfaces.nauvis.find_entities_filtered{name = "factorio-logo-22tiles", limit = 1}[1]  
      game.simulation.camera_position = {logo.position.x, logo.position.y}
      game.simulation.camera_zoom = 0.85
      game.tick_paused = false
      game.surfaces.nauvis.daytime = 1
    ]],
  }
end

end