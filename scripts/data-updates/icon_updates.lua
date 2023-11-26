--====================================================================================================
--ITEM ICON UPDATES
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
        "ei_heat-chemical-plant",
        "oil-refinery",
        "ei_destill-tower",
        "centrifuge",
    },
    ["2"] = {
        "ei_advanced-deep-drill",
        "assembling-machine-2",
        "ei_iron-beacon",
        "ei_solar-panel-2",
        "ei_advanced-electric-mining-drill",
        "ei_advanced-crusher",
        "chemical-plant",
        "ei_advanced-refinery",
        "ei_advanced-destill-tower",
        "ei_advanced-centrifuge"
    },
    ["3"] = {
        "assembling-machine-3",
        "ei_solar-panel-3",
        "ei_superior-electric-mining-drill",
        "ei_advanced-chem-plant",
    },
    ["4"] = {
        "ei_neo-assembler",
    },
    ["filter"] = {
        "ei_small-inserter",
        "ei_big-inserter",
        "filter-inserter",
        "stack-filter-inserter",
    }   
}

for level, items in pairs(level_table) do
    for _, item in ipairs(items) do
        add_item_level(item, level)
    end
end

--====================================================================================================
--TECH ICON UPDATES
--====================================================================================================

-- add an icon to all techs that have the age property and thus count for age progression
-- we need to handle techs with icon or icons property here

local function add_tech_icon(tech)

    local icons = tech.icons or {
        {
            icon = tech.icon,
            icon_size = tech.icon_size,
        }
    }

    -- add overlay
    table.insert(icons, {
        icon = ei_graphics_other_path.."tech_overlay.png",
        icon_size = 64,
        shift = {-100, 100},
    })

    tech.icons = icons

    -- remove old icon if present
    tech.icon = nil

end


local function add_recipe_icon(tech)

    if not data.raw.technology[tech].effects then
        data.raw.technology[tech].effects = {}
    end

    table.insert(data.raw.technology[tech].effects, {
        type = "nothing",
        effect_description = {"description.tech-counts-for-age-progression"},
        infer_icon = false,
        icon_size = 64,
        icon = ei_graphics_other_path.."tech_overlay.png",
    })

end


for tech_name, tech in pairs(data.raw.technology) do

    if tech.age then
        -- add_tech_icon(tech)

        add_recipe_icon(tech_name)
    end

end
