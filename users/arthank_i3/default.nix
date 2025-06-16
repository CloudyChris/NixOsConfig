{
  imports = [
    #./configs
    ./programs
    #./style

    ##################### HM-COMPONENTS
    # PROGRAMS
    ../../../hmcomponents/programs/bat.nix
    ../../../hmcomponents/programs/dunst.nix
    ../../../hmcomponents/programs/eww.nix
    ../../../hmcomponents/programs/lmms.nix

    # CONFIGS
    ../../hmcomponents/configs/evil_i3wm

    # STYLE
    ../../hmcomponents/style/darkened_nordic
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
