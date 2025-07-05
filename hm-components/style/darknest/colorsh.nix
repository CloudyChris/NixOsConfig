{ config, ... }:
{
  imports = [
    ../../modules/colorsh.nix
  ];

  colorsh = {
    black0 = "#191d24";
    black1 = "#1e222a";
    black2 = "#222630";

    gray0 = "#242933";
    gray1 = "#2e3440";
    gray2 = "#3b4252";
    gray3 = "#434c5e";
    gray4 = "#4c566a";
    gray5 = "#60728a";

    white0 = "#bbc3d4";
    white1 = "#c0c8d8";
    white2 = "#d8dee9";
    white3 = "#e5e9f0";
    white4 = "#eceff4";

    blue = "#81a1c1";
    blue_b = "#88c0d0";
    blue_d = "#5e81ac";

    cyan = "#8fbcbb";
    cyan_b = "#9fc6c5";
    cyan_d = "#80b3b2";

    red = "#bf616a";
    red_b = "#c5727a";
    red_d = "#b74e58";

    orange = "#d08770";
    orange_b = "#d79784";
    orange_d = "#cb775d";

    yellow = "#ebcb8b";
    yellow_b = "#efd49f";
    yellow_d = "#e7c173";

    green = "#a3be8c";
    green_b = "#b1c89d";
    green_d = "#97b67c";

    magenta = "#b48ead";
    magenta_b = "#be9db8";
    magenta_d = "#a97ea1";

    accent_1 = config.colorsh.yellow;
    accent_2 = config.colorsh.green;

    foreground = config.colorsh.accent_1;
    foreground_d = config.colorsh.gray5;
    background = config.colorsh.black0;
    background_b = config.colorsh.gray0;

    selection_foreground = config.colorsh.background;
    selection_background = config.colorsh.foreground;

    url_color = config.colorsh.accent_2;
  };
}
