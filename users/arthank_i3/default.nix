{
  imports = [
    #./configs
    ./programs
    #./style

    ##################### HM-COMPONENTS
    # PROGRAMS
    ../../hm-components/programs/dunst.nix

    # CONFIGS
    ../../hm-components/configs/evil_i3wm

    # STYLE
    ../../hm-components/style/darkened_nordic
  ];

  home = {
    username = "arthank";
    homeDirectory = "/home/arthank";
    sessionVariables = {
      EDITOR = "emacs";
      TERMINAL = "alacritty";
      FILEX = "thunar";
      BROWSER = "firefox";
      ICON_THEME = "Papirus-Dark";
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.stateVersion = "25.05";
}
