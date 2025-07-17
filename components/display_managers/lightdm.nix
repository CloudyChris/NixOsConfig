{pkgs, config, lib, ...}:
{

  imports = [
    ../../core/display_protocols/x11.nix
  ];

  services.xserver.displayManager.lightdm = {
    enable = true;
    background = "#191924";
    greeters.gtk = {
      enable = true;
      theme = {
        name = "Nordic";
        package = pkgs.nordic;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-nord;
      };
      cursorTheme = {
        name = "nordic-cursors";
        package = pkgs.nordic-cursor-theme;
      };
      indicators = [
        "~host"
        "~spacer"
        "~language"
        "~spacer"
        "~clock"
        "~spacer"
        "~session"
      ];
      clock-format = "%H:%M";
    };
  };

  # BECAUSE NIX TRIES TO START SHIT ON SWITCH, THIS BREAKS STUFF ON SWITCH
  # systemd.services.display-manager.conflicts = lib.mkIf (config.boot.plymouth.enable) [ "plymouth-quit.service" ];
}
