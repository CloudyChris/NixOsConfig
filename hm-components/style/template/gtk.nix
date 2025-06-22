{pkgs, config, ...}: {
  # TODO: update to a darker version when time allows (fork and work it boy)
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = config.home.sessionVariables.GTK_THEME;
      package = pkgs.nordic;
    };
    iconTheme = {
      name = config.home.sessionVariables.ICON_THEME;
    };
    cursorTheme = {
      name = config.home.sessionVariables.CURSOR_THEME;
      package = pkgs.nordic-cursor-theme;
    };
  };
}
