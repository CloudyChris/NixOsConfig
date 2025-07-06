{ pkgs, config, ...}:
{
  imports = [
    ./xresources.nix

    ./alacritty.nix
    ./kitty.nix
    ./rofi.nix
  ];
}
