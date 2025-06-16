{ pkgs, lib, config, ... }:

let
  global_i3 = config.services.xserver.windowManager.i3.enable;
  home_i3 = config.xsession.windowManager.i3.enable;
in
{
  config = lib.mkif (global_i3 && home_i3) {
    xsession.windowManager.i3 = {
      package = pkgs.i3-rounded;
      extraConfig = ''
        #~ Border
        border_radius = 10
        default_border pixel 2
        gaps inner 10
        gaps outer 10
      '';
    };
  };
}
