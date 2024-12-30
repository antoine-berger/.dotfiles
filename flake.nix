{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    systems.url = "github:nix-systems/default";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    adhesive.url = "path:./nix/adhesive";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, adhesive, ... }:
    let
      stateVersion = "24.05";
      utils = import ./nix/utils.nix
        {
          inherit inputs self nixpkgs home-manager adhesive stateVersion;
        };
    in
    {
      nixosConfigurations = {
        wsl = utils.mkConfiguration {
          architecture = "x86_64-linux";
          configurationFolder = ./nix/configs/wsl;
          isContainer = true;
        };
      };
    };
}
