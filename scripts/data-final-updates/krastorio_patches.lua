-- changes to K2 mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")
local _td = table.deepcopy

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["Krastorio2"] then
    return
end

--====================================================================================================
--ITEM-ENTITY CHANGES
--====================================================================================================

data.raw["storage-tank"]["ei_tank-1"].fluid_box.base_area = 1200
data.raw["storage-tank"]["ei_tank-2"].fluid_box.base_area = 4000
data.raw["storage-tank"]["ei_tank-3"].fluid_box.base_area = 1200
data.raw.item["storage-tank"].order = "z-b[fluid]-a[storage-tank]"
data.raw.item["kr-fluid-storage-1"].order = "z-b[fluid]-b[kr-fluid-storage-1]"
data.raw.item["ei_tank-1"].order = "z-b[fluid]-c[ei_tank-1]"
data.raw.item["ei_tank-3"].order = "z-b[fluid]-d[ei_tank-3]"
data.raw.item["kr-fluid-storage-2"].order = "z-b[fluid]-e[kr-fluid-storage-2]"
data.raw.item["ei_tank-2"].order = "z-b[fluid]-f[ei_tank-2]"
data.raw.item["ei_insulated-tank"].order = "z-b[fluid]-g[ei_insulated-tank]"

local ei_medium_container, ei_big_container = 200, 1000
data.raw["container"]["kr-medium-container"].inventory_size = ei_medium_container
data.raw["logistic-container"]["kr-medium-active-provider-container"].inventory_size = ei_medium_container
data.raw["logistic-container"]["kr-medium-buffer-container"].inventory_size = ei_medium_container
data.raw["logistic-container"]["kr-medium-passive-provider-container"].inventory_size = ei_medium_container
data.raw["logistic-container"]["kr-medium-requester-container"].inventory_size = ei_medium_container
data.raw["logistic-container"]["kr-medium-storage-container"].inventory_size = ei_medium_container
data.raw["container"]["kr-big-container"].inventory_size = ei_big_container
data.raw["logistic-container"]["kr-big-active-provider-container"].inventory_size = ei_big_container
data.raw["logistic-container"]["kr-big-buffer-container"].inventory_size = ei_big_container
data.raw["logistic-container"]["kr-big-passive-provider-container"].inventory_size = ei_big_container
data.raw["logistic-container"]["kr-big-requester-container"].inventory_size = ei_big_container
data.raw["logistic-container"]["kr-big-storage-container"].inventory_size = ei_big_container

data.raw.recipe["kr-medium-container"].subgroup = "kr-logistics-2" 
data.raw.recipe["kr-big-container"].subgroup = "kr-logistics-3"

data.raw.item["kr-medium-container"].order = "a"
data.raw.item["kr-medium-active-provider-container"].order = "g"
data.raw.item["kr-medium-buffer-container"].order = "f"
data.raw.item["kr-medium-passive-provider-container"].order = "c"
data.raw.item["kr-medium-requester-container"].order = "e"
data.raw.item["kr-medium-storage-container"].order = "d"
data.raw.item["kr-big-container"].order = "a"
data.raw.item["kr-big-active-provider-container"].order = "g"
data.raw.item["kr-big-buffer-container"].order = "f"
data.raw.item["kr-big-passive-provider-container"].order = "c"
data.raw.item["kr-big-requester-container"].order = "e"
data.raw.item["kr-big-storage-container"].order = "d"

data.raw.recipe["kr-medium-container"].order = "a"
data.raw.recipe["kr-medium-active-provider-container"].order = "g"
data.raw.recipe["kr-medium-buffer-container"].order = "f"
data.raw.recipe["kr-medium-passive-provider-container"].order = "c"
data.raw.recipe["kr-medium-requester-container"].order = "e"
data.raw.recipe["kr-medium-storage-container"].order = "d"
data.raw.recipe["kr-big-container"].order = "a"
data.raw.recipe["kr-big-active-provider-container"].order = "g"
data.raw.recipe["kr-big-buffer-container"].order = "f"
data.raw.recipe["kr-big-passive-provider-container"].order = "c"
data.raw.recipe["kr-big-requester-container"].order = "e"
data.raw.recipe["kr-big-storage-container"].order = "d"

