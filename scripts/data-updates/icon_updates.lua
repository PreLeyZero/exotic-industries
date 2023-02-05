--====================================================================================================
--ICON UPDATES
--====================================================================================================

local function add_item_level(item, level)

    -- add level overlay to item icon

    local item = data.raw.item[item]

    if not item then
        return
    end

    if not item.icon then
        return
    end

    if not item.icon_size or item.icon_size ~= 64 then
        return
    end

    local current_icon = item.icon

    item.icons = {
        {
            icon = current_icon,
            icon_size = 64,
        },
        {
            icon = ei_graphics_other_path.."overlay_"..level..".png",
            icon_size = 64,
        }
    }

    item.icon = nil
    item.icon_size = nil

end


local level_table = {
    ["1"] = {
        "ei_deep-drill",
        "assembling-machine-1",
        "ei_copper-beacon",
        "solar-panel",
        "electric-mining-drill",
        "ei_crusher",
        "chemical-plant",
    },
    ["2"] = {
        "ei_advanced-deep-drill",
        "assembling-machine-2",
        "ei_iron-beacon",
        "ei_solar-panel-2",
        "ei_advanced-electric-mining-drill",
        "ei_advanced-crusher",
        "ei_advanced-chem-plant",
    },
    ["3"] = {
        "assembling-machine-3",
        "ei_solar-panel-3",
        "ei_superior-electric-mining-drill",
    },
    ["4"] = {
        "ei_neo-assembler",
    },   
}

for level, items in pairs(level_table) do
    for _, item in ipairs(items) do
        add_item_level(item, level)
    end
end