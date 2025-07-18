{ pkgs, config, lib, ... }:
{
  boot.plymouth = {
    enable = false;
    font = config.console.font;
    theme = "seal_3";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = ["seal" "seal_2" "seal_3" "owl"];
      })
    ];
  };
}
