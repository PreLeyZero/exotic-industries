-- store data like switch tables and other constants/parameters here
-- excluding global table stuff

local ei_data = {}

ei_data.tech_scaling = {}
ei_data.science = {}

--====================================================================================================
--TECH SCALING
--====================================================================================================

ei_data.tech_scaling.switch_table = {
    ["Very Cheap"]      =   1000,
    ["More Cheap"]      =   2500,
    ["Cheap"]           =   5000,
    ["Default"]         =  10000,
    ["Less Expensive"]  =  25000,
    ["Expensive"]       =  50000,
    ["Very Expensive"]  = 100000
}

--====================================================================================================
--SCIENCE PACKS
--====================================================================================================

ei_data.science["dark-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["steam-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["electricity-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["computer-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["quantum-age"] = {
    {"automation-science-pack",1},
}

ei_data.science["exotic-age"] = {
    {"automation-science-pack",1},
}

return ei_data