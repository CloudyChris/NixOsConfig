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
      "*.blue-b" = config.colorsh.blue-b;
      "*.blue-d" = config.colorsh.blue-d;

      "*.cyan" = config.colorsh.cyan;
      "*.cyan-b" = config.colorsh.cyan-b;
      "*.cyan-d" = config.colorsh.cyan-d;

      "*.red" = config.colorsh.red;
      "*.red-b" = config.colorsh.red-b;
      "*.red-d" = config.colorsh.red-d;

      "*.orange" = config.colorsh.orange;
      "*.orange-b" = config.colorsh.orange-b;
      "*.orange-d" = config.colorsh.orange-d;

      "*.yellow" = config.colorsh.yellow;
      "*.yellow-b" = config.colorsh.yellow-b;
      "*.yellow-d" = config.colorsh.yellow-d;

      "*.green" = config.colorsh.green;
      "*.green-b" = config.colorsh.green-b;
      "*.green-d" = config.colorsh.green-d;

      "*.magenta" = config.colorsh.magenta;
      "*.magenta-b" = config.colorsh.magenta-b;
      "*.magenta-d" = config.colorsh.magenta-d;

      ####### XRESOURCE COLORS
      "*.accent-1" = config.colorsh.accent-1;
      "*.accent-2" = config.colorsh.accent-2;

      "*.foreground" = config.colorsh.foreground;
      "*.foreground-d" = config.colorsh.foreground-d;
      "*.background" = config.colorsh.background;
      "*.background-b" = config.colorsh.background-b;

      "*.selection-foreground" = config.colorsh.selection-foreground;
      "*.selection-background" = config.colorsh.selection-background;

      "*.cursorColor" = config.colorsh.accent-1;
      "*.url-color" = config.colorsh.url-color;

      # black
      "*.color0" = config.colorsh.black0;
      "*.color8" = config.colorsh.gray2;

      # red
      "*.color1" = config.colorsh.red;
      "*.color9" = config.colorsh.red-b;

      # green
      "*.color2" = config.colorsh.green;
      "*.color10" = config.colorsh.green-b;

      # yellow
      "*.color3" = config.colorsh.yellow;
      "*.color11" = config.colorsh.yellow-b;

      # blue
      "*.color4" = config.colorsh.blue;
      "*.color12" = config.colorsh.blue-b;

      # magenta
      "*.color5" = config.colorsh.magenta;
      "*.color13" = config.colorsh.magenta-b;

      # cyan
      "*.color6" = config.colorsh.cyan;
      "*.color14" = config.colorsh.cyan-b;

      # white
      "*.color7" = config.colorsh.white0;
      "*.color15" = config.colorsh.white3;
  };
}
