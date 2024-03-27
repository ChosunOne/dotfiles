local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "catppuccin-mocha"
config.font_size = 18
config.font = wezterm.font("FiraCode Nerd Font Mono")

return config
