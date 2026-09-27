-- =========================================================================
-- MODULE IMPORTS
-- =========================================================================
-- Replacing the old "source =" commands with Lua's native require mechanism.
-- Note: Your external sub-configs MUST also be migrated to .lua files for
-- this setup to function properly without throwing compiler errors.
require("my-programs")
require("autostart")
require("keybindings")
require("windows-workspaces")
require("general-decoration")
require("animations")
require("layout")

-- =========================================================================
-- MONITORS
-- =========================================================================
-- See https://hypr.land
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})

-- =========================================================================
-- ENVIRONMENT VARIABLES
-- =========================================================================
-- Note: If you use UWSM (Universal Wayland Session Manager) on NixOS,
-- it is recommended to define environmental hooks inside your system config instead.
hl.env("GDK_SCALE", "$scaling")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- =========================================================================
-- INPUT CONFIGURATION
-- =========================================================================
-- See https://hypr.land
hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",

        -- Don't change window focus when moving mouse
        follow_mouse = 2,
        float_switch_override_focus = 0,
        follow_mouse_threshold = 1000,

        sensitivity = 1.0,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.3,
            drag_3fg = true, -- Three-finger drag mapped to a true boolean value
        },
    },

    cursor = {
        inactive_timeout = 1,
    },
})

-- =========================================================================
-- PER-DEVICE CONFIGURATION
-- =========================================================================
-- See https://wiki.hypr.land/configuring/core/devices/
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
