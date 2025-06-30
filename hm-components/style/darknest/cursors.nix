{ pkgs, osConfig, ...}:
{
  home.packages = with pkgs; [
    nordic-cursor-theme
  ];

  osConfig.xdg.icons.fallbackCursorThemes = ["nordic-cursors"];
}
