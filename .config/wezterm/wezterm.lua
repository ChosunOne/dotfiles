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
config.font_size = 28
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.front_end = "WebGpu"

config.enable_kitty_keyboard = true
config.enable_kitty_graphics = true
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
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
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
	{
		key = "Delete",
		mods = "NONE",
		action = wezterm.action.SendKey({ key = "Delete" }),
	},
}

return config
