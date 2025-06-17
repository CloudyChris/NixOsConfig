{ pkgs, lib, config, osConfig, ... }:

let
  global_i3 = osConfig.services.xserver.windowManager.i3.enable;
  home_i3 = config.xsession.windowManager.i3.enable;
in
{
  config = lib.mkIf (global_i3 && home_i3) {
    xsession.windowManager.i3 = {
      config = null;
      extraConfig = ''
        #~ Border
        font JetBrainsMono Nerd Font 8
        default_border pixel 2
        default_floating_border pixel 2

        hide_edge_borders none

        gaps inner 10
        gaps outer 10
      '';
    };
  };
}
