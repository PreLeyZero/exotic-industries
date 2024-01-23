--====================================================================================================
--LOCALE UPDATES
--====================================================================================================


-- get list of all fluids with fuel value
local fluids = {}
local exclude = {
    ["ei_drill-fluid"] = true,
    ["ei_liquid-nitrogen"] = true,
    ["ei_critical-steam"] = true
}
local max_chars = 200 - 25

for fluid_name, fluid in pairs(data.raw["fluid"]) do
    if fluid.fuel_value then
        if exclude[fluid_name] then goto continue end

        table.insert(fluids, fluid_name)
    end
    ::continue::
end
local icon_table = ""
-- make list of all fluid icons
for _, fluid_name in ipairs(fluids) do
    new_icon_table = icon_table.."[fluid="..fluid_name.."]"
    if string.len(new_icon_table) > max_chars then
        break
    end
    icon_table = new_icon_table

end

data.raw["item"]["ei_fluid-boiler"].localised_description = {
    "",
    {"item-description.ei_fluid-boiler"},
    icon_table
}
data.raw["item"]["ei_fluid-heater"].localised_description = {
    "",
    {"item-description.ei_fluid-heater"},
    icon_table
}

-- most entities of EI and also vanilla dont have their own description, just their items
-- therefore align them

-- if there is an entity matching an item, and the entity has no description, copy the item description
for item_name, item in pairs(data.raw["item"]) do

    if item.place_result then

        -- type is entity type, so assembling-machine, rocket-silo, container, 
        local possible_types = {
            "assembling-machine",
            "rocket-silo",
            "container",
            "mining-drill"
        }

        local entity = nil
        for i,v in ipairs(possible_types) do
            if data.raw[v][item.place_result] then
                entity = data.raw[v][item.place_result]

                if not entity then goto continue end
                if not item.localised_description then goto continue end
                -- if entity.localised_description then goto continue end
                data.raw[v][item.place_result].localised_description = item.localised_description

                log("copied description from item "..item_name.." to entity "..item.place_result)

                goto continue
            end
        end

        ::continue::

    end

end
