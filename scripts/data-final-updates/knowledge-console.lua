--[[
Update the whitelist for selection-tool/ei_scanner
]]
local ei_data = require("lib/data")
local ei_lib = require("lib/lib")


-- REVISIT: categories under which entities can be defined
local cats = {
  "assembling-machine",
  "beacon",
  "container",
  "electric-energy-interface",
  "electric-pole",
  "simple-entity",
}

local function has_scanner_points(name)
  -- TODO: trim number and dash instead of using str_startswith()?
  for vv, _ in pairs(ei_data.scanner_values) do
    if ei_lib.starts_with(name, vv) then
      return true
    end
  end
  return false
end

local entity_filters = {}
for _, cat in ipairs(cats) do
  local info = data.raw[cat]
  for name, _ in pairs(info) do
    if has_scanner_points(name) then
      table.insert(entity_filters, name)
    end
  end
end

local ei_scanner = data.raw['selection-tool']['ei_scanner']
ei_scanner.entity_filter_mode = "whitelist"
ei_scanner.entity_filters = entity_filters
