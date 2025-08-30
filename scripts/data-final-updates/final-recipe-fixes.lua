-- fix recipes that are broken due to patches

local ei_data = require("lib/data")
local ei_lib = require("lib/lib")

--====================================================================================================
--FINAL RECIPE FIXES
--====================================================================================================

-- loop over all recipes and apply fix_recipe
for i,v in pairs(data.raw.recipe) do
    -- get mode of recipe

	ei_lib.fix_recipe(i)
end


-- hide all barrel rcipes that were added by autobarreling from player
-- check if recipe is in fill-barrel or empty-barrel subgroup

for i,v in pairs(data.raw.recipe) do
    if data.raw.recipe[i].subgroup == "fill-barrel" or data.raw.recipe[i].subgroup == "barrel" then
        data.raw.recipe[i].hide_from_player_crafting = true
    end
end

--====================================================================================================
--RECIPES THAT ALLOW PRODUCTIVITY
--====================================================================================================

local recipes = {
    "ei_bio_insulated-wire",
    "ei_bio_electronic-parts",
    "ei_bio_magnet",
    "ei_bio_hydrofluoric-acid",
    "ei_bio_nitric-acid",
    "ei_desulfurize-kerosene",
    "ei_kerosene__heavy-oil",
    "ei_hydrofluoric-acid",
    "ei_kerosene-cracking",
    "ei_nitric-acid",
    "ei_crystal-solution",
    "ei_drill-fluid",
    "ei_ammonia",
    "ei_dinitrogen-tetroxide",
    "ei_dinitrogen-tetroxide-water-solution",
    "ei_oxygen-difluoride",
    --"ei_lube-destilation",
    "ei_plastic__benzol",
    "ei_battery__lithium",
    "ei_carbon",
    "ei_lithium-crystal",
    "ei_molten-steel__mix",
    "ei_steam-engine",
    "ei_electron-tube",
    "ei_cpu",
    "ei_electronic-parts",
    "ei_module-part",
    "ei_module-base",
    "ei_magnet",
    "ei_emtpy-cryo-container",
    "ei_green-circuit__waver",
    "ei_red-circuit__waver",
    "ei_electric-engine__lube",
    "ei_advanced-motor",
    "ei_rocket-parts",
    "ei_dark-age-tech",
    "ei_steam-age-tech",
    "ei_electricity-age-tech",
    "ei_computer-age-tech",
    "ei_advanced-computer-age-tech",
    "ei_quantum-age-tech",
    "ei_ceramic",
    "ei_steel-blend",
    "ei_dirty-water__fluorite",
    "ei_neutron-container",
    "ei_odd-plating",
    "ei_advanced-rocket-fuel",
    "ei_plastic__crushed-coke",
    "ei_rocket-parts__odd-plating",
    "ei_insulated-wire",
    "firearm-magazine",
    "piercing-rounds-magazine",
    "uranium-rounds-magazine",
    "ei_compound-ammo",
    "shotgun-shell",
    "piercing-shotgun-shell",
    "cannon-shell",
    "explosive-cannon-shell",
    "uranium-cannon-shell",
    "explosive-uranium-cannon-shell",
    "artillery-shell",
    "rocket",
    "explosive-rocket",
    "ei_molten-steel__oxygen",
    "ei_neodym-plate",
    "ei_ceramic__water",
    "ei_solid-fuel__residual-oil",
    "ei_diesel-fuel-unit",
    "ei_benzol__petroleum",
	"ei_rocket-control-unit"
}

local remove_prod = {
    "iron-plate",
    "copper-plate",
	"lubricant",
}

local crafting_categories = {
    "ei_waver-factory",
    "smelting",
    "rocket-building",
}

-- add them to limitation of productivity modules

for i,v in pairs(recipes) do
	data.raw["recipe"][v].allow_productivity = true
end

-- remove productivity from given recipes

for i,v in pairs(remove_prod) do
    data.raw["recipe"][v].allow_productivity = false
end

-- get all recipes that have given crafting category and add them to limitation of productivity modules

