{ pkgs, config, ...}:
{
  imports = [
    ./i3wm.nix
    ./xresources.nix

    ./alacritty.nix
    ./kitty.nix
    ./rofi.nix
  ];
}
