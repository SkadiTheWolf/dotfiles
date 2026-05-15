{
  description = "milisaur dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    waybar-module-music = {
      url = "github:Andeskjerf/waybar-module-music";
      inputs.unstable.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim/nixos-25.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    unstable,
    home-manager,
    nixvim,
    waybar-module-music,
    ...
  }: let
    system = "x86_64-linux";

    mkHost = hostName:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs hostName;};

        modules = [
          ./hosts/${hostName}/nixos/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs hostName;};

            home-manager.users.skadi = import ./hosts/${hostName}/home-manager/home.nix;
          }
        ];
      };
  in {
    nixosConfigurations = {
      UniPC = unstable.lib.nixosSystem {
        mkHost = "UniPC";
        modules = [
          ({...}: {
            unstable.overlays = [waybar-module-music.overlays.default];
          })
        ];
        GamingPC = mkHost "GamingPC";
      };
    };
  };
}
