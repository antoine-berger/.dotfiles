{ ... }:
{
  programs.zellij.enable = true;

  # Using programs.zellij.settings doesn't support KDL
  # format very well, so we'll just use the file directly
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
}
