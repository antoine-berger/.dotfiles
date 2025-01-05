{ pkgs, stateVersion, ... }:
{
  nix = {
    package = pkgs.nixVersions.stable;
    extraOptions = ''
      experimental-features = nix-command flakes ca-derivations
    '';
    gc.automatic = true;
  };

  # Dependencies for compiling Python
  # credits: https://semyonsinchenko.github.io/ssinchenko/post/using-pyenv-with-nixos/
  environment.systemPackages = with pkgs; [
    bzip2
    clang
    gnumake
    openssl
    zlib
  ];

  environment.sessionVariables = {
    CC = "clang";
    CXX = "clang++";
    CPPFLAGS = "-I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include -I${pkgs.zlib.dev}/include";
    CXXFLAGS = "-I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include -I${pkgs.zlib.dev}/include";
    CFLAGS = "-I${pkgs.openssl.dev}/include";
    LDFLAGS = "-L${pkgs.bzip2.out}/lib -L${pkgs.openssl.out}/lib -L${pkgs.zlib.out}/lib";
    CONFIGURE_OPTS = "-with-openssl=${pkgs.openssl.dev}";
  };

  system.stateVersion = stateVersion;
}
