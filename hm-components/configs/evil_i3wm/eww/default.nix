{ config, ... }:
{
  programs.eww = {
    enable = true;
    enableBashIntegration = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/eww/widgets.yuck" = {
    source = ./widgets.yuck;
    force = true;
  };
}
