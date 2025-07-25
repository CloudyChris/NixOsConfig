{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_configure" = {
    source = ./evil_configure;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_audio_sinks_eww" = {
    source = ./evil_gen_audio_sinks_eww;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_audio_sources_eww" = {
    source = ./evil_gen_audio_sources_eww;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_eww_yuck" = {
    source = ./evil_gen_eww_yuck;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_eww_scss" = {
    source = ./evil_gen_eww_scss;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_gen_i3" = {
    source = ./evil_gen_i3;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_active_workspace" = {
    source = ./evil_get_active_workspace;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_audio_sinks" = {
    source = ./evil_get_audio_sinks;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_audio_sources" = {
    source = ./evil_get_audio_sources;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_current_monitor" = {
    source = ./evil_get_current_monitor;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_i3_mode" = {
    source = ./evil_get_i3_mode;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_monitors" = {
    source = ./evil_get_monitors;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_sink_volume" = {
    source = ./evil_get_sink_volume;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_get_source_volume" = {
    source = ./evil_get_source_volume;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_i3_workspace" = {
    source = ./evil_i3_workspace;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_nix_boot" = {
    source = ./evil_nix_boot;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_nix_rebuild" = {
    source = ./evil_nix_rebuild;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_dmenu" = {
    source = ./evil_rofi_dmenu;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_drun" = {
    source = ./evil_rofi_drun;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_run" = {
    source = ./evil_rofi_run;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_rofi_windows" = {
    source = ./evil_rofi_windows;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_screenshot_fullscreen" = {
    source = ./evil_screenshot_fullscreen;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_screenshot_region" = {
    source = ./evil_screenshot_region;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_screenshot_window" = {
    source = ./evil_screenshot_window;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_start_i3_bar" = {
    source = ./evil_start_i3_bar;
    executable = true;
    force = true;
  };

  home.file."${config.home.homeDirectory}/.config/evil_i3wm/scripts/evil_whichkey" = {
    source = ./evil_whichkey;
    executable = true;
    force = true;
  };

  # adding evil_i3 scripts to path for ease of use
  home.sessionPath = [
    "${config.home.homeDirectory}/.config/evil_i3wm/scripts"
  ];
}
