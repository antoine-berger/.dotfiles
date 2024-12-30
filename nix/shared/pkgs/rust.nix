{ pkgs, ... }:
{
  home.packages = with pkgs; [ rustup ];

  programs.nushell.extraEnv = ''
    use std "path add"

    path add $"($env.HOME | path join ".cargo/bin")"
  '';
}
