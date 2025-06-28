{
  pkgs,
  user,
  ...
}: {
  home = {
    username = user;
    packages = with pkgs; [
      alejandra
      ffmpeg
      ffsubsync
      fzf
      mediainfo
      mkbrr
      mkvtoolnix-cli
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
