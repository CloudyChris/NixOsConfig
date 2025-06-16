{
  imports = [
    #./configs
    ./programs
    #./style

    ##################### USER-COMPONENTS
    # PROGRAMS
    ../../../user-components/programs/bat.nix
    ../../../user-components/programs/dunst.nix
    ../../../user-components/programs/eww.nix
    ../../../user-components/programs/lmms.nix

    # CONFIGS
    ../../user-components/configs/evil_i3wm

    # STYLE
    ../../user-components/style/darkened_nordic
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