for i,v in pairs(crafting_categories) do
    for i2,v2 in pairs(data.raw["recipe"]) do
        if v2.category == v then
            v2.allow_productivity = true
        end
    end
end


-- fix recipes that need vanilla iron-ore, copper-ore or iron-gear-wheel/iron-stick
-- loop over all recipes
for name,recipe in pairs(data.raw.recipe) do

    ei_lib.recipe_swap(name, "iron-ore", "ei_poor-iron-chunk")
    ei_lib.recipe_swap(name, "copper-ore", "ei_poor-copper-chunk")
    ei_lib.recipe_swap(name, "iron-gear-wheel", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(name, "iron-stick", "ei_iron-mechanical-parts")
    ei_lib.recipe_swap(name, "nuclear-fuel", "ei_uranium-235-fuel")

end

--====================================================================================================
-- FLUID TINTS
--====================================================================================================

data.raw.recipe["rocket-fuel"].crafting_machine_tint =
{
    primary = {r=0.88, g=0.53, b=0.16, a = 1.000},
    secondary = {r=0.49, g=0.48, b=0.46, a = 1.000},
    tertiary = {r=0.57, g=0.7, b=0.47, a = 1.000},
    quaternary = {r=0.83, g=0.11, b=0.05, a = 1.000}
}

data.raw.recipe["heavy-oil-cracking"].crafting_machine_tint =
{
    primary = {r=0.57, g=0.7, b=0.47,a = 1.000},
    secondary = {r=0.75, g=0.88, b=0.75, a = 1.000},
    tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000},
    quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}
}

data.raw.recipe["ei_solid-fuel__residual-oil"].crafting_machine_tint =
{
    primary = {r=0.49, g=0.36, b=0.13, a = 1.000},
    secondary = {r=0.4, g=0.24, b=0.06, a = 1.000},
    tertiary = {r=0.49, g=0.36, b=0.13, a = 1.000},
    quaternary = {r=0.4, g=0.24, b=0.06, a = 1.000}
}

data.raw.recipe["ei_diesel-fuel-unit"].crafting_machine_tint =
{
	primary = {r=0.64, g=0.59, b=0.49, a = 1.000},
	secondary = {r=0.90, g=0.83, b=0.67, a = 1.000},
	tertiary = {r=0.64, g=0.59, b=0.49, a = 1.000},
	quaternary = {r=0.90, g=0.83, b=0.67, a = 1.000}
}

data.raw.recipe["ei_plastic__benzol"].crafting_machine_tint =
{
	primary = {r = 1.000, g = 1.000, b = 1.000, a = 1.000},
	secondary = {r = 0.771, g = 0.771, b = 0.771, a = 1.000},
	tertiary = {r = 0.768, g = 0.665, b = 0.762, a = 1.000},
	quaternary = {r=0.55, g=0.3, b=0.21, a = 1.000}
}

data.raw.recipe["ei_desulfurize-kerosene"].crafting_machine_tint =
{
	primary = {r=0.64, g=0.59, b=0.49, a = 1.000},
	secondary = {r=0.90, g=0.83, b=0.67, a = 1.000},
	tertiary = {r=0.75, g=0.88, b=0.75, a = 1.000},
	quaternary = {r=0.57, g=0.7, b=0.47,a = 1.000}
}

data.raw.recipe["ei_acidic-water__sulfur"].crafting_machine_tint =
{
	primary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000},
	secondary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000},
	tertiary = {r=0.51, g=0.69, b=0.62, a = 1.000},
	quaternary = {r=0.81, g=0.85, b=0.63, a = 1.000}
}

data.raw.recipe["ei_sulfur__acidic-water"].crafting_machine_tint =
{
	primary = {r=0.51, g=0.69, b=0.62, a = 1.000},
	secondary = {r=0.81, g=0.85, b=0.63, a = 1.000},
	tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000},
	quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}
}

data.raw.recipe["ei_kerosene__heavy-oil"].crafting_machine_tint =
{
	primary = {r=0.57, g=0.7, b=0.47, a = 1.000},
	secondary = {r=0.75, g=0.88, b=0.75, a = 1.000},
	tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000},
	quaternary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000}
}

