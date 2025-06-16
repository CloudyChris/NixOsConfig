{ pkgs, config, ... }:
{
  boot.plymouth = {
    enable = true;
    font = config.console.font;
    theme = "owl";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = ["owl"];
      })
    ];
  };
}
