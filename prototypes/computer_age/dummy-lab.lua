-- dummy lab so that Factorio doesn't complain about there being no lab that can handle knowledge techs

data:extend({
    {
        name = "ei_dummy-lab",
        type = "lab",
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input"
        },
        energy_usage = "20MW",
        inputs = {
            "ei_knowledge-tech",
            "ei_knowledge-tech-2",
            "ei_knowledge-tech-3",
        },
    },
})