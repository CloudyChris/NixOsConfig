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

        selection_foreground = config.colorsh.selection_foreground;
        selection_background = config.colorsh.selection_background;

        url_color = config.colorsh.url_color;
        cursor = config.colorsh.accent_1;

        color0 = config.colorsh.black0;
        color8 = config.colorsh.gray2;

        color1 = config.colorsh.red;
        color9 = config.colorsh.red_b;

        color2 = config.colorsh.green;
        color10 = config.colorsh.green_b;

        color3 = config.colorsh.yellow;
        color11 = config.colorsh.yellow_b;

        color4 = config.colorsh.blue;
        color12 = config.colorsh.blue_b;

        color5 = config.colorsh.magenta;
        color13 = config.colorsh.magenta_b;

        color6 = config.colorsh.cyan;
        color14 =config.colorsh.cyan_b;

        color7 = config.colorsh.white0;
        color15 = config.colorsh.white3;
      };
    };
  };
}
