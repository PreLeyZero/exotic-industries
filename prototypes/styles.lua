local style = data.raw["gui-style"]["default"]

style.ei_relative_titlebar_flow = {
    type = "horizontal_flow_style",
    horizontal_spacing = 8
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
    parent = "subheader_frame_with_top_border",
    horizontally_stretchable = "on"
}

style.ei_inner_content_flow = {
    type = "vertical_flow_style",
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
