{ config, ...}:
{
  programs.rofi = {
    theme = "${config.home.homeDirectory}/.local/share/rofi/themes/dmenu.rasi";
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/dmenu.rasi" = {
    source = ./dmenu.rasi;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/drun.rasi" = {
    source = ./drun.rasi;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/run.rasi" = {
    source = ./run.rasi;
  };

  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/window.rasi" = {
    source = ./window.rasi;
  };

  home.sessionVariables = {
    ROFI_RUN = "${config.home.homeDirectory}/.local/share/rofi/themes/run.rasi";
    ROFI_DRUN = "${config.home.homeDirectory}/.local/share/rofi/themes/drun.rasi";
    ROFI_DMENU = "${config.home.homeDirectory}/.local/share/rofi/themes/dmenu.rasi";
    ROFI_WIN = "${config.home.homeDirectory}/.local/share/rofi/themes/window.rasi";
  };
}
