local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.enable_wayland = true
config.color_scheme = "catppuccin-mocha"
config.font_size = 18
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.front_end = "WebGpu"

return config
