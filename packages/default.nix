{
  pkgs,
  inputs,
  rootPath,
  ...
}:
{
  imports = [
    ./hyprland.nix
#     ./colorshell.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
  ];

  # Programs
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 10";
      flake = rootPath;
    };

  };

  # Services
  services = {
    upower.enable = true; # Required by Caelestia
    power-profiles-daemon.enable = true;



    # nixai = {
    #   enable = true;
    #   mcp.enable = false;
    # };
  };

  # All other packages
  environment.systemPackages = with pkgs; [
    # keep-sorted start
    kitty
    # keep-sorted end
  ];

}
