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
        "~clock"
        "~spacer"
        "~language"
        "~session"
      ];
      clock-format = "%H:%M";
    };
  };
}
