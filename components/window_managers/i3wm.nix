{config, pkgs, ...}:
{

  imports = [
    ../../core/display_protocols/x11.nix
    ../../core/x_compositors/picom.nix
  ];

  environment.pathsToLink = [ "/libexec" ];
  services = {
    xserver.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-rounded;
    };
    displayManager = {
      defaultSession = "none+i3";
    };
  };
}
