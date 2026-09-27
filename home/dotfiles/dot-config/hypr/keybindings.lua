
-- APPS & SCRIPTS
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("waylock"))
hl.bind("SUPER + COMMA", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind("SUPER + P", hl.dsp.exec_cmd("$menu"))

-- Terminal shortcuts
hl.bind("SUPER + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/raise-or-run.sh ghostty com.mitchellh.ghostty"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd("ghostty -e nano ~/.config/hypr/hyprland.lua"))

-- Custom launchers
hl.bind("SUPER + CTRL + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + CTRL + W", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd("kate"))
hl.bind("SUPER + V", hl.dsp.exec_cmd("vlc"))
hl.bind("SUPER + period", hl.dsp.exec_cmd("steam"))
hl.bind("SUPER + I", hl.dsp.exec_cmd('ghostty --command="hyprctl layers && read"'))

-- SCREENSHOTS
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode active --mode output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode region"))

-- WINDOW MANAGEMENT
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + X", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))

-- Move active window (Vim directions)
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))

-- Focus switching
-- FOCUS SWITCHING (FIXED SYNTAX)
-- FOCUS SWITCHING (FIXED SYNTAX)
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Tab", hl.dsp.window.cycle_next()) -- cycle_next stays under window


-- Resizing active windows
-- RESIZING ACTIVE WINDOWS (FIXED SYNTAX)
hl.bind("SUPER + ALT + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind("SUPER + ALT + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })


-- WORKSPACES (1-9)
for i = 1, 9 do
    -- Switch to workspace i using hl.dsp.focus
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))

    -- Move active window to workspace i remains under the window sub-table
    hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
    end

    -- Workspace 10 (0 Key)
    hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
    hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

    -- Mouse Scrolling (Keep as strings for relative jumps)
    hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

    -- MONITORS & MOUSE
    hl.bind("SUPER + CTRL + L", hl.dsp.focus({ monitor = "+1" }))
    hl.bind("SUPER + CTRL + H", hl.dsp.focus({ monitor = "-1" }))

    -- Move the active window to the next/previous monitor remains under the window sub-table
    hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.window.move({ monitor = "+1" }))
    hl.bind("SUPER + CTRL + SHIFT + H", hl.dsp.window.move({ monitor = "-1" }))

    -- Left Click + Drag moves the window
    hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

    -- Right Click + Drag resizes the window
    hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

    -- MULTIMEDIA KEYS
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { flags = "el" })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { flags = "el" })
    hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { flags = "el" })
    hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { flags = "el" })

    hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { flags = "l" })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { flags = "l" })
    hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { flags = "l" })
    hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { flags = "l" })

    -- LID SWITCH
    hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, enable"'), { flags = "l" })
    hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable"'), { flags = "l" })
