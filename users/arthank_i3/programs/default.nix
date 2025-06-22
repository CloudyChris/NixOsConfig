{
  imports = [
    ######## common
    ../../../hm-components/programs/dunst.nix

    ######## local
    ./mime.nix
    ./fonts.nix

    ./programs.nix

    ./git.nix
    ./alacritty.nix
    ./kitty.nix
    ./bash.nix
    ./zsh.nix
    ./doom_emacs.nix
    ./lmms.nix
  ];

  home.sessionPath = ["$HOME/.local/bin"];
}
