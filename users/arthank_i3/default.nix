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