data.raw.recipe["ei_benzol__petroleum"].crafting_machine_tint =
{
	primary = {r = 0.764, g = 0.596, b = 0.780, a = 1.000},
	secondary = {r = 0.762, g = 0.551, b = 0.844, a = 1.000},
	tertiary = {r=0.33, g=0.16, b=0.13, a = 1.000},
	quaternary = {r=0.55, g=0.3, b=0.21, a = 1.000}
}

data.raw.recipe["ei_kerosene-cracking"].crafting_machine_tint =
{
	primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000},
	secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000},
	tertiary = {r=0.75, g=0.88, b=0.75, a = 1.000},
	quaternary = {r=0.57, g=0.7, b=0.47,a = 1.000}
}

data.raw.recipe["ei_acidic-water__crushed-sulfur"].crafting_machine_tint =
{
	primary = {r=0.51, g=0.69, b=0.62, a = 1.000},
	secondary = {r=0.81, g=0.85, b=0.63, a = 1.000},
	tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000},
	quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}
}

data.raw.recipe["ei_drill-fluid"].crafting_machine_tint =
{
	primary = {r=0.49, g=0.48, b=0.44, a = 1.000},
	secondary = {r=0.69, g=0.63, b = 0.771, a = 1.000},
	tertiary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000},
	quaternary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000}
}

data.raw.recipe["ei_lube-destilation"].crafting_machine_tint =
{
	primary = {r = 0.647, g = 0.471, b = 0.396, a = 1.000},
	secondary = {r = 1.000, g = 0.395, b = 0.127, a = 1.000},
	tertiary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000},
	quaternary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}
}

data.raw.recipe["ei_sus-plating"].crafting_machine_tint =
{
	primary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000},
	secondary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000},
	tertiary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000},
	quaternary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000}
}

data.raw.recipe["ei_bio_hydrofluoric-acid"].crafting_machine_tint =
{
	primary = {r=0.36, g=0.56, b=0.37, a = 1.000},
	secondary = {r=0.57, g=0.68, b=0.39, a = 1.000},
	tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000},
	quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}
}

data.raw.recipe["ei_bio_nitric-acid"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.24, g=0.42, b=0.55, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r=0.53, g=0.58, b=0.75, a = 1.000}
}

data.raw.recipe["ei_concentrated-gaia-water"].crafting_machine_tint =
{
	primary = {r=0.56, g=0.36, b=0.38, a = 1.000},
	secondary = {r=0.66, g=0.63, b=0.45, a = 1.000},
	tertiary = {r=0, g=0.57, b=0.63, a = 1.000},
	quaternary = {r=0.78, g=0.55, b=0.68, a = 1.000}
}

data.raw.recipe["ei_evolved-alien-seed"].crafting_machine_tint =
{
	primary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000},
	secondary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000},
	tertiary = {r=0.1, g=0.78, b=0.03, a = 1.000},
	quaternary = {r=0.36, g=0.6, b=0.6, a = 1.000}
}

data.raw.recipe["ei_bio-matter"].crafting_machine_tint =
{
	primary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000},
	secondary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000},
	tertiary = {r=0.22, g=0.36, b=0.25, a = 1.000},
	quaternary = {r=0.6, g=0.31, b=0.32, a = 1.000}
}

data.raw.recipe["ei_cryodust"].crafting_machine_tint =
{
	primary = {r=0.1, g=0.78, b=0.83, a = 1.000},
	secondary = {r=0.78, g=0.55, b=0.68, a = 1.000},
	tertiary = {r=0, g=0.57, b=0.63, a = 1.000},
	quaternary = {r=0.1, g=0.78, b=0.83, a = 1.000}
}

data.raw.recipe["ei_molten-steel__mix"].crafting_machine_tint =
{
	primary = {r=0.88, g=0.53, b=0.16, a = 1.000},
	secondary = {r=0.50, g=0.61, b=0.67, a = 1.000},
	tertiary = {r=0.88, g=0.53, b=0.16, a = 1.000},
	quaternary = {r=0.49, g=0.48, b=0.46, a = 1.000}
}

