{
  imports = [
    ../../../user-components/programs/doom_emacs.nix
  ];

  programs.doomemacs = {
    enable = true;
    doomRepo = "https://github.com/CloudyChris/doom-emacs.git";
    configRepo = "https://github.com/CloudyChris/doom-config.git";
  };
}
