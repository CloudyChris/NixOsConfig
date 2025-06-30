{pkgs, ...}:
{

  imports = [
    ../../core/display_protocols/x11.nix
  ];

  services.xserver.displayManager.lightdm = {
    enable = true;
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
}
