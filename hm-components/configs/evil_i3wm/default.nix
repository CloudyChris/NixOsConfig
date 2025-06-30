{ pkgs, config, ... }:
{
  imports = [
    ./rofi
    ./eww
    ./config.nix
  ];

  services.clipmenu = {
    enable = true;
    launcher = "rofi";
  };
}
