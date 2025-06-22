{pkgs, ...}:
{
  imports = [
    ../../hm-components/style/darknest
    ../../hm-components/style/template
  ];

  home.packages = with pkgs; [
    # qt & gtk
    nordic

    # cursors
    nordic-cursor-theme

    # icons
    papirus-nord
  ];
}
