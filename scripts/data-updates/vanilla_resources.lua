-- Reorder vanilla resources to match exotic industries progression.
-- Uranium-ore, Stone-ore will get removed from auto-generated resources.

-- resources to remove
local remove_resource = {
    "uranium-ore",
    "stone"
}

--====================================================================================================
--REMOVE RESOURCES FROM AUTOPLACE
--====================================================================================================

-- remove autoplace in prototypes and data.raw
for i,v in ipairs(remove_resource) do
    data.raw["resource"][v].autoplace = nil
    data.raw["autoplace-control"][v] = nil

    log("Removed autoplace for " .. v)
end

-- fix map-gen-presets by removing autoplace-control
-- note there can only be one map-gen-presets
for i,v in pairs(data.raw["map-gen-presets"].default) do

    -- check if basic_settings is set
    if v.basic_settings then

        -- check if autoplace-controls is set
        if v.basic_settings.autoplace_controls then

            -- loop over and search for remove_resource
            for x,y in pairs(data.raw["map-gen-presets"].default[i].basic_settings.autoplace_controls) do
                for z,w in ipairs(remove_resource) do

                    -- check if resource is found
                    if x == w then

                        -- remove resource
                        data.raw["map-gen-presets"].default[i].basic_settings.autoplace_controls[x] = nil
                        log("Removed autoplace-control for " .. w .. " in map-gen-presets: ".. i)
                    end
                end
            end
        end
    end
end
