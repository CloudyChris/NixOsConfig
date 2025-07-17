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

  # had to add the mkIf because gdm ends up in an infinite cycle if this is true (could add it to lightdm instead of this, maybe, in the future)
  systemd.services.plymouth-quit.after = lib.mkIf (config.services.xserver.displayManager.gdm.enable == false) [ "display-manager.service" ];
}