data.raw.recipe["ei_molten-steel__oxygen"].crafting_machine_tint =
{
	primary = {r=0.88, g=0.53, b=0.16, a = 1.000},
	secondary = {r=0.50, g=0.61, b=0.67, a = 1.000},
	tertiary = {r=0.88, g=0.53, b=0.16, a = 1.000},
	quaternary = {r=0.83, g=0.11, b=0.05, a = 1.000}
}

data.raw.recipe["ei_crystal-solution"].crafting_machine_tint =
{
	primary = {r=0.55, g=0.75, b=0.57, a = 1.000},
	secondary = {r=0.48, g=0.3, b=0.36, a = 1.000},
	tertiary = {r=0.36, g=0.56, b=0.37, a = 1.000},
	quaternary = {r=0.57, g=0.68, b=0.39, a = 1.000}
}

data.raw.recipe["ei_hydrogen"].crafting_machine_tint =
{
	primary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000},
	secondary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	tertiary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000},
	quaternary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000}
}

data.raw.recipe["ei_ammonia"].crafting_machine_tint =
{
	primary = {r=0.36, g=0.6, b=0.6, a = 1.000},
	secondary = {r=0.36, g=0.6, b=0.6, a = 1.000},
	tertiary = {r=0.0, g=0.82, b=1, a = 1.000},
	quaternary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000}
}

data.raw.recipe["ei_dinitrogen-tetroxide"].crafting_machine_tint =
{
	primary = {r=0.53, g=0.58, b=0.75, a = 1.000},
	secondary = {r=0.67, g=0.36, b=0.45, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r=0.36, g=0.6, b=0.6, a = 1.000}
}

data.raw.recipe["ei_dinitrogen-tetroxide-water-solution"].crafting_machine_tint =
{
	primary = {r=0.53, g=0.58, b=0.75, a = 1.000},
	secondary = {r=0.67, g=0.36, b=0.45, a = 1.000},
	tertiary = {r=0.53, g=0.58, b=0.75, a = 1.000},
	quaternary = {r=0.67, g=0.36, b=0.45, a = 1.000}
}

data.raw.recipe["ei_nitric-acid"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.24, g=0.42, b=0.55, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r=0.53, g=0.58, b=0.75, a = 1.000}
}

data.raw.recipe["ei_battery__lithium"].crafting_machine_tint =
{
	primary = {r = 0.65, g = 0.81, b = 0.87, a = 1.000},
	secondary = {r = 0.80, g = 0.84, b = 0.73, a = 1.000},
	tertiary = {r = 0.728, g = 0.818, b = 0.443, a = 1.000},
	quaternary = {r = 0.939, g = 0.763, b = 0.191, a = 1.000}
}

data.raw.recipe["ei_silicon"].crafting_machine_tint =
{
	primary = {r = 0.24, g = 0.28, b = 0.40, a = 1.000},
	secondary = {r = 0.55, g = 0.48, b = 0.67, a = 1.000},
	tertiary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000},
	quaternary = {r=0.88, g=0.53, b=0.16, a = 1.000}
}

data.raw.recipe["ei_monosilicon"].crafting_machine_tint =
{
	primary = {r = 0.44, g = 0.31, b = 0.62, a = 1.000},
	secondary = {r = 1.0, g = 1.0, b = 1.0, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r = 0.55, g = 0.48, b = 0.67, a = 1.000}
}

data.raw.recipe["ei_neodym-plate"].crafting_machine_tint =
{
	primary = {r=0.1, g=0.78, b=0.83, a = 1.000},
	secondary = {r=0.64, g=0.56, b=0.63, a = 1.000},
	tertiary = {r=0.0, g=0.82, b=1, a = 1.000},
	quaternary = {r=0.54, g=0.53, b=0.85, a = 1.000}
}

