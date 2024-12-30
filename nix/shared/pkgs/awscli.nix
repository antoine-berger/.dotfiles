{ adhesive, ... }:
{
  programs.awscli.enable = true;

  programs.awscli.settings = adhesive.awscli.settings;
}