local ei_neo_speed = data.raw["transport-belt"]["transport-belt"].speed * 8
data.raw["transport-belt"]["ei_neo-belt"].speed = ei_neo_speed
data.raw["underground-belt"]["ei_neo-underground-belt"].speed = ei_neo_speed
data.raw["splitter"]["ei_neo-splitter"].speed = ei_neo_speed
data.raw["loader-1x1"]["ei_neo-loader"].speed = ei_neo_speed
data.raw.item["ei_neo-belt"].order = "a[transport-belt]-f[ei_neo-belt]"
data.raw.item["ei_neo-underground-belt"].order = "b[underground-belt]-f[ei_neo-underground-belt]"
data.raw.item["ei_neo-splitter"].order = "c[splitter]-f[ei_neo-splitter]"
data.raw["underground-belt"]["ei_neo-underground-belt"].max_distance = 50

data.raw.item["ei_loader"].order = "h[ei_loader]-a[ei_loader]"
data.raw.item["ei_fast-loader"].order = "h[ei_loader]-b[ei_fast-loader]"
data.raw.item["ei_express-loader"].order = "h[ei_loader]-c[ei_express-loader]"
data.raw.item["ei_neo-loader"].order = "h[ei_loader]-f[ei_neo-loader]"

local kr_neo_loader = _td(data.raw["loader-1x1"]["kr-loader"])
kr_neo_loader.name = "kr-neo-loader"
kr_neo_loader.minable.result = kr_neo_loader.name
kr_neo_loader.speed = ei_neo_speed

local ei_loader = _td(data.raw["loader-1x1"]["ei_loader"])
local ei_advanced_loader = _td(ei_loader)
ei_advanced_loader.name = "ei_advanced-loader"
ei_advanced_loader.minable.result = ei_advanced_loader.name
ei_advanced_loader.speed = ei_loader.speed * 4
local ei_superior_loader = _td(ei_loader)
ei_superior_loader.name = "ei_superior-loader"
ei_superior_loader.minable.result = ei_superior_loader.name
ei_superior_loader.speed = ei_loader.speed * 6

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

kr_neo_loader.type = "recipe"
ei_advanced_loader.type = "recipe"
ei_superior_loader.type = "recipe"
kr_neo_loader.result = kr_neo_loader.name
ei_advanced_loader.result = ei_advanced_loader.name
ei_superior_loader.result = ei_superior_loader.name
kr_neo_loader.ingredients = {{"kr-superior-loader", 2}}
ei_advanced_loader.ingredients = {{"ei_express-loader", 2}}
ei_superior_loader.ingredients = {{"ei_advanced-loader", 2}}

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

kr_neo_loader.type = "item"
ei_advanced_loader.type = "item"
ei_superior_loader.type = "item"
kr_neo_loader.place_result = kr_neo_loader.name
ei_advanced_loader.place_result = ei_advanced_loader.name
ei_superior_loader.place_result = ei_superior_loader.name
kr_neo_loader.flags = nil
ei_advanced_loader.flags = nil
ei_superior_loader.flags = nil
kr_neo_loader.stack_size = 50
ei_advanced_loader.stack_size = 50
ei_superior_loader.stack_size = 50
kr_neo_loader.subgroup = "belt"
ei_advanced_loader.subgroup = "belt"
ei_superior_loader.subgroup = "belt"
kr_neo_loader.order = "d[loader]-a6[kr-neo-loader]"
ei_advanced_loader.order = "h[ei_loader]-d[ei_advanced-loader]"
ei_superior_loader.order = "h[ei_loader]-e[ei_superior-loader]"

data:extend({ _td(kr_neo_loader), _td(ei_advanced_loader), _td(ei_superior_loader) })

data.raw["loader-1x1"]["ei_loader"].filter_count = 5
data.raw["loader-1x1"]["ei_fast-loader"].filter_count = 5
data.raw["loader-1x1"]["ei_express-loader"].filter_count = 5
data.raw["loader-1x1"]["ei_advanced-loader"].filter_count = 5
data.raw["loader-1x1"]["ei_superior-loader"].filter_count = 5
data.raw["loader-1x1"]["ei_neo-loader"].filter_count = 5

ei_lib.add_item_level("kr-superior-filter-inserter", "filter")
ei_lib.add_item_level("kr-superior-long-filter-inserter", "filter")


--====================================================================================================
--RECIPE-TECH CHANGES
--====================================================================================================

-- set crafting categories of express splitter, belt, underground belt to crafting with fluid
data.raw.recipe["express-splitter"].category = "crafting-with-fluid"
data.raw.recipe["express-transport-belt"].category = "crafting-with-fluid"
data.raw.recipe["express-underground-belt"].category = "crafting-with-fluid"