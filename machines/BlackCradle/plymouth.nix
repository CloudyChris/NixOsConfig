{ pkgs, ... }:
{
  boot.plymouth = {
    enable = true;
    theme = "black_hud";
    themePackages = with pkgs; [
      (adi1090x-plymouth-themes.override {
        selected_themes = ["black_hud"];
      })
    ];
  };
}
