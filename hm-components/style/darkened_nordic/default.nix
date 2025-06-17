{ pkgs, config, ...}:
{
  imports = [
    ./i3wm.nix
    ./cursors.nix
    ./xresources.nix

    ./gtk.nix
    ./qt.nix

    ./alacritty.nix
    ./kitty.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    papirus-nord
  ];
}
