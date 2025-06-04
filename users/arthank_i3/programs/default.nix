{
  imports = [
    ./mime.nix
    ./fonts.nix

    ./programs.nix

    ./git.nix
    ./alacritty.nix
    ./kitty.nix
    ./bash.nix
    ./zsh.nix
  ];

  home.sessionPath = ["$HOME/.local/bin"];
}
