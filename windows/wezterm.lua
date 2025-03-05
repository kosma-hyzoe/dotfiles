local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.90

config.default_prog = { "ubuntu2204.exe" }

return config