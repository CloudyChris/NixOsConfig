{pkgs, ...}:
{

  imports = [
    ../../core/display_protocols/x11.nix
  ];

  services.xserver.displayManager.lightdm = {
    enable = true;
    greetes.gtk = {
      enable = true;
    };
  };
}
