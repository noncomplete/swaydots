--
-- noncomplete's wezterm configuration
--
local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
	--pane:split({ size = 0.2 })
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Spawn a fish shell in login mode
config.default_prog = { "/usr/bin/fish", "-l" }
config.font = wezterm.font("GeistMono Nerd Font")
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
config.font_size = 10.5
--config.color_scheme = "UltraDark"
config.color_scheme = 'Grayscale Dark (base16)'
--config.colors = { background = "#101010", cursor_bg = "#00AFFF", cursor_fg = "#000000" }
config.colors = { background = "#000000", cursor_bg = "#00AADD", cursor_fg = "#000000" }
config.window_background_opacity = 0.8
config.hide_mouse_cursor_when_typing = false
--config.cursor_blink_rate = 100
--config.cursor_blink_ease_in = "Constant"
--config.cursor_blink_ease_out = "Constant"
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.85,
}
-- Tab bar config
config.enable_tab_bar = false
config.use_fancy_tab_bar = true

return config


