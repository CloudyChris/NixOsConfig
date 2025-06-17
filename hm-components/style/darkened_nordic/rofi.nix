{ config, ...}:
{
  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/colors.rasi" = {
    source = ./assets/colors.rasi;
  };
}
