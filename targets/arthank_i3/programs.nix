{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    glib
    util-linux

    #shell utils
    inxi
    pciutils
    toybox

    # net
    ipfetch
    curl
    wget

    # notifications
    zenity

    # resource monitor
    htop

    # compat
    wine

    # glx
    glxinfo
  ];
}
