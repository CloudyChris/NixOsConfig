{
  programs.autorandr = {
    enable = true;
    hooks.postswitch = {
      "evil-configure" = "evil_configure";
    };
  };

  services.autorandr = {
    enable = true;
  };
}
