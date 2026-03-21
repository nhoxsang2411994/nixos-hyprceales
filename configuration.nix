# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:{
 imports = [ ./hosts/nixos/hardware-configuration.nix ];

 # Bootloader.
 boot.loader.systemd-boot.enable = true;
 boot.loader.efi.canTouchEfiVariables = true;

 networking.hostName =  "nixos"; # Define your hostname.
 # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

 # Configure network proxy if necessary
 # networking.proxy.default = "http://user:password@proxy:port/";
 # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

 # Enable opengl
 hardware = {
   xone.enable = true;
   graphics = {
     enable = true;
   };
 };

 # Enable networking
 networking.networkmanager.enable = true;
 networking.dhcpcd.extraConfig = "nohook resolv.conf";
#  networking.defaultGateway = "192.168.1.1";
 networking.nameservers = [
#    "8.8.8.8"
#    "8.8.4.4"
#    "23.46.197.62"
#    "118.68.80.100"
   "127.0.0.1"
   "::1"
 ];
 networking.networkmanager.dns = "none";
 services.resolved.enable = false;

# hardware.bluetooth.enable = true;
# hardware.bluetooth.powerOnBoot = true;
# services.blueman.enable = true;

 # Set your time zone.
 time.timeZone = "Asia/Ho_Chi_Minh";

 # Enable encrypted dns
 services.dnscrypt-proxy = {
   enable = true;
   settings = {
     ipv6_servers = true;
     require_dnssec = true;

     query_log.file = "/var/log/dnscrypt-proxy/query.log";
     sources.public-resolvers = {
       urls = [
         "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
         "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
       ];
       cache_file = "/var/cache/dnscrypt-proxy/public-resolvers.md";
       minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
     };

     # You can choose a specific set of servers from https://github.com/DNSCrypt/dnscrypt-resolvers/blob/master/v3/public-resolvers.md
    server_names = [
    #   "google"
    #   "cloudflare"
    #   "google-ipv6"
    #   "cloudflare-ipv6"
       "doh.tiar.app"
    ];
   };
 };
 systemd.services.dnscrypt-proxy2.serviceConfig = {
   StateDirectory = "dnscrypt-proxy";
 };

 # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";

 i18n.extraLocaleSettings = {
   LC_ADDRESS = "vi_VN";
   LC_IDENTIFICATION = "vi_VN";
   LC_MEASUREMENT = "vi_VN";
   LC_MONETARY = "vi_VN";
   LC_NAME = "vi_VN";
   LC_NUMERIC = "vi_VN";
   LC_PAPER = "vi_VN";
   LC_TELEPHONE = "vi_VN";
   LC_TIME = "vi_VN";
 };

 # Enable an IME,i.e. ibus
 services.xserver.desktopManager.runXdgAutostartIfNone = true; # wiki https://wiki.nixos.org/wiki/Fcitx5#Setup
 i18n.inputMethod = {
   type = "fcitx5";
   enable = true;
   fcitx5.addons = with pkgs; [ /* any engine you want, for example */
     fcitx5-bamboo
     fcitx5-mozc
     fcitx5-gtk
   ];
   ibus.waylandFrontend = true;
 };

 # Enable the X11 windowing system.
 # You can disable this if you're only using the Wayland session.
 services.xserver.enable = false;

 # Shell
 users.defaultUserShell = pkgs.zsh;
 programs.zsh.enable = true;
 programs.fish.enable = true;

 # Enable the KDE Plasma Desktop Envir  onment.
 services.displayManager.sddm.enable = true;
 services.desktopManager.plasma6.enable = true;
 services.displayManager.sddm.theme = "sddm-astronaut-theme";

 # Configure keymap in X11
 services.xserver.xkb = {
   layout = "us";
   variant = "";
 };

 # Enable CUPS to print documents.
 services.printing.enable = true;

 # Enable sound with pipewire.
 services.pulseaudio.enable = false;
 security.rtkit.enable = true;
 services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;
   # If you want to use JACK applications, uncomment this
   #jack.enable = true;

   # use the example session manager (no others are packaged yet so this is enabled by default,
   # no need to redefine it in your config for now)
   #media-session.enable = true;
 };

 # Enable touchpad support (enabled default in most desktopManager).
 # services.xserver.libinput.enable = true;

 # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.nhoxsang2411994 = {
   isNormalUser = true;
   description = "nhoxsang2411994";
   extraGroups = [ "networkmanager" "wheel" "video" ];
   packages = with pkgs; [
     kdePackages.kate
   #  thunderbird
   ];
 };

 # Install firefox.
 programs.firefox.enable = true;

 # Allow unfree packages
 nixpkgs.config.allowUnfree = true;

 # Enable flakes and other experimental features
 nix.settings.experimental-features = ["nix-command" "flakes" "pipe-operators"];
 # Environment variables
 environment.sessionVariables = {
   XDG_CACHE_HOME = "$HOME/.cache"; #colorshell requires this
   XDG_CONFIG_HOME = "$HOME/.config";
   XDG_DATA_HOME = "$HOME/.local/share";
   XDG_STATE_HOME = "$HOME/.local/state";
   GDK_BACKEND = "wayland,x11,*"; # GTK: Use Wayland if available; if not, try X11 and then any other GDK backend.
   QT_QPA_PLATFORM = "wayland;xcb"; # Qt: Use Wayland if available, fall back to X11 if not.
   SDL_VIDEODRIVER = "wayland"; # Run SDL2 applications on Wayland. Remove or set to x11 if games that provide older versions of SDL cause compatibility issues
   CLUTTER_BACKEND = "wayland"; # Clutter package already has Wayland enabled, this variable will force Clutter applications to try and use the Wayland backend
   QT_WAYLAND_DISABLE_WINDOWDECORATION = 1; #Disables window decorations on Qt applications
   QT_QPA_PLATFORMTHEME = "qt6ct"; #Tells Qt based applications to pick your theme from qt6ct, use with Kvantum
 };

 # List packages installed in system profile. To search, run:
 # $ nix search wget
 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   curl
   git
   #qbittorrent
   #megasync
   vlc
   ocs-url
   catppuccin-kvantum
   #kdePackages.sddm-kcm
   anki-bin
   mpv-unwrapped
   protontricks
   kdePackages.alligator
   tor-browser
   protonvpn-gui
   mangohud
   gamescope
   sddm-astronaut
   kdePackages.qtmultimedia
   kdePackages.qtstyleplugin-kvantum
   gruvbox-kvantum
   krita
   libwacom
   xf86_input_wacom
   # customized flake packages:
 ];


 # fonts
 fonts = {
   packages = with pkgs; [
     wqy_zenhei
     noto-fonts
     noto-fonts-color-emoji
     noto-fonts-cjk-sans
   ];

 fontDir.enable = true;
 fontconfig.enable = true;
 };


 programs = {
   #sway.enable = true;
   steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
   };
   gamemode.enable = true;
 };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
