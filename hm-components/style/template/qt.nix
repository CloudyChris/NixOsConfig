{pkgs, config, ...}: {
  # TODO: update to a darker version when time allows (fork and work it boy)
  qt = {
    enable = true;
    style = {
      name = config.home.sessionVariables.KDE_THEME;
    };
  };
}
