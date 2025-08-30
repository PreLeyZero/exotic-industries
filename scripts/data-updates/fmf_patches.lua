-- changes to FMF mod

local ei_lib = require("lib/lib")
local ei_data = require("lib/data")

--====================================================================================================
--CHECK FOR MOD
--====================================================================================================

if not mods["FluidMustFlow"] then
    return
end

--====================================================================================================
--CHANGES
--====================================================================================================
ei_lib.recipe_new("duct-small", {
    {type="item", name="ei_iron-beam", amount=4},
    {type="item", name="pipe", amount=2},
    {type="item", name="ei_copper-beam", amount=2},
})

ei_lib.recipe_new("duct-underground", {
    {type="item", name="ei_iron-beam", amount=6},
    {type="item", name="duct-small", amount=10},
    {type="item", name="ei_copper-beam", amount=6},
})

ei_lib.recipe_new("duct-t-junction", {
    {type="item", name="ei_iron-beam", amount=2},
    {type="item", name="duct-small", amount=1},
    {type="item", name="ei_copper-beam", amount=2},
})

ei_lib.recipe_new("duct-curve", {
    {type="item", name="ei_iron-beam", amount=2},
    {type="item", name="duct-small", amount=1},
    {type="item", name="ei_copper-beam", amount=2},
})

ei_lib.recipe_new("duct-cross", {
    {type="item", name="ei_iron-beam", amount=2},
    {type="item", name="duct-small", amount=1},
    {type="item", name="ei_copper-beam", amount=2},
})

ei_lib.recipe_new("non-return-duct", {
    {type="item", name="pump", amount=2},
    {type="item", name="duct-small", amount=2},
    {type="item", name="ei_iron-mechanical-parts", amount=4},
})

ei_lib.recipe_new("duct-end-point-intake", {
    {type="item", name="pump", amount=4},
    {type="item", name="duct-small", amount=2},
    {type="item", name="ei_iron-mechanical-parts", amount=10},
    {type="item", name="electronic-circuit", amount=2},
})

ei_lib.recipe_new("duct-end-point-outtake", {
    {type="item", name="pump", amount=4},
    {type="item", name="duct-small", amount=2},
    {type="item", name="ei_copper-mechanical-parts", amount=10},
    {type="item", name="electronic-circuit", amount=2},
})