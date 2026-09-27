-- Launch primary browser silently on Workspace 1
-- This reads the global 'browser' variable defined inside your my-programs.lua
hl.exec_once("[workspace 1 silent] " .. browser)

-- System tray and input network applications
hl.exec_once("nm-applet")

-- Handle fcitx5 IME execution loops with processing delays
hl.exec_once("sleep 4 && pkill fcitx5")
hl.exec_once("sleep 8 && fcitx5 -d -r")

-- Universal Wayland Session Manager (UWSM) App Hooks
hl.exec_once("uwsm app -- hypridle")
hl.exec_once("uwsm app -- hyprsunset -t 5000")

-- Status Bar Environment
hl.exec_once("waybar")

-- Security credentials and secret storage daemon hooks for proton-vpn
hl.exec_once("gnome-keyring-daemon --start --components=secrets")
