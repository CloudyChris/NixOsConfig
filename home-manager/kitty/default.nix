{config, ...}: {
  home.file = {
    "${config.home.homeDirectory}/.config/kitty/nordic.conf" = {
      source = ./nordic.conf;
      recursive = true;
    };
  };
}
