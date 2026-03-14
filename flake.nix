{
  description = "A caelestia-nix test";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    #caelestia-shell.url = "github:caelestia-dots/shell";
    #caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";
    #caelestia-cli.url = "github:caelestia-dots/cli";
    #caelestia-cli.inputs.nixpkgs.follows = "nixpkgs";

    colorshell.url = "github:retrozinndev/colorshell";
    colorshell.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #quickshell.url = "github:quickshell-mirror/quickshell";
    #quickshell.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs @ {
    self,
    nixpkgs, home-manager,
    ...
  }: let
    overlays = import ./overlays { inherit inputs; } ;
    system = "x86_64-linux";
    specialArgs = { inherit inputs overlays username rootPath; };
    username = "nhoxsang2411994";
    rootPath = "/home/nhoxsang2411994/.config/nixos";
  in {
    nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = specialArgs // { hostname = "nixos"; };
          modules = [ ./configuration.nix
            ./packages
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = specialArgs;
                #useGlobalPkgs = true; # disabled because nixpkgs is blocked when this is enabled
                useUserPackages = true;
                backupFileExtension = "backup";
                users.nhoxsang2411994 = import ./home;
              };
            }
          ];
        };

      };
#     homeConfigurations = let
#         config = {
#           pkgs = nixpkgs.legacyPackages.${system};
#           extraSpecialArgs = specialArgs;
#         };
#       in {
#         "${username}@nixos" = inputs.home-manager.lib.homeManagerConfiguration
#           (config // { modules = [ ./home ]; });
#
#     };
#     homeConfigurations."nhoxsang2411994@nixos" = inputs.home-manager.lib.homeManagerConfiguration {
#       inherit pkgs;
#       modules = [./home.nix inputs.caelestia-nix.homeManagerModules.default];
#     };
  };
}
