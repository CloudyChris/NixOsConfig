{ config, ...}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          foreground = config.colorsh.yellow;
          background = config.colorsh.black0;
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
          red = config.colorsh.red-b;
          green = config.colorsh.green-b;
          yellow = config.colorsh.yellow-b;
          blue = config.colorsh.blue-b;
          magenta = config.colorsh.magenta-b;
          cyan = config.colorsh.cyan-b;
          white = config.colorsh.white3;
        };
        selection = {
          text = config.colorsh.black0;
          background = config.colorsh.yellow;
        };
      };
    };
  };
}
