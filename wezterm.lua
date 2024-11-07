--
-- noncomplete's wezterm configuration
--
local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
	--pane:split({ size = 0.2 })
end)

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
config.font = wezterm.font("IosevkaTermSlab Mono Nerd Font")
--config.font_rules = {
--	{
--		intensity = "Bold",
--		italic = false,
--		font = wezterm.font("GeistMonoNerdFont-Black"),
--	},
--
--	{
--		intensity = "Bold",
--		italic = true,
--		font = wezterm.font("GeistMonoNerdFont-Black"),
--	},
--}
config.font_size = 12
config.color_scheme = "UltraDark"
config.colors = { cursor_bg = "#83D0FF", cursor_fg = "#000000" }
config.window_background_opacity = 0.92
config.hide_mouse_cursor_when_typing = false
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.85,
}
-- Tab bar config
config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Geist", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10. on Windows but 12.0 on other systems
	font_size = 11.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}

return config
