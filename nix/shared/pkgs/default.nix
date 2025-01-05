{ ... }:
{
  imports = [
    ./aws-sam-cli.nix
    ./aws-vault.nix
    ./awscli.nix
    ./carapace.nix
    ./gh.nix
    ./git.nix
    ./gpg.nix
    ./lazygit.nix
    ./mise.nix
    ./neovim.nix
    ./nushell.nix
    ./pipenv.nix
    ./starship.nix
    ./tmux.nix
    ./uv.nix
    # ./zellij.nix
    ./zoxide.nix
  ];
}
