---------------------------
--   HYPRLAND BINDINGS   --
---------------------------

local mainMod = "SUPER"

-- Global submap initializers
hl.dispatch("submap", "global")

---------------------------
--     APPS & SCRIPTS     --
---------------------------
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("waylock"))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("~/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("$menu"))

-- Ghostty & Terminal shortcuts
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/raise-or-run.sh ghostty com.mitchellh.ghostty"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("ghostty -e nano ~/.config/hypr/hyprland.lua")) -- Updated path to Lua file

-- Custom launchers
hl.bind(mainMod .. " + CTRL + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + CTRL + T", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + CTRL + N", hl.dsp.exec_cmd("kate"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("vlc"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd('ghostty --command="hyprctl layers && read"'))

---------------------------
--      SCREENSHOTS      --
---------------------------
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode active --mode output"))
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot --clipboard-only --mode region"))

---------------------------
--    WINDOW MANAGEMENT   --
---------------------------
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + X", hl.dsp.window.toggle_floating())
hl.bind(mainMod .. " + S", hl.dsp.layout.toggle_split())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(1))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen(0))

-- Move active window (Vim directions)
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move("r"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move("u"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move("d"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move("l"))

-- Focus switching
hl.bind(mainMod .. " + H", hl.dsp.window.focus("l"))
hl.bind(mainMod .. " + J", hl.dsp.window.focus("d"))
hl.bind(mainMod .. " + K", hl.dsp.window.focus("u"))
hl.bind(mainMod .. " + L", hl.dsp.window.focus("r"))
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next())

-- Resizing active windows (Uses repeat + locked flags 'el')
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize("20 0"), { flags = "el" })
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize("-20 0"), { flags = "el" })
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize("0 -20"), { flags = "el" })
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize("0 20"), { flags = "el" })

---------------------------
--      WORKSPACES       --
---------------------------
-- Switch to workspace 1-10
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.workspace.go(tostring(i)))
end
hl.bind(mainMod .. " + 0", hl.dsp.workspace.go("10"))

-- Move window to workspace 1-10
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.workspace.move_window(tostring(i)))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.workspace.move_window("10"))

-- Scroll through workspaces (Mouse wheel)
hl.bind(mainMod .. " + mouse_down", hl.dsp.workspace.go("e+1"))
hl.bind(mainMod .. " + mouse_up", hl.dsp.workspace.go("e-1"))

---------------------------
--   MONITORS & MOUSE    --
---------------------------
hl.bind(mainMod .. " + CTRL + L", hl.dsp.monitor.focus("+1"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.monitor.focus("-1"))
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.monitor.move_window("mon:+1"))
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.monitor.move_window("mon:-1"))

-- Dragging (Mouse buttons use the 'm' bind flag)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.move(), { flags = "m" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { flags = "m" })

---------------------------
--    MULTIMEDIA KEYS    --
---------------------------
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { flags = "el" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { flags = "el" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { flags = "el" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { flags = "el" })

-- Playerctl triggers (Locked flag 'l')
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { flags = "l" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { flags = "l" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { flags = "l" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { flags = "l" })

---------------------------
--      LID SWITCH       --
---------------------------
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, enable"'), { flags = "l" })
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd('hyprctl keyword monitor "eDP-1, disable"'), { flags = "l" })
