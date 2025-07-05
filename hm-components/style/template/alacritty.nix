{ config, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          foreground = config.colorsh.foreground;
          background = config.colorsh.background;
        };
        normal = {
          black = config.colorsh.black0;
          red = config.colorsh.red;
          green = config.colorsh.green;
          yellow = config.colorsh.yellow;
          blue = config.colorsh.blue;
          magenta = config.colorsh.magenta;
          cyan = config.colorsh.cyan;
          white = config.colorsh.white0;
        };
        bright = {
          black = config.colorsh.gray2;
          red = config.colorsh.red_b;
          green = config.colorsh.green_b;
          yellow = config.colorsh.yellow_b;
          blue = config.colorsh.blue_b;
          magenta = config.colorsh.magenta_b;
          cyan = config.colorsh.cyan_b;
          white = config.colorsh.white3;
        };
        selection = {
          text = config.colorsh.selection_foreground;
          background = config.colorsh.selection_background;
        };
      };
    };
  };
}
