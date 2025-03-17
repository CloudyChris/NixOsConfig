{config, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
    themeFile = "${config.home.homeDirectory}/.config/kitty/nordic.conf";
  };
}
