{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      l = "eza";
      ll = "eza -alh";
      norse = "sudo nixos-rebuild switch --flake /etc/nixos#arthank_i3";
    };
  };
}
