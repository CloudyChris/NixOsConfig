{ config, ...}:
{
  home.file."${config.home.homeDirectory}/.local/share/rofi/themes/colors.rasi" = {
    text = ''
    * {
        black0: ${config.colorsh.black0};
        black1: ${config.colorsh.black1};
        black2: ${config.colorsh.black2};

        gray0: ${config.colorsh.gray0};
        gray1: ${config.colorsh.gray1};
        gray2: ${config.colorsh.gray2};
        gray3: ${config.colorsh.gray3};
        gray4: ${config.colorsh.gray4};
        gray5: ${config.colorsh.gray5};

        white0: ${config.colorsh.white0};
        white1: ${config.colorsh.white1};
        white2: ${config.colorsh.white2};
        white3: ${config.colorsh.white3};
        white4: ${config.colorsh.white4};

        blue: ${config.colorsh.blue};
        blue_b: ${config.colorsh.blue_b};
        blue_d: ${config.colorsh.blue_d};

        cyan: ${config.colorsh.cyan};
        cyan_b: ${config.colorsh.cyan_b};
        cyan_d: ${config.colorsh.cyan_d};

        red: ${config.colorsh.red};
        red_b: ${config.colorsh.red_b};
        red_d: ${config.colorsh.red_d};

        orange: ${config.colorsh.orange};
        orange_b: ${config.colorsh.orange_b};
        orange_d: ${config.colorsh.orange_d};

        yellow: ${config.colorsh.yellow};
        yellow_b: ${config.colorsh.yellow_b};
        yellow_d: ${config.colorsh.yellow_d};

        green: ${config.colorsh.green};
        green_b: ${config.colorsh.green_b};
        green_d: ${config.colorsh.green_d};

        magenta: ${config.colorsh.magenta};
        magenta_b: ${config.colorsh.magenta_b};
        magenta_d: ${config.colorsh.magenta_d};

        accent_1: ${config.colorsh.accent_1};
        accent_2: ${config.colorsh.accent_2};

        foreground: ${config.colorsh.foreground};
        foreground_d: ${config.colorsh.foreground_d};
        background: ${config.colorsh.background};
        background_b: ${config.colorsh.background_b};

        selection_foreground: ${config.colorsh.selection_background};
        selection_background: ${config.colorsh.selection_foreground};

        url_color: ${config.colorsh.url_color};
    }
    '';
  };
}
