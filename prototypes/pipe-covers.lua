-- store prototype setup for pipe covers here

--====================================================================================================
--EMPTY SPRITE
--====================================================================================================

local empty_sprite = {
    filename = ei_graphics_path.."graphics/64_empty.png",
    priority = "high",
    width = 64,
    height = 64
}

--====================================================================================================
--PIPE PICTURES
--====================================================================================================

ei_pipe_basic = {
    north = {
        filename = ei_graphics_pipe_path.."north_basic_covers.png",
        priority = "extra-high",
        width = 45,
        height = 40,
        shift = util.by_pixel(0, 25),
        scale = 0.5
    },
    south = {
        filename = ei_graphics_pipe_path.."south_basic_covers.png",
		priority = "high",
		width = 55,
        height = 50,
        shift = {0.01, -0.58},
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

ei_pipe_south_basic = {
    north = empty_sprite,
    south = {
        filename = ei_graphics_pipe_path.."south_basic_covers.png",
		priority = "high",
		width = 55,
        height = 50,
        shift = {0.01, -0.58},
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

ei_pipe_pumpjack = {
    north = empty_sprite,
    south = {
        filename = ei_graphics_pipe_path.."south_pumpjack_covers.png",
		priority = "high",
		width = 55*2,
        height = 50*2,
        shift = {0.01, -0.95},
        scale = 0.5
    },
    west = empty_sprite,
    east = empty_sprite
}

ei_pipe_steam = {
    north = empty_sprite,
    south = {
        layers = {
            {
                filename = ei_graphics_pipe_path.."steam_south_covers.png",
                width = 512,
                height = 512,
                shift = {0,-2.15},
	            scale = 0.44/2,
            },
            {
                filename = ei_graphics_pipe_path.."south_basic_covers.png",
		        priority = "high",
		        width = 55,
                height = 50,
                shift = {0.01, -0.58},
                scale = 0.5
            }
        }
        
    },
    west = {
        filename = ei_graphics_pipe_path.."west_covers.png",
        priority = "high",
        width = 39,
        height = 73,
        shift = util.by_pixel(25.75, 1.25),
        scale = 0.5,        
    },
    east = {
        filename = ei_graphics_pipe_path.."east_covers.png",
		priority = "high",
		width = 42,
        height = 76,
        shift = util.by_pixel(-24.5, 1),
        scale = 0.5
    }
}