{ config, ...}:
{
  home.file."${config.home.homeDirectory}/.config/rofi/colors.rasi" = {
    source = ./assets/colors.rasi;
    force = true;
  };
}
