--====================================================================================================
--LOCALE UPDATES
--====================================================================================================

-- manual updates
-- [key] = source, value = target
local to_mirror = {
    --["ei_deep-drill"] = "ei_advanced-deep-drill",
}

for i,v in pairs(to_mirror) do
    data.raw["item"][v].localised_description = data.raw["item"][tostring(i)].localised_description
end

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
            end
        end

        if not entity then goto continue end
        if not item.localised_description then goto continue end
        if entity.localised_description then goto continue end

        entity.localised_description = table.deepcopy(item.localised_description)
        log("Mirrored locale description from "..item_name.." (item) to "..entity.name.." (entity)")

        ::continue::

    end

end
