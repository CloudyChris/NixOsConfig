{ pkgs, osConfig, ...}:
{
  home.packages = with pkgs; [
    nordic-cursor-theme
  ];
}
