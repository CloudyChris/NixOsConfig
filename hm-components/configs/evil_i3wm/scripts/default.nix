{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_audio_sinks_eww" = {
    source = ./gen_audio_sinks_eww;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_audio_sources_eww" = {
    source = ./gen_audio_sources_eww;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_eww" = {
    source = ./gen_eww;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_i3" = {
    source = ./gen_i3;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_audio_sinks" = {
    source = ./get_audio_sinks;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_audio_sources" = {
    source = ./get_audio_sources;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_current_monitor" = {
    source = ./get_current_monitor;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_monitors" = {
    source = ./get_monitors;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_volume" = {
    source = ./get_volume;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_i3_workspace" = {
    source = ./i3_workspace;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_dmenu" = {
    source = ./rofi_dmenu;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_drun" = {
    source = ./rofi_drun;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_run" = {
    source = ./rofi_run;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_windows" = {
    source = ./rofi_windows;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_start_i3_bar" = {
    source = ./start_i3_bar;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_configure" = {
    source = ./configure;
    executable = true;
    force = true;
  };

  # adding evil_i3 scripts to path for ease of use
  home.sessionPath = [
    "${config.home.homeDirectory}/.config/evil_i3wm/scripts"
  ];
}
