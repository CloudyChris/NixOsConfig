{
  services = {
    libinput.mouse.middleEmulation = false;
    xserver = {
      xkb = {
        layout = "ro";
        model = "p105+inet";
        variant = "";
        options = "lv3:ralt_switch, compose:sclk, grp:menu_switch";
      };
    };
  };
}
