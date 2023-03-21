-- enforce spiderling setting to be true
if mods["SpidertronPatrols"] then
    data.raw["bool-setting"]["sp-enable-spiderling"].forced_value = true
    data.raw["bool-setting"]["sp-enable-spiderling"].hidden = true

    data.raw["bool-setting"]["sp-remove-military-requirement"].forced_value = false
    data.raw["bool-setting"]["sp-remove-military-requirement"].hidden = true
end