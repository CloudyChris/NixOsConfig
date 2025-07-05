{ config, osConfig, ... }:
{
  home.file."${config.home.homedirectory}/.config/evil_i3wm/i3/i3_base" = {
    source = ./i3_base;
    force = true;
  };

  home.file."${config.home.homedirectory}/.config/evil_i3wm/i3/i3_default_binds" = {
    source = ./i3_default_binds;
    force = true;
  };

  home.file."${config.home.homedirectory}/.config/evil_i3wm/i3/i3_style" = {
    source = ./i3_style;
    force = true;
  };

  xsession.windowManager.i3 = {
    enable = osConfig.services.xserver.windowManager.i3.enable;
    config = null;
    startup = [
      {
        command = "eww daemon";
      }
      {
        command = "evil_configure";
        always = true;
      }
    ];
  };
}
