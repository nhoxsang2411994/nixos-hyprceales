-- =========================================================================
-- MODERN LUA AUTOSTART ECOSYSTEM (v0.56+)
-- =========================================================================

hl.on("hyprland.start", function ()
-- Launch primary browser silently on Workspace 1
hl.dispatch(hl.dsp.exec_cmd("[workspace 1 silent] " .. browser))

-- System tray network management applet
hl.dispatch(hl.dsp.exec_cmd("nm-applet"))

-- Handle fcitx5 input method server delays cleanly
hl.dispatch(hl.dsp.exec_cmd("sleep 4 && pkill fcitx5"))
hl.dispatch(hl.dsp.exec_cmd("sleep 8 && fcitx5 -d -r"))

-- Universal Wayland Session Manager (UWSM) environment hooks
hl.dispatch(hl.dsp.exec_cmd("uwsm app -- hypridle"))
hl.dispatch(hl.dsp.exec_cmd("uwsm app -- hyprsunset -t 5000"))

-- Main desktop status bar interface
hl.dispatch(hl.dsp.exec_cmd("waybar"))

-- Proton-VPN security keyring secret daemon
hl.dispatch(hl.dsp.exec_cmd("gnome-keyring-daemon --start --components=secrets"))
end)
