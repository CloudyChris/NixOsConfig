{ pkgs, config, ... }:
{
  imports = [
    ./rofi
    #./eww
    ./config.nix
  ];

  home.packages = with pkgs; [
    clipmenu
  ];
}
