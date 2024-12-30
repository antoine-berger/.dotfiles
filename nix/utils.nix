{ inputs, self, nixpkgs, home-manager, adhesive, stateVersion}:
{
  mkConfiguration =
    { architecture
    , configurationFolder
    , user ? adhesive.user
    , isContainer ? false
    }:
    nixpkgs.lib.nixosSystem {
      pkgs = import nixpkgs {
        localSystem = architecture;
      };

      specialArgs = {
        inherit inputs adhesive stateVersion user isContainer;
      };

      modules = [
	      ./shared/host.nix
        "${configurationFolder}/host.nix"

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs self adhesive stateVersion user; };
          home-manager.users."${user}" = { ... }: {
            imports = [
              ./shared/home.nix
              "${configurationFolder}/home.nix"
            ];
          };
        }
      ];
    };
}
