hl.config({
    general = {
        gaps_in = 8,
        gaps_out = 16,
        border_size = 1,

        -- FIXED GRADIENT SYNTAX
        col = {
            active_border = {
                colors = { "rgba(33ccffee)", "rgba(00ff99ee)" },
          angle = 45
            },
            inactive_border = "rgba(595959aa)"
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling",
        no_focus_fallback = true,
    },

    decoration = {
        rounding = 18,
        rounding_power = 2.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            vibrancy = 0.1696,
        },
    },
})
