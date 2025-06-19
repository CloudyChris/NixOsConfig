{
  imports = [
    ../../../hm-components/modules/lmms.nix
  ];

  programs.lmms-appimage = {
    enable = true;
    version = "1.2.2";
  };
}
