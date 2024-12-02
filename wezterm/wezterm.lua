local wezterm = require("wezterm")

return {
	color_scheme = "Catppuccin Macchiato",
	default_prog = { "zsh", "--login" },
	window_decorations = "RESIZE",
	window_background_opacity = 0.85,
	macos_window_background_blur = 10,
	font = wezterm.font_with_fallback({
		"DroidSansM Nerd Font",
	}),
	font_size = 12.5,
	enable_tab_bar = false,
	-- term = "wezterm",
	-- set_environment_variables = {
	-- 	TERMINFO_DIRS = "/home/haseebmajid/.nix-profile/share/terminfo",
	-- },
	hyperlink_rules = wezterm.default_hyperlink_rules(),
	window_padding = {
		left = 10,
		right = 10,
		top = 5,
		bottom = 5,
	},
	keys = {},
}
