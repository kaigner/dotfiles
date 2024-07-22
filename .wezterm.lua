-- Pull in wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false
--  config.window_decorations = "TITLE  RESIZE"

-- bring @ and | back to mac keyboards
config.send_composed_key_when_left_alt_is_pressed = true

return config
