{
  description = "Personal, modular nix config";
########################################################################################################
  inputs = {
    ################ Nixpkgs channels
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    ################ Libraries
    systems-dep.url = "github:nix-systems/default";
    flake-utils-dep = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems-dep";
    };
    flake-compat-dep = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-parts.url = "github:hercules-ci/flake-parts";

    ################ NixOS utils
    hardware.url = "github:nixos/nixos-hardware/master";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################ Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ################ Modules flakes
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

########################################################################################################
  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    ...
  } @ inputs: let
    inherit (self) outputs;
    # Supported systems for your flake packages, shell, etc.
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    ################ Custom packages
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});

    ################ Formatter
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    ################ Overlays
    overlays = import ./overlays {inherit inputs;};

    ################ Entrypoint
    # `nixos-rebuild --flake .#target`
    nixosConfigurations = {
      "arthank_i3"= nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./targets/arthank_i3

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.arthank = import ./users/arthank_i3;
          }
        ];
      };
    };
  };
}
