{
  pkgs,
  user,
  ...
}: {
  home = {
    username = user;
    packages = with pkgs; [
      alejandra
      fzf
      ripgrep
      unzip
    ];
    stateVersion = "24.05";
  };

  xdg.enable = true;

  imports = [
    ./pkgs
  ];
}
