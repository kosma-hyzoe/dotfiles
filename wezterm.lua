-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local c = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  c = wezterm.config_builder()
end

-- This is where you actually apply your config choices

c.enable_tab_bar = false
c.window_decorations = "NONE"
c.window_frame = {
  border_bottom_height = '0.00cell',
  border_top_height = '0.00cell',
}
c.window_close_confirmation = "NeverPrompt"

-- and finally, return the configuration to wezterm
return c
