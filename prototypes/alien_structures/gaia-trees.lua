--====================================================================================================
--TREES FOR GAIA
--====================================================================================================


--HELPER FUNCTIONS
------------------------------------------------------------------------------------------------------

local function make_tree(number, autoplace, colors)

    local tree = table.deepcopy(data.raw["tree"]["tree-"..number])

    tree.name = "ei_gaia-tree-"..number

    -- look through leaves for variation and swap leaves for gaia leaves
    for i,v in ipairs(tree.variations) do

        -- look into tree.variations.leaves.filename and swap path for ei path
        -- filename = "__base__/graphics/entity/tree/01/tree-01-b-leaves.png"
        -- new_filename = ei_graphics_tree_path..number/tree-01-b-leaves.png"
        -- -> cut "__base__/graphics/entity/tree/ and add ei_graphics_tree_path

        local filename = string.sub(v.leaves.filename, 31)
        filename = filename:gsub("/tree%-", "/hr-tree-")
        tree.variations[i].leaves.filename = ei_graphics_tree_path..filename
    end

    if autoplace then
        tree.autoplace = autoplace
    end

    if colors then
        tree.colors = colors
    else
        tree.colors = {
            {
                b = 225,
                g = 255,
                r = 255
            },
            {
                b = 170,
                g = 130,
                r = 200
            },
            {
                b = 227,
                g = 215,
                r = 216
            },
            {
                b = 180,
                g = 209,
                r = 221
            },
            {
                b = 190,
                g = 242,
                r = 231
            },
            {
                b = 138,
                g = 185,
                r = 83
            },
            {
                b = 34,
                g = 70,
                r = 201
            },
            {
                b = 41,
                g = 242,
                r = 230
            }
        }
    end

    data:extend({tree})

end

--MAIN
------------------------------------------------------------------------------------------------------

make_tree("01")
make_tree("02")
make_tree("05")
--[[
make_tree("09", {
    data.raw["tree"]["tree-05"].autoplace
    {
        b = 180,
        g = 235,
        r = 215
    },
    {
        b = 215,
        g = 175,
        r = 215
    },
    {
        b = 205,
        g = 205,
        r = 205
    },
    {
        b = 195,
        g = 195,
        r = 195
    },
    {
        b = 185,
        g = 185,
        r = 185
    },
    {
        b = 175,
        g = 175,
        r = 175
    },
    {
        b = 235,
        g = 235,
        r = 235
    },
    {
        b = 225,
        g = 255,
        r = 255
    }
})
]]