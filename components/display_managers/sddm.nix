{pkgs, ...}: {
  qt.style = "breeze";

  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "nord";
  };

  environment.systemPackages = with pkgs; [
    # deps
    libsForQt5.full
    libsForQt5.plasma-framework
    libsForQt5.breeze-qt5
    libsForQt5.breeze-icons

    # theme
    nord-sddm
  ];
}
