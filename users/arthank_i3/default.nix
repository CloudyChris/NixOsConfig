{
  imports = [
    ./configs
    ./programs
    ./style
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
      CURSOR_THEME = "nordic-cursors";
      GTK_THEME = "Nordic";
      KDE_THEME = "Nordic";
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
