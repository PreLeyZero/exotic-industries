--====================================================================================================
--OTHER STRUCTURES/THINGS
--====================================================================================================

data:extend({
    {
        name = "ei_spawner-tool",
        type = "selection-tool",
        stack_size = 1,
        icon_size = 64,
        icon = ei_graphics_other_path.."spawner-tool.png",
        flags = {"mod-openable"},
        selection_color = {r=0.79, g=0.4, b=0, a=0.5 },
        selection_mode = {"any-entity"},
        selection_cursor_box_type = "entity",
        alt_selection_color = {r=1, g=0, b=0, a=0.5 },
        alt_selection_cursor_box_type = "entity",
        alt_selection_mode = {"any-entity"},
    },
})