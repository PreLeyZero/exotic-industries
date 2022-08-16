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
})