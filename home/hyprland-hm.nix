{ pkgs, ... }: {
  wayland.windowManager.hyprland.systemd.enable = false;
  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  services.hyprpolkitagent = {
    enable = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true; # Adds shell aliases
    shellWrapperName = "y";       # Use 'y' to launch with shell tracking

    settings = {
      manager = {
        show_hidden = true;
        sort_by = "mtime";
      };
    };
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
    pywal16
    hypridle
    hyprlock
    hyprpicker
    hyprpaper
    pavucontrol
    #polkit_gnome
    wl-clipboard
    rofi
    swayimg
    wev
    glib # Provides the 'gio' command
  ];
}
