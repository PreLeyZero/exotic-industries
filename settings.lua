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
        default_value = 100,
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
    }
})