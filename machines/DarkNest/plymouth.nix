{ pkgs, config, lib, ... }:
{
  boot.plymouth = {
    enable = true;
    font = config.console.font;
    theme = "seal_3";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = ["seal" "seal_2" "seal_3" "owl"];
      })
    ];
  };

  systemd.services.display-manager.conflicts = [ "plymouth-quit.service" ];
}
