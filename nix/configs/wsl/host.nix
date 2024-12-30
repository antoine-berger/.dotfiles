{
  inputs,
  pkgs,
  user,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  wsl = {
    enable = true;
    defaultUser = user;
    docker-desktop.enable = true;
  };

  users.users.${user} = {
    shell = pkgs.nushell;
  };

  networking.hostName = "wsl";

  programs.nix-ld.enable = true;
}
