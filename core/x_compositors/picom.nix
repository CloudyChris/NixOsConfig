{
  services.picom = {
    enable = true;
    settings = {
      #################################
      #             Shadows           #
      #################################
      "shadow" = true;
      "shadow-radius" = 20;
      "shadow-opacity" = 0.60;
      "shadow-offset-x" = -20;
      "shadow-offset-y" = -20;

      #################################
      #           Fading              #
      #################################
      "fading" = true;
      "fade-in-step" = 0.03;
      "fade-out-step" = 0.03;
      "fade-delta" = 5;
      "no-fading-openclose" = false;
      "no-fading-destroyed-argb" = true;

      #################################
      #   Transparency / Opacity      #
      #################################
      "frame-opacity" = 1.0;

      #################################
      #           Corners             #
      #################################
      #"corner-radius" = 10;

      #################################
      #            Blur               #
      #################################
      "blur-kern" = "\"3x3box\"";
      "blur-strength" = 0;

      #################################
      #       General Settings        #
      #################################
      "backend" = "\"glx\"";
      "dithered-present" = false;
      "vsync" = true;
      "detect-rounded-corners" = true;
      "detect-client-opacity" = true;
      "detect-transient" = true;
      "use-damage" = true;
      "log-level" = "\"warn\"";

      #################################
      #            Rules              #
      #################################
      "rules" = ''({
        match = "window_type = 'tooltip'";
        fade = true;
        shadow = true;
        opacity = 0.95;
        focus = true;
        full-shadow = false;
      }, {
        match = "window_type = 'popup_menu' || "
                "window_type = 'dropdown_menu'";
        opacity = 1.0;
      }, {
        match = "window_type = 'utility'";
        shadow = true;
        opacity = 1.0;
      }, {
        match = "window_type = 'dock'    || "
                "window_type = 'desktop' || "
                "class_g = 'Plank'       || "
                "class_g = 'slop'        || "
                "_GTK_FRAME_EXTENTS@";
        blur-background = false;
      }, {
        match = "window_type != 'dock'";
        # shader = "my_shader.frag";
      }, {
        match = "name = 'Notification'   || "
                "class_g = 'Conky'       || "
                "class_g ?= 'Notify-osd' || "
                "class_g = 'Cairo-clock' || "
                #"class_g ?= 'dmenu'     || "
                #"class_g ?= 'rofi'      || "
                #"class_g ?= 'polybar'   || "
                #"class_g ?= 'tint2'     || "
                "class_g ?= 'plank'      || "
                "_GTK_FRAME_EXTENTS@";
        shadow = false;
      })'';
    };
  };
}
