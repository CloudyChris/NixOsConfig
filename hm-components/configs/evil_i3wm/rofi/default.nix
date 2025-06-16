{ config, ...}:
{
  home.file."${config.home.homeDirectory}/.config/rofi/drun.rasi" = {
    source = ./drun.rasi;
    force = true;
  };
}
