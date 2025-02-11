{user, ...}: {
  home.homeDirectory = "/home/${user}";

  imports = [
    ./pkgs
  ];
}
