-- definitions for fluids

--====================================================================================================
-- FLUIDS
--====================================================================================================

data:extend({
    {
        name = "ei_residual-oil",
        type = "fluid",
        icon = ei_graphics_fluid_path.."residual-oil.png",
        icon_size = 64,
        default_temperature = 15,
        max_temperature = 1000,
        fuel_value = "0.2MJ",
        base_color = { r=0.76, g=0.45, b=0.3 }, 
		flow_color = { r=0.76, g=0.45, b=0.3 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0,
        subgroup = "fluid",
        order = "a[fluid]-a[residual-oil]",
    },
    {
        name = "ei_coal-gas",
        type = "fluid",
        icon = ei_graphics_fluid_path.."coal-gas.png",
        icon_size = 64,
        default_temperature = 15,
        max_temperature = 1000,
        gas_temperature = 15,
        fuel_value = "0.05MJ",
        base_color = { r=0.76, g=0.45, b=0.3 }, 
		flow_color = { r=0.76, g=0.45, b=0.3 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0,
        subgroup = "fluid",
        order = "b[gas]-a[coal-gas]",
    },
    {
        name = "ei_benzol",
        type = "fluid",
        icon = ei_graphics_fluid_path.."benzol.png",
        icon_size = 64,
        default_temperature = 15,
        max_temperature = 1000,
        gas_temperature = 15,
        base_color = { r=0.76, g=0.45, b=0.3 }, 
		flow_color = { r=0.76, g=0.45, b=0.3 }, 
		pressure_to_speed_ratio = 0.400, 
		flow_to_energy_ratio = 0,
        subgroup = "fluid-recipes",
        order = "b[fluid-chemistry]-c[benzol]",
    },
})