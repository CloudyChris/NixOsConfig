{ config, ...}:
{
  xresources.properties = {
      ####### GENERAL
      "Xcursor.theme" = config.home.sessionVariables.CURSOR_THEME;

      ####### DARKNEST PALETTE
      "*.black0" = config.colorsh.black0;
      "*.black1" = config.colorsh.black1;
      "*.black2" = config.colorsh.black2;

      "*.gray0" = config.colorsh.gray0;
      "*.gray1" = config.colorsh.gray1;
      "*.gray2" = config.colorsh.gray2;
      "*.gray3" = config.colorsh.gray3;
      "*.gray4" = config.colorsh.gray4;
      "*.gray5" = config.colorsh.gray5;

      "*.white0" = config.colorsh.white0;
      "*.white1" = config.colorsh.white1;
      "*.white2" = config.colorsh.white2;
      "*.white3" = config.colorsh.white3;
      "*.white4" = config.colorsh.white4;

      "*.blue" = config.colorsh.blue;
      "*.blue_b" = config.colorsh.blue_b;
      "*.blue_d" = config.colorsh.blue_d;

      "*.cyan" = config.colorsh.cyan;
      "*.cyan_b" = config.colorsh.cyan_b;
      "*.cyan_d" = config.colorsh.cyan_d;

      "*.red" = config.colorsh.red;
      "*.red_b" = config.colorsh.red_b;
      "*.red_d" = config.colorsh.red_d;

      "*.orange" = config.colorsh.orange;
      "*.orange_b" = config.colorsh.orange_b;
      "*.orange_d" = config.colorsh.orange_d;

      "*.yellow" = config.colorsh.yellow;
      "*.yellow_b" = config.colorsh.yellow_b;
      "*.yellow_d" = config.colorsh.yellow_d;

      "*.green" = config.colorsh.green;
      "*.green_b" = config.colorsh.green_b;
      "*.green_d" = config.colorsh.green_d;

      "*.magenta" = config.colorsh.magenta;
      "*.magenta_b" = config.colorsh.magenta_b;
      "*.magenta_d" = config.colorsh.magenta_d;

      ####### XRESOURCE COLORS
      "*.accent_1" = config.colorsh.accent_1;
      "*.accent_2" = config.colorsh.accent_2;

      "*.foreground" = config.colorsh.foreground;
      "*.foreground_d" = config.colorsh.foreground_d;
      "*.background" = config.colorsh.background;
      "*.background_b" = config.colorsh.background_b;

      "*.selection_foreground" = config.colorsh.selection_foreground;
      "*.selection_background" = config.colorsh.selection_background;

      "*.cursorColor" = config.colorsh.accent_1;
      "*.url_color" = config.colorsh.url_color;

      # black
      "*.color0" = config.colorsh.black0;
      "*.color8" = config.colorsh.gray2;

      # red
      "*.color1" = config.colorsh.red;
      "*.color9" = config.colorsh.red_b;

      # green
      "*.color2" = config.colorsh.green;
      "*.color10" = config.colorsh.green_b;

      # yellow
      "*.color3" = config.colorsh.yellow;
      "*.color11" = config.colorsh.yellow_b;

      # blue
      "*.color4" = config.colorsh.blue;
      "*.color12" = config.colorsh.blue_b;

      # magenta
      "*.color5" = config.colorsh.magenta;
      "*.color13" = config.colorsh.magenta_b;

      # cyan
      "*.color6" = config.colorsh.cyan;
      "*.color14" = config.colorsh.cyan_b;

      # white
      "*.color7" = config.colorsh.white0;
      "*.color15" = config.colorsh.white3;
  };
}
