{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      norse = "sudo nixos-rebuild switch --flake /etc/nixos#arthank_i3";
    };
    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/.config/zsh/history";
    };
  };
}
