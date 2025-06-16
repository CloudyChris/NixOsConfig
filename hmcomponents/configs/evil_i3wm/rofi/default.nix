{ config, ...}:
{
  programs.rofi = {
    theme = "${config.home.homeDirectory}/.local/share/rofi/themes/dmenu.rasi";
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/dmenu.rasi" = {
    source = ./dmenu.rasi;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/drun.rasi" = {
    source = ./drun.rasi;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/run.rasi" = {
    source = ./run.rasi;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/window.rasi" = {
    source = ./window.rasi;
    force = true;
  };
}
