{config, ...}: {
  home.file = {
    "${config.home.homeDirectory}/.config/awesome" = {
      source = ./awesome_wm_config;
      recursive = true;
    };
    "${config.home.homeDirectory}/.config/awesome/src/assets/userpfp/arthank.png" = {
      source = ../assets/user-icon.png;
    };
  };
}