data.raw.recipe["ei_dt-mix"].crafting_machine_tint =
{
	primary = {r=0.0, g=0.51, b=0.58, a = 1.000},
	secondary = {r=0.59, g=0.22, b=0.21, a = 1.000},
	tertiary = {r=0.0, g=0.72, b=0.8, a = 1.000},
	quaternary = {r=0.96, g=0.35, b=0.34, a = 1.000}
}

data.raw.recipe["ei_oxygen-difluoride"].crafting_machine_tint =
{
	primary = {r=0.56, g=0.82, b=0.1, a = 1.000},
	secondary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r=0.44, g=0.31, b=0.62, a = 1.000}
}

data.raw.recipe["ei_lithium-crystal"].crafting_machine_tint =
{
	primary = {r = 0.65, g = 0.81, b = 0.87, a = 1.000},
	secondary = {r = 0.80, g = 0.84, b = 0.73, a = 1.000},
	tertiary = {r=0.83, g=0.11, b=0.05, a = 1.000},
	quaternary = {r=0.29, g=0.41, b=0.45, a = 1.000}
}

data.raw.recipe["ei_uranium-hexafluorite"].crafting_machine_tint =
{
	primary = {r=0.28, g=1, b=0.6, a = 1.000},
	secondary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000},
	tertiary = {r=0.36, g=0.56, b=0.37, a = 1.000},
	quaternary = {r=0.57, g=0.68, b=0.39, a = 1.000}
}

data.raw.recipe["ei_energy-crystal__washing"].crafting_machine_tint =
{
	primary = {r = 0.51, g = 0.84, b = 0.61, a = 1.000},
	secondary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000},
	tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000},
	quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}
}

data.raw.recipe["ei_hydrofluoric-acid"].crafting_machine_tint =
{
	primary = {r=0.36, g=0.56, b=0.37, a = 1.000},
	secondary = {r=0.57, g=0.68, b=0.39, a = 1.000},
	tertiary = {r=0.4, g=0.3, b=0.54, a = 1.000},
	quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000}
}

data.raw.recipe["ei_alien-seed__harvesting"].crafting_machine_tint =
{
	primary = {r=0.0, g=0.82, b=1, a = 1.000},
	secondary = {r=0.54, g=0.53, b=0.85, a = 1.000},
	tertiary = {r=0.0, g=0.82, b=1, a = 1.000},
	quaternary = {r=0.54, g=0.53, b=0.85, a = 1.000}
}

data.raw.recipe["ei_nitric-acid-uranium-235"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.37, g=0.84, b=0.16, a = 1.000},
	tertiary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	quaternary = {r=0.24, g=0.42, b=0.55, a = 1.000}
}

data.raw.recipe["ei_nitric-acid-plutonium-239"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.23, g=0.69, b=0.67, a = 1.000},
	tertiary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	quaternary = {r=0.24, g=0.42, b=0.55, a = 1.000}
}

data.raw.recipe["ei_nitric-acid-thorium-232"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.24, g=0.37, b=0.38, a = 1.000},
	tertiary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	quaternary = {r=0.24, g=0.42, b=0.55, a = 1.000}
}

data.raw.recipe["ei_nitric-acid-uranium-233"].crafting_machine_tint =
{
	primary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	secondary = {r=0.24, g=0.37, b=0.38, a = 1.000},
	tertiary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	quaternary = {r=0.35, g=0.65, b=0.36, a = 1.000}
}

data.raw.recipe["ei_cold-coolant"].crafting_machine_tint =
{
	primary = {r=0.88, g=0.65, b=0.42, a = 1.000},
	secondary = {r=0.32, g=0.84, b=0.95, a = 1.000},
	tertiary = {r=0.76, g=0.45, b=0.3, a = 1.000},
	quaternary = {r=0.3, g=0.3, b=0.3, a = 1.000}
}

data.raw.recipe["ei_carbon"].crafting_machine_tint =
{
	primary = {r=0.3, g=0.3, b=0.3, a = 1.000},
	secondary = {r=0.1, g=0.1, b=0.1, a = 1.000},
	tertiary = {r = 1.000, g = 0.978, b = 0.513, a = 1.000},
	quaternary = {r = 0.210, g = 0.170, b = 0.013, a = 1.000}
}

