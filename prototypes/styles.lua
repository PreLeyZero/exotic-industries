local ei_lib = require("lib/lib")

local style = data.raw["gui-style"]["default"]

style.ei_relative_titlebar_flow = {
    type = "horizontal_flow_style",
    horizontal_spacing = 8
}

style.ei_titlebar_draggable_spacer = {
    type = "empty_widget_style",
    parent = "draggable_space",
    height = 24,
    horizontally_stretchable = "on",
    left_margin = 4,
    right_margin = 4
  }

style.ei_titlebar_nondraggable_spacer = {
    type = "empty_widget_style",
    height = 24,
    horizontally_stretchable="on"
}

style.ei_subheader_frame = {
    type = "frame_style",
    parent = "subheader_frame",
    horizontally_stretchable = "on"
}

style.ei_subheader_frame_with_top_border = {
    type = "frame_style",
    parent = "subheader_frame",
    graphical_set =
    {
    base =
    { -- add top transition into subheader center
        top = {position = {42, 0}, size = {1, 8}},
        center = {position = {256, 25}, size = {1, 1}},
        bottom = {position = {256, 26}, size = {1, 8}}
    },
    glow =
    { -- transition from content frame
        top = {position = {93, 0}, size = {1, 8}},
        draw_type = "outer"
    },
    shadow = bottom_shadow
    },
    -- to maintain alignment with standard subheader frames
    top_margin = 1,
    -- optical correction - the added shadow increases the perceived height
    -- of the frame
    top_padding = -1,
    height = 35,
    horizontally_stretchable = "on"
}

style.ei_inner_content_flow = {
    type = "vertical_flow_style",
    padding = 12
}

style.ei_inner_content_flow_horizontal = {
    type = "horizontal_flow_style",
    padding = 12
}

style.ei_status_progressbar = {
    type = "progressbar_style",
    bar_width = 28,
    horizontally_stretchable = "on",
    vertical_align = "center",
    font = "default-bold",
    embed_text_in_bar = true,
    font_color = {227, 227, 227},
    filled_font_color = {0, 0, 0}
}
style.ei_status_progressbar_cyan = {
    type = "progressbar_style",
    parent = "ei_status_progressbar",
    color = {0, 255, 255}
}
style.ei_status_progressbar_grey = {
    type = "progressbar_style",
    parent = "ei_status_progressbar",
    color = {227, 227, 227}
}
style.ei_status_progressbar_purple = {
    type = "progressbar_style",
    parent = "ei_status_progressbar",
    color = {184, 33, 184}
}
style.ei_status_progressbar_red = {
    type = "progressbar_style",
    parent = "ei_status_progressbar",
    color = {255, 0, 0}
}

style.ei_slot_button_radio = {
    type = "button_style",
    parent = "slot_button",
    disabled_graphical_set = style.slot_button.clicked_graphical_set
}

style.ei_vertical_pusher = {
    type = "empty_widget_style",
    height = 4
}

style.ei_horizontal_pusher = {
    type = "empty_widget_style",
    horizontally_stretchable = "on"
}

style.ei_relative_gui_slider = {
    type = "slider_style",
    parent = "notched_slider",
    horizontally_stretchable = "on",
    draw_notches = true
}

style.ei_space_frame = {
    type = "frame_style",
    parent = "inside_deep_frame",
    graphical_set = table.deepcopy(style.inside_deep_frame.graphical_set),
    width = 144,
    height = 144,
    horizontal_align = "center",
    vertical_align = "center",
    horizontal_flow_style = {
        type = "horizontal_flow_style",
        horizontal_align = "center",
        vertical_align = "center"
    }
}
style.ei_space_frame.graphical_set.base.center = {
    filename = ei_graphics_destination_path .. "space.png",
    size = 256,
    flags = {"gui-icon"},
    priority = "low"
}

style.ei_deep_space_frame = {
    type = "frame_style",
    parent = "ei_space_frame",
    graphical_set = table.deepcopy(style.ei_space_frame.graphical_set)
}
style.ei_deep_space_frame.graphical_set.base.center.filename = ei_graphics_destination_path .. "deep-space.png"

style.ei_space_destination_sprite = {
    type = "image_style",
    stretch_image_to_widget_size = true
}

style.ei_camera_frame = {
    type = "frame_style",
    parent = "deep_frame_in_shallow_frame",
    width = 282
}

style.ei_camera = {
    type = "camera_style",
    size = 282
}

style.ei_small_camera_frame = {
    type = "frame_style",
    parent = "deep_frame_in_shallow_frame",
    width = 222
}

style.ei_small_camera = {
    type = "camera_style",
    size = 222
}

style.ei_green_button = {
    type = "button_style",
    parent = "menu_button_continue",
    width = 260,
    height = 36,
    font = "default-bold",
}

style.ei_button = {
    type = "button_style",
    parent = "menu_button",
    width = 260,
    height = 36,
    font = "default-bold",
}

style.ei_small_button = {
    type = "button_style",
    parent = "button",
    width = 110,
    height = 30,
    font = "default-bold"
}

style.ei_small_red_button = {
    type = "button_style",
    parent = "red_button",
    width = 110,
    height = 30,
    font = "default-bold",
}

style.ei_small_green_button = {
    type = "button_style",
    parent = "green_button",
    width = 110,
    height = 30,
    font = "default-bold",
}

style.ei_knowledge_sprite_button_grey = {
    type = "button_style",
    -- parent = "slot_button",
    parent = "filter_inventory_slot",
    width = 80,
    height = 80
}

style.ei_knowledge_sprite_button_red = {
    type = "button_style",
    -- parent = "slot_button",
    parent = "closed_inventory_slot",
    width = 80,
    height = 80,
    color = {0, 0.7, 0}
}

style.ei_knowledge_sprite_button_green = {
    type = "button_style",
    --parent = "slot_button",
    parent = "green_slot",
    width = 80,
    height = 80,
    color = {0.05, 0.86, 0}
}

style.ei_inner_content_flow_horizontal_centered = {
    type = "horizontal_flow_style",
    padding = 12,
    horizontal_align = "center"
}

style.ei_inner_content_flow_vertical_centered = {
    type = "vertical_flow_style",
    padding = 12,
    horizontal_align = "center"
}

if ei_lib.config("expanded-gui") then
    data.raw["utility-constants"]["default"].select_group_row_count = 7
    data.raw["utility-constants"]["default"].select_slot_row_count = 12
end
