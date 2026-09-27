-- =========================================================================
-- MODERN LUA WINDOW RULES (v0.56+)
-- =========================================================================

-- Brave's notification windows float rule
hl.window_rule({
    match = { class = "^$", title = "^$", float = true },
    float = true
})

-- Ignore maximize requests from applications
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize"
})

-- Fix mouse dragging issues with XWayland instances
hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false -- FIXED: Changed 'pinned' to 'pin'
    },
    no_focus = true
})


-- fcitx input method windows layout optimization
hl.window_rule({
    match = { class = "fcitx" },
    pseudo = true
})

-- swayimg picture viewer rules
hl.window_rule({
    match = { class = "^(swayimg)$" },
               float = true,
               center = true,
               size = { 500, 500 },
               animation = "slide",
               opacity = 0.95
})

-- Persistent MPRIS cover art thumbnail layout
hl.window_rule({
    match = { title = "^(mpris_thumb\\.png)$" },
               pin = true -- FIXED: Changed 'pinned = true' to 'pin = true'
})


-- =========================================================================
-- MODERN LUA WORKSPACE RULES
-- =========================================================================
-- Binding persistent layouts dynamically to your dedicated HDMI monitor port

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", persistent = true })
