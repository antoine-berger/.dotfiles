{ pkgs, stateVersion, ... }:
{
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations
    '';
    gc.automatic = true;
  };

  system.stateVersion = stateVersion;
}
