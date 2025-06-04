{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    xdg-launch
    xdg-user-dirs
    xdg-dbus-proxy
  ];
}
