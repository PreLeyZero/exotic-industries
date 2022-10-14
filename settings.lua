-- settings for Exotic Industries

data:extend({
    {
        name = "ei_tech-scaling:maxCost",
        type = "string-setting",
        setting_type = "startup",
        default_value = "Default",
        allowed_values = {"Default", "Very Cheap", "Cheap", "Expensive", "Very Expensive"},
        order  = "a1",
    },
    {
        name = "ei_tech-scaling:startPrice",
        type = "int-setting",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 100000,
        order  = "a2",
    },
    {
        name = "ei_tech-scaling:curveForm",
        type = "string-setting",
        setting_type = "startup",
        default_value = "quadratic",
        allowed_values = {"linear", "quadratic", "exponential"},
        order  = "a3",
    },
    {
        name = "ei_age-enabler:neededPercentage",
        type = "int-setting",
        setting_type = "startup",
        default_value = "70",
        minimum_value = 1,
        maximum_value = 100,
        order  = "a4",
    },
    {
        name = "ei_pipe-to-ground:lenght",
        type = "int-setting",
        setting_type = "startup",
        default_value = "16",
        minimum_value = 10,
        maximum_value = 40,
        order  = "a5",
    }
})