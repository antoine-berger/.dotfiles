{ ... }:
{
  programs.zellij.enable = true;
  
  programs.zellij.settings = {
    simplified_ui = true;
    theme = "catppuccin-macchiato";
    default_mode = "locked";
    default_shell = "nu";
    pane_frames = false;
  };
}
