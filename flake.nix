{
  description = "milisaur dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    unstable,
    home-manager,
    nixvim,
    ...
  }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    unstable = import unstable {
      inherit system;
      config.allowUnfree = true;
    } 

    hades = pkgs.callPackage ./pkgs/hades.nix {
      jdk8 = pkgs.jdk8;
    };

    asm-simulator = pkgs.callPackage ./pkgs/asm-simulator.nix {
      jdk21 = pkgs.jdk21;
    };

    mars-mips = pkgs.callPackage ./pkgs/mars-mips.nix {
      jdk8 = pkgs.jdk8;
    };

    mkHost = hostName:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs hostName mars-mips hades asm-simulator unstable;};

        modules = [
          ./hosts/${hostName}/nixos/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs hostName mars-mips hades asm-simulator unstable;};

            home-manager.users.skadi = import ./hosts/${hostName}/home-manager/home.nix;
          }
        ];
      };
  in {
    nixosConfigurations = {
      UniPC = mkHost "UniPC";
      GamingPC = mkHost "GamingPC";
    };
  };
}
