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
    {"ei_iron-beam", 4},
    {"pipe", 2},
    {"ei_copper-beam", 2},
})

ei_lib.recipe_new("duct-underground", {
    {"ei_iron-beam", 6},
    {"duct-small", 10},
    {"ei_copper-beam", 6},
})

ei_lib.recipe_new("duct-t-junction", {
    {"ei_iron-beam", 2},
    {"duct-small", 1},
    {"ei_copper-beam", 2},
})

ei_lib.recipe_new("duct-curve", {
    {"ei_iron-beam", 2},
    {"duct-small", 1},
    {"ei_copper-beam", 2},
})

ei_lib.recipe_new("duct-cross", {
    {"ei_iron-beam", 2},
    {"duct-small", 1},
    {"ei_copper-beam", 2},
})

ei_lib.recipe_new("non-return-duct", {
    {"pump", 2},
    {"duct-small", 2},
    {"ei_iron-mechanical-parts", 4},
})

ei_lib.recipe_new("duct-end-point-intake", {
    {"pump", 4},
    {"duct-small", 2},
    {"ei_iron-mechanical-parts", 10},
    {"electronic-circuit", 2},
})

ei_lib.recipe_new("duct-end-point-outtake", {
    {"pump", 4},
    {"duct-small", 2},
    {"ei_copper-mechanical-parts", 10},
    {"electronic-circuit", 2},
})