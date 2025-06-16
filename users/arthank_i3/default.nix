{
  imports = [
    ./configs
    ./programs
    ./style

    ##################### COMMON
    # PROGRAMS
    ../common/programs/bat.nix
    ../common/programs/dunst.nix
    ../common/programs/eww.nix
    ../common/programs/lmms.nix

    # CONFIGS
    ../common/configs/evil_i3wm

    # STYLE
    ../common/style/darkened_nordic
  ];

  home = {
    username = "arthank";
    homeDirectory = "/home/arthank";
    sessionVariables = {
      EDITOR = "emacs";
      TERMINAL = "alacritty";
      FILEX = "thunar";
      BROWSER = "librewolf";
      ICON_THEME = "Papirus Dark";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
