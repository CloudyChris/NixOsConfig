{config, ...}: {
  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };
    settings = {
      foreground = "#D8DEE9";
      background = "#242933";
      selection_foreground = "#D8DEE9";
      selection_background = "#2E3440";
      url_color = "#88C0D0";
      cursor = "#D8DEE9";
      color0 = "#191D24";
      color8 = "#3B4252";
      color1 = "#BF616A";
      color9 = "#D06F79";
      color2 = "#A3BE8C";
      color10 = "#B1D196";
      color3 = "#EBCB8B";
      color11 = "#F0D399";
      color4 = "#81A1C1";
      color12 = "#88C0D0";
      color5 = "#B48EAD";
      color13 = "#C895BF";
      color6 = "#8FBCBB";
      color14 = "#93CCDC";
      color7 = "#D8DEE9";
      color15 = "#E5E9F0";
    };
  };
}
