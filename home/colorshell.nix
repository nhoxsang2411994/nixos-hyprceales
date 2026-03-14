{ inputs, pkgs, ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };

  
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
    cliphist # clipboard manager
    wireplumber
    fastfetch
    starship
    btop
    jq
    socat
    curl
    nerd-fonts.jetbrains-mono
    pavucontrol
    gobject-introspection
    nerd-fonts.symbols-only
    procps
    libglycin
    glycin-loaders
    gjs
    typescript
    ags
    #widgets dependencies
    astal.apps
    astal.io
    astal.gjs
    astal.astal4
    astal.hyprland
    astal.mpris
    dart-sass
    kdePackages.qt6ct
    libsForQt5.qt5ct
    pywal16
    grim
    slurp
    pnpm
    wl-clipboard
    # hypand dependencies
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprpaper
    hyprsunset
    hypridle
    #polkit_gnome
  ];
}
