{pkgs, ...}:
{
  services.xserver = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    xclip
    xorg.libX11
    xorg.xrdb
    xorg.xfs
    xorg.xfd
    xorg.xwd
    xorg.xpr
    xorg.xsm
    xorg.xev
    xorg.xwud
    xorg.xset
    xorg.xmag
    xorg.luit
    xorg.xprop
    xorg.xmore
    xorg.xload
    xorg.xkill
    xorg.xinit
    xorg.xhost
    xorg.xrandr
    arandr
    xorg.imake
    xorg.xvinfo
    xorg.xinput
    xorg.xgamma
    xorg.xcmsdb
    xorg.xkbevd
    xorg.xmodmap
    xorg.xkbcomp
    xorg.xfsinfo
    xorg.viewres
    xorg.smproxy
    xorg.xstdcmap
    xorg.xsetroot
    xorg.xrefresh
    xorg.xmessage
    xorg.xkbprint
    xsettingsd
  ];

  environment.extraInit = ''
    xset s off
    xset -dpms
    xset s noblank
  '';
}
