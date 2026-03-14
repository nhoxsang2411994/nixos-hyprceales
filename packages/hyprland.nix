{ pkgs, ... }: {
  programs = {
    hyprland = {
      enable = true; 
      withUWSM = true;
      xwayland.enable = true;
    };
  };

  services.displayManager.sddm = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [ brightnessctl hyprshot playerctl ];
}
