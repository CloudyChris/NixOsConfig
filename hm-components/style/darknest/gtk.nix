{pkgs, config, ...}: {
  # TODO: update to a darker version when time allows (fork and work it boy)
  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-decoration-layout = "menu:";
    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };
    iconTheme = {
      name = "Papirus-Dark";
    };
    cursorTheme = {
      name = "nordic-cursors";
      package = pkgs.nordic-cursor-theme;
    };
  };
}
