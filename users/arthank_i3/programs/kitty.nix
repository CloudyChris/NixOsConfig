{
  imports = [
    ../../../hm-components/style/darkened_nordic/kitty.nix
  ];

  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
