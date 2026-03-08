{
  pkgs,
  config,
  overlays,
  rootPath,
  ...
}:
let
  dotfileUtils = (import ./dotfiles { inherit pkgs config; });
  inherit (dotfileUtils) mkSymlinks;
  dotfiles = "${rootPath}/home/dotfiles";
in
{
  imports = [
#     ./other.nix
    ./caelestia.nix
    ./shell/zsh.nix
    ./shell/zoxide.nix
    ./ghostty.nix
#     ./vicinae.nix
#     ./jj.nix
  ];

  nixpkgs = { inherit overlays; };

  home = {
    username = "nhoxsang2411994";
    homeDirectory = "/home/nhoxsang2411994";
    stateVersion = "25.11";
  };


  # Symlink every file in `./dotfiles/dot-config` to `~/.config/`
  xdg.configFile = mkSymlinks ./dotfiles/dot-config "${dotfiles}/dot-config";

  # Symlink every file in `./dotfiles/home/` to `~/`
  home.file = mkSymlinks ./dotfiles/home "${dotfiles}/home";

  # Default applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "org.kde.dolphin.desktop";
      "application/pdf" = "sioyek.desktop";
      "x-scheme-handler/http" = "firefox-brower.desktop";
      "x-scheme-handler/https" = "firefox-brower.desktop";
    };
  };
}
