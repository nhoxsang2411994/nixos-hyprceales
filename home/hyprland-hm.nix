{ pkgs, ... }: {
  wayland.windowManager.hyprland.systemd.enable = false;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  services.hyprpolkitagent = {
    enable = true;
  };

  home.packages = with pkgs; [
    app2unit
    btop
    cava
    kdePackages.qt6ct
    libsForQt5.qt5ct
    brightnessctl
    hyprshot
    playerctl
    hypridle
    hyprlock
    hyprpicker
    pavucontrol
    #polkit_gnome
    wl-clipboard
  ];
}
