{ adhesive, ... }:
{
  programs.git.enable = true;

  programs.git.extraConfig = {
    credential = {
      credentialStore = "gpg";
    };
    user = {
      name = adhesive.git.name;
      email = adhesive.git.email;
      signingKey = adhesive.git.signingKey;
    };
    credential.helper = adhesive.git.credentialHelper;
    commit = {
      gpgSign = true;
    };
    gpg = {
      format = "ssh";
    };
    pull = {
      rebase = true;
    };
    push = {
      autoSetupRemote = true;
    };
    init = {
      defaultBranch = "main";
    };
  };
}
