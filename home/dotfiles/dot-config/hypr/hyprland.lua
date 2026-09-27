-- =========================================================================
-- MODULE IMPORTS
-- =========================================================================
local dotfilePath = "/home/nhoxsang2411994/.config/nixos/home/dotfiles/dot-config/hypr/"
package.path = package.path .. ";" .. dotfilePath .. "?.lua"

require("my-programs")
require("autostart")
require("keybindings")
require("windows-workspaces")
require("general-decoration")
require("animations")
require("layout")

-- =========================================================================
-- MONITORS (FIXED SYNTAX)
-- =========================================================================
-- The monitor method expects a single, raw layout configuration string.
-- This matches your original: monitor=,preferred,auto,auto
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1 -- Scale factors must be a primitive numerical integer or float
})

-- =========================================================================
-- ENVIRONMENT VARIABLES
-- =========================================================================
hl.env("GDK_SCALE", "$scaling")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- =========================================================================
-- INPUT CONFIGURATION
-- =========================================================================
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",

        follow_mouse = 2,
        float_switch_override_focus = 0,
        follow_mouse_threshold = 1000,

        sensitivity = 1.0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.3,
            drag_3fg = true,
        },
    },

    cursor = {
        inactive_timeout = 1,
        no_warps = true,
    },
})

-- =========================================================================
-- PER-DEVICE CONFIGURATION
-- =========================================================================
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
