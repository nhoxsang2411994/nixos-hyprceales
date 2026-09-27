-- =========================================================================
-- MODERN LUA WINDOW RULES (v0.56+)
-- =========================================================================

-- Brave's notification windows float rule
hl.windowrule("match:class ^$,match:title ^$,match:float yes")

-- Ignore maximize requests from applications
hl.windowrule("suppress_event maximize, match:class .*")

-- Fix mouse dragging issues with XWayland instances
hl.windowrule("no_focus 1,match:class ^$,match:title ^$,match:xwayland 1, match:float 1, match:fullscreen 0,match:pin 0")

-- fcitx input method windows layout optimization
hl.windowrule("pseudo on, match:class fcitx")

-- swayimg picture viewer rules
hl.windowrule("float on, match:class ^(swayimg)$")
hl.windowrule("center on, match:class ^(swayimg)$")
hl.windowrule("size 500 500, match:class ^(swayimg)$")
hl.windowrule("animation slide, match:class ^(swayimg)$")
hl.windowrule("opacity 0.95, match:class ^(swayimg)$")

-- Persistent MPRIS cover art thumbnail layout
hl.windowrule("pin on, match:title ^(mpris_thumb\\.png)$")


-- =========================================================================
-- MODERN LUA WORKSPACE RULES
-- =========================================================================
-- Binding persistent layouts dynamically to your dedicated HDMI monitor port

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", persistent = true })
