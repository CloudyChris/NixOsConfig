{
  imports = [
    ../../../hm-components/modules/lmms.nix
  ];

  programs.llms-appimage = {
    enable = true;
    version = "1.2.2";
  };
}
