{ pkgs, config, osConfig, lib, ...}:
let
  cfg = config.colors;
in
{
  options.colorsh = {
    black0 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#191d24";
    };
    black1 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#1e222a";
    };
    black2 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#222630";
    };

    gray0 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#242933";
    };
    gray1 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#2e3440";
    };
    gray2 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#3b4252";
    };
    gray3 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#434c5e";
    };
    gray4 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#4c566a";
    };
    gray5 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#60728a";
    };

    white0 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#bbc3d4";
    };
    white1 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#c0c8d8";
    };
    white2 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#d8dee9";
    };
    white3 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#e5e9f0";
    };
    white4 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#eceff4";
    };

    blue = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#81a1c1";
    };
    blue_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#88c0d0";
    };
    blue_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#5e81ac";
    };

    cyan = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#8fbcbb";
    };
    cyan_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#9fc6c5";
    };
    cyan_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#80b3b2";
    };

    red = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#bf616a";
    };
    red_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#c5727a";
    };
    red_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#b74e58";
    };

    orange = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#d08770";
    };
    orange_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#d79784";
    };
    orange_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#cb775d";
    };

    yellow = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#ebcb8b";
    };
    yellow_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#efd49f";
    };
    yellow_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#e7c173";
    };

    green = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#a3be8c";
    };
    green_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#b1c89d";
    };
    green_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#97b67c";
    };

    magenta = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#b48ead";
    };
    magenta_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#be9db8";
    };
    magenta_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#a97ea1";
    };

    accent_1 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#ebcb8b";
    };
    accent_2 = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#a3be8c";
    };

    foreground = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#ebcb8b";
    };
    foreground_d = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#60728a";
    };
    background = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#191d24";
    };
    background_b = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#242933";
    };

    selection_foreground = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#191d24";
    };
    selection_background = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#ebcb8b";
    };

    url_color = lib.mkOption {
      description = "";
      type = lib.types.str;
      default = "#a3be8c";
    };
  };

  config.colorsh = {
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
