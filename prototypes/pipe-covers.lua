-- store prototype setup for pipe covers here

--====================================================================================================
--UTIL
--====================================================================================================

-- from factorio base
function make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
      local start_frame = (anim.frame_count or 1) * idx
      local x = 0
      local y = 0
      if anim.line_length then
        y = anim.height * math.floor(start_frame / (anim.line_length or 1))
      else
        x = idx * anim.width
      end
      return
      {
        filename = anim.filename,
        priority = anim.priority or "high",
        flags = anim.flags,
        x = x,
        y = y,
        width = anim.width,
        height = anim.height,
        frame_count = anim.frame_count or 1,
        line_length = anim.line_length,
        repeat_count = anim.repeat_count,
        shift = anim.shift,
        draw_as_shadow = anim.draw_as_shadow,
        force_hr_shadow = anim.force_hr_shadow,
        apply_runtime_tint = anim.apply_runtime_tint,
        animation_speed = anim.animation_speed,
        scale = anim.scale or 1,
        tint = anim.tint,
        blend_mode = anim.blend_mode
      }
    end
  
    local function make_animation(idx)
      if animation.layers then
        local tab = { layers = {} }
        for k,v in ipairs(animation.layers) do
          table.insert(tab.layers, make_animation_layer(idx, v))
        end
        return tab
      else
        return make_animation_layer(idx, animation)
      end
    end
  
    return
    {
      north = make_animation(0),
      east = make_animation(1),
      south = make_animation(2),
      west = make_animation(3)
    }
end

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

ei_pipe_south_basic_insulated = {
  north = empty_sprite,
  south = {
      filename = ei_graphics_pipe_path.."south_basic_covers_insulated.png",
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

ei_pipe_miner = {
  north = empty_sprite,
  south = {
      filename = ei_graphics_pipe_path.."south_pumpjack_covers.png",
  priority = "high",
  width = 55*2,
      height = 50*2,
      shift = {0.01, -0.95},
      scale = 0.5
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

ei_pipe_electricity = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."electricity_south_covers.png",
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

ei_pipe_bio_chamber = {
  north = empty_sprite,
  south = {
      layers = {
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

ei_pipe_exchanger = {
  north = empty_sprite,
  south = {
      layers = {
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
  west = empty_sprite,
  east = empty_sprite,
}

ei_pipe_big = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."electricity_south_covers.png",
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
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_big_round = {
  north = empty_sprite,
  south = {
      layers = {
        {
          filename = ei_graphics_pipe_path.."data_south_covers.png",
          width = 512,
          height = 512,
          -- shift = {0,-2.15},
          scale = 0.35,
          shift = util.by_pixel(0, -96), 
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
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_big_insulated = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."electricity_south_covers.png",
            width = 512,
            height = 512,
            shift = {0,-2.15},
            scale = 0.44/2,
          },
          {
            filename = ei_graphics_pipe_path.."south_basic_covers_insulated.png",
            priority = "high",
            width = 55,
            height = 50,
            shift = {0.01, -0.58},
            scale = 0.5
          }
      }
      
  },
  west = {
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_big_data = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."data_south_covers.png",
            width = 512,
            height = 512,
            -- shift = {0,-2.15},
            scale = 0.35,
            shift = util.by_pixel(0, -96), 
          },
          {
            filename = ei_graphics_pipe_path.."south_basic_covers_data.png",
            priority = "high",
            width = 55,
            height = 50,
            shift = {0.01, -0.58},
            scale = 0.5
          }
      }
      
  },
  west = {
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_big_nitrogen = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."data_south_covers.png",
            width = 512,
            height = 512,
            -- shift = {0,-2.15},
            scale = 0.35,
            shift = util.by_pixel(0, -96), 
          },
          {
            filename = ei_graphics_pipe_path.."south_basic_covers_insulated.png",
            priority = "high",
            width = 55,
            height = 50,
            shift = {0.01, -0.58},
            scale = 0.5
          }
      }
      
  },
  west = {
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_data = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."electricity_south_covers.png",
            width = 512,
            height = 512,
            shift = {0,-2.15},
            scale = 0.44/2,
          },
          {
            filename = ei_graphics_pipe_path.."south_basic_covers_data.png",
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

ei_pipe_reactor = {
  north = empty_sprite,
  south = {
    layers = {
        {
          filename = ei_graphics_pipe_path.."big_south_covers.png",
          priority = "high",
          width = 512,
          height = 512,
          scale = 0.35,
          shift = util.by_pixel(0, -96), 
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
    filename = ei_graphics_pipe_path.."big_west_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(96, 0),        
  },
  east = {
    filename = ei_graphics_pipe_path.."big_east_covers.png",
    priority = "high",
    width = 512,
    height = 512,
    scale = 0.35,
    shift = util.by_pixel(-96, 0),
  }
}

ei_pipe_fluid_heater = {
    north = empty_sprite,
    south = {
        layers = {
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

ei_pipe_centrifuge = {
  north = empty_sprite,
  south = {
    filename = ei_graphics_pipe_path.."south_basic_covers.png",
    priority = "high",
    width = 55,
    height = 50,
    shift = {0.01, -0.58},
    scale = 0.5
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

ei_pipe_insulated_tank = {
  north = empty_sprite,
  south = {
      layers = {
          {
            filename = ei_graphics_pipe_path.."south_basic_covers_insulated.png",
            priority = "high",
            width = 55,
            height = 50,
            shift = {0.01, -0.58},
            scale = 0.5
          }
      }
      
  },
  west = {
    filename = ei_graphics_pipe_path.."west_covers_insulated.png",
    priority = "high",
    width = 39,
    height = 73,
    shift = util.by_pixel(25.75, 1.25),
    scale = 0.5,        
  },
  east = {
    filename = ei_graphics_pipe_path.."east_covers_insulated.png",
    priority = "high",
    width = 42,
    height = 76,
    shift = util.by_pixel(-24.5, 1),
    scale = 0.5
  }
}

--====================================================================================================
--HEAT PIPE COVERS
--====================================================================================================

ei_pipe_heat_basic =
make_4way_animation_from_spritesheet(
    {
      filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
      width = 64,
      height = 64,
      direction_count = 4,
      scale = 0.5
    })

ei_pipe_heated_basic =
make_4way_animation_from_spritesheet(
    apply_heat_pipe_glow{
      filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
      width = 64,
      height = 64,
      direction_count = 4,
      scale = 0.5
    })
