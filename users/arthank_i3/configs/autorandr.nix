{
  programs.autorandr.profiles."DarkNest" = {
    fingerprint = {
      HDMI-1 = "";
      HDMI-0 = "";
    };
    config = {
      HDMI-1 = {
        enable = true;
        mode = "2560x1440";
        position = "0x0";
        primary = true;
        rate = "100.00";
        rotate = "normal";
      };
      HDMI-0 = {
        enable = true;
        mode = "2560x1440";
        position = "2560x0";
        primary = false;
        rate = "100.00";
        rotate = "normal";
      };
    };
  };
}
