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
        blue-b: ${config.colorsh.blue-b};
        blue-d: ${config.colorsh.blue-d};

        cyan: ${config.colorsh.cyan};
        cyan-b: ${config.colorsh.cyan-b};
        cyan-d: ${config.colorsh.cyan-d};

        red: ${config.colorsh.red};
        red-b: ${config.colorsh.red-b};
        red-d: ${config.colorsh.red-d};

        orange: ${config.colorsh.orange};
        orange-b: ${config.colorsh.orange-b};
        orange-d: ${config.colorsh.orange-d};

        yellow: ${config.colorsh.yellow};
        yellow-b: ${config.colorsh.yellow-b};
        yellow-d: ${config.colorsh.yellow-d};

        green: ${config.colorsh.green};
        green-b: ${config.colorsh.green-b};
        green-d: ${config.colorsh.green-d};

        magenta: ${config.colorsh.magenta};
        magenta-b: ${config.colorsh.magenta-b};
        magenta-d: ${config.colorsh.magenta-d};
    }
    '';
  };
}
