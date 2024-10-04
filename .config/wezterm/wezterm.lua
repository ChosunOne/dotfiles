local wezterm = require("wezterm")
local config = wezterm.config_builder()

local dark_catppuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
dark_catppuccin.background = "#11111b"

config.enable_wayland = true
-- config.color_scheme = "catppuccin-mocha"
config.color_schemes = {
	["catppuccin-black"] = dark_catppuccin,
}
config.color_scheme = "catppuccin-black"
config.font_size = 18
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.front_end = "WebGpu"

config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = " ",
		mods = "SHIFT",
		action = wezterm.action.SendKey({
			key = " ",
		}),
	},
	{
		key = "c",
		mods = "CTRL|LEADER",
		action = wezterm.action.SpawnTab("DefaultDomain"),
	},
	{
		key = "h",
		mods = "META|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "META|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
}

return config
