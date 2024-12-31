{ config, ... }:
{
  programs.nushell.enable = true;

  programs.nushell.extraConfig = ''
    $env.config = {
      show_banner: false
      edit_mode: vi
      keybindings: [
        {
          name: tmux_sessionizer
          modifier: control
          keycode: char_f
          mode: [emacs, vi_insert, vi_normal]
          event: {
            send: executehostcommand
            cmd: "tmux-sessionizer.nu ...(ls -a $env.GIT_REPOS_HOME | where type == dir | each { $in.name })"
          }
        }
      ]
    }
  '';

  programs.nushell.shellAliases = {
    ll = "ls -l";
    la = "ls -la";
    v = "nvim";
    g = "git";
    ga = "git add";
    gaa = "git add --all";
    gap = "git add --patch";
    gc = "git commit";
    gca = "git commit --amend";
    gco = "git checkout";
    gcom = "git checkout main";
    gcb = "git checkout -b";
    gb = "git branch";
    gba = "git branch -a";
    gbd = "git branch -d";
    gbD = "git branch -D";
    gcount = "git shortlog -sn";
    gd = "git diff";
    gdc = "git diff --cached";
    gdt = "git difftool";
    gg = "git log --oneline --graph --decorate";
    gga = "git log --oneline --graph --decorate --all";
    ggag = "git log --oneline --graph --decorate --all --grep";
    ggagp = "git log --oneline --graph --decorate --all --grep --pickaxe-all";
    ggb = "git log --oneline --graph --decorate --branches";
    ggc = "git log --oneline --graph --decorate --date=short --pretty=format:\"%Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Creset %C(bold blue)<%an>%Creset\" --abbrev-commit";
    ggcA = "git log --oneline --graph --decorate --date=short --pretty=format:\"%Cgreen%ad %Cred%h%Creset -%C(yellow)%d%Creset %s %Cblue[%cn]%Creset %C(bold blue)<%an>%Creset\" --abbrev-commit --all";
    gs = "git status";
    gss = "git status -s";
    gsw = "git status -sb";
    gl = "git pull";
    gu = "git push";
    guu = "git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)";
  };

  programs.nushell.extraEnv = ''
    use std "path add"
    # Local bin
    path add $"($env.HOME | path join ".local/bin")"

    # ssh-agent
    do --env {
        let ssh_agent_file = (
            $nu.temp-path | path join $"ssh-agent-($env.USER).nuon"
        )

        if ($ssh_agent_file | path exists) {
            let ssh_agent_env = open ($ssh_agent_file)
            if ($"/proc/($ssh_agent_env.SSH_AGENT_PID)" | path exists) {
                load-env $ssh_agent_env
                return
            } else {
                rm $ssh_agent_file
            }
        }

        let ssh_agent_env = ^ssh-agent -c
            | lines
            | first 2
            | parse "setenv {name} {value};"
            | transpose --header-row
            | into record
        load-env $ssh_agent_env
        $ssh_agent_env | save --force $ssh_agent_file
    }
  '';

  programs.nushell.environmentVariables = {
    EDITOR = "nvim";
    GIT_REPOS_HOME = "${config.home.homeDirectory}/git";
  };
}
