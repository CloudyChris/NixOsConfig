{ config, ...}:
{
  home.file."${config.home.homeDirectory}/.config/rofi/colors.rasi" = {
    source = ./rofi/colors.rasi;
    force = true;
  };
}
