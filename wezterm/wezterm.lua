local wezterm = require("wezterm")

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = false
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return {
	color_scheme = "tokyonight_night",
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
	keys = {
		{
			key = "t",
			mods = "SUPER",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
}
