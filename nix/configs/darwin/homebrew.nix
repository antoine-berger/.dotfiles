{...}: {
  homebrew = {
    enable = true;
    global = {
      autoUpdate = true;
    };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };
    casks = [
      "alcove"
      "appcleaner"
      "clop"
      "discord"
      "docker"
      "flux"
      "firefox"
      "ghostty"
      "ibkr"
      "karabiner-elements"
      "latest"
      "lookaway"
      "middleclick"
      "proton-drive"
      "proton-mail-bridge"
      "proton-pass"
      "protonvpn"
      "raycast"
      "slack"
      "screen-studio"
      "shottr"
      "spotify"
      "tradingview"
      "vanilla"
      "zen-browser"
      "zoom"
    ];
    masApps = {
      "Dropover - Easier Drag & Drop" = 1355679052;
      "Hand Mirror" = 1502839586;
      ScreenBrush = 1233965871;
    };
  };
}
