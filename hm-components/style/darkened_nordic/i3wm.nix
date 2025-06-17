{ pkgs, lib, config, osConfig, ... }:

let
  global_i3 = osConfig.services.xserver.windowManager.i3.enable;
  home_i3 = config.xsession.windowManager.i3.enable;
in
{
  config = lib.mkIf (global_i3 && home_i3) {
    xsession.windowManager.i3 = {
      extraConfig = ''
        #~ Border
        default_border pixel 2
        gaps inner 10
        gaps outer 10
      '';
    };
  };
}
