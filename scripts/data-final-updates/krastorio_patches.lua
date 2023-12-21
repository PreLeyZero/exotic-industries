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

--CONSTANTS
------------------------------------------------------------------------------------------------------
local ei_medium_container, ei_big_container = 200, 1000
local ei_neo_speed = data.raw["transport-belt"]["transport-belt"].speed * 8

--====================================================================================================
--NEW PROTOTYPES
--====================================================================================================

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

ei_lib.add_item_level("kr-superior-filter-inserter", "filter")
ei_lib.add_item_level("kr-superior-long-filter-inserter", "filter")

--====================================================================================================
-- CHANGES
--====================================================================================================

local K2_CHANGES = {
    ["storage-tank"] = {
        ["ei_tank-1"] = {fluid_box = { base_area = 1200 }},
        ["ei_tank-2"] = {fluid_box = { base_area = 4000 }},
        ["ei_tank-3"] = {fluid_box = { base_area = 1200 }},
    },
    ["container"] = {
        ["kr-medium-container"] = {inventory_size = ei_medium_container},
        ["kr-big-container"] = {inventory_size = ei_big_container},
    },
    ["logistic-container"] = {
        ["kr-big-active-provider-container"] = {inventory_size = ei_big_container},
        ["kr-big-buffer-container"] = {inventory_size = ei_big_container},
        ["kr-big-passive-provider-container"] = {inventory_size = ei_big_container},
        ["kr-big-requester-container"] = {inventory_size = ei_big_container},
        ["kr-big-storage-container"] = {inventory_size = ei_big_container},
        ["kr-medium-active-provider-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-buffer-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-passive-provider-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-requester-container"] = {inventory_size = ei_medium_container},
        ["kr-medium-storage-container"] = {inventory_size = ei_medium_container},
    },
    ["loader-1x1"] = {
        ["ei_loader"] = {filter_count = 5},
        ["ei_fast-loader"] = {filter_count = 5},
        ["ei_express-loader"] = {filter_count = 5},
        ["ei_advanced-loader"] = {filter_count = 5},
        ["ei_superior-loader"] = {filter_count = 5},
        ["ei_neo-loader"] = {filter_count = 5, speed = ei_neo_speed},
    },
    ["transport-belt"] = {
        ["ei_neo-belt"] = {speed = ei_neo_speed},
    },
    ["underground-belt"] = {
        ["ei_neo-underground-belt"] = {speed = ei_neo_speed, max_distance = 50},
    },
    ["splitter"] = {
        ["ei_neo-splitter"] = {speed = ei_neo_speed},
    },
    ["item"] = {
        ["ei_express-loader"] = {order = "h[ei_loader]-c[ei_express-loader]"},
        ["ei_fast-loader"] = {order = "h[ei_loader]-b[ei_fast-loader]"},
        ["ei_insulated-tank"] = {order = "z-b[fluid]-g[ei_insulated-tank]"},
        ["ei_loader"] = {order = "h[ei_loader]-a[ei_loader]"},
        ["ei_neo-belt"] = {order = "a[transport-belt]-f[ei_neo-belt]"},
        ["ei_neo-loader"] = {order = "h[ei_loader]-f[ei_neo-loader]"},
        ["ei_neo-splitter"] = {order = "c[splitter]-f[ei_neo-splitter]"},
        ["ei_neo-underground-belt"] = {order = "b[underground-belt]-f[ei_neo-underground-belt]"},
        ["ei_tank-1"] = {order = "z-b[fluid]-c[ei_tank-1]"},
        ["ei_tank-2"] = {order = "z-b[fluid]-f[ei_tank-2]"},
        ["ei_tank-3"] = {order = "z-b[fluid]-d[ei_tank-3]"},
        ["kr-big-active-provider-container"] = {order = "g"},
        ["kr-big-buffer-container"] = {order = "f"},
        ["kr-big-container"] = {order = "a"},
        ["kr-big-passive-provider-container"] = {order = "c"},
        ["kr-big-requester-container"] = {order = "e"},
        ["kr-big-storage-container"] = {order = "d"},
        ["kr-fluid-storage-1"] = {order = "z-b[fluid]-b[kr-fluid-storage-1]"},
        ["kr-fluid-storage-2"] = {order = "z-b[fluid]-e[kr-fluid-storage-2]"},
        ["kr-medium-active-provider-container"] = {order = "g"},
        ["kr-medium-buffer-container"] = {order = "f"},
        ["kr-medium-container"] = {order = "a"},
        ["kr-medium-passive-provider-container"] = {order = "c"},
        ["kr-medium-requester-container"] = {order = "e"},
        ["kr-medium-storage-container"] = {order = "d"},
        ["storage-tank"] = {order = "z-b[fluid]-a[storage-tank]"},
    },
    ["recipe"] = {
        ["express-splitter"] = {category = "crafting-with-fluid"},
        ["express-transport-belt"] = {category = "crafting-with-fluid"},
        ["express-underground-belt"] = {category = "crafting-with-fluid"},
        ["kr-big-active-provider-container"] = {order = "g"},
        ["kr-big-buffer-container"] = {order = "f"},
        ["kr-big-container"] = {order = "a", subgroup = "kr-logistics-3"},
        ["kr-big-passive-provider-container"] = {order = "c"},
        ["kr-big-requester-container"] = {order = "e"},
        ["kr-big-storage-container"] = {order = "d"},
        ["kr-medium-active-provider-container"] = {order = "g"},
        ["kr-medium-buffer-container"] = {order = "f"},
        ["kr-medium-container"] = {order = "a", subgroup = "kr-logistics-2"},
        ["kr-medium-passive-provider-container"] = {order = "c"},
        ["kr-medium-requester-container"] = {order = "e"},
        ["kr-medium-storage-container"] = {order = "d"},
    },
    ["technology"] = {},
}

for source, group in pairs(K2_CHANGES) do
    for name, object in pairs(group) do
        object.name = name
        object.type = source
        ei_lib.set_properties(object)
    end
end