{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  fonts.fontconfig.enable = true;

  home = {
    pointerCursor = {
      name = "nordic-cursors";
      package = pkgs.nordic-cursor-theme;
      x11.enable = true;
      gtk.enable = true;
      size = 32;
    };

    sessionVariables.GTK_THEME = "Nordic";

    file = {
      "${config.home.homeDirectory}/.face" = {
        source = ../assets/user-icon.png;
      };
      "${config.home.homeDirectory}/.wallpapers" = {
        source = ../assets/wallpapers;
        recursive = true;
      };
    };
  };
}
