{ lib, config, ...}:
let
  global_kitty = config.programs.kitty.enable;
in
{
  config = lib.mkIf (global_kitty) {
    programs.kitty = {
      settings = {
        foreground = config.colorsh.foreground;
        background = config.colorsh.background;

        selection_foreground = config.colorsh.selection-foreground;
        selection_background = config.colorsh.selection-background;

        url_color = config.colorsh.url-color;
        cursor = config.colorsh.accent-1;

        color0 = config.colorsh.black0;
        color8 = config.colorsh.gray2;

        color1 = config.colorsh.red;
        color9 = config.colorsh.red-b;

        color2 = config.colorsh.green;
        color10 = config.colorsh.green-b;

        color3 = config.colorsh.yellow;
        color11 = config.colorsh.yellow-b;

        color4 = config.colorsh.blue;
        color12 = config.colorsh.blue-b;

        color5 = config.colorsh.magenta;
        color13 = config.colorsh.magenta-b;

        color6 = config.colorsh.cyan;
        color14 =config.colorsh.cyan-b;

        color7 = config.colorsh.white0;
        color15 = config.colorsh.white3;
      };
    };
  };
}
