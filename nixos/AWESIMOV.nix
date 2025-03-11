{
  imports = [
    # base config with pkgs and services
    ./modules/base.nix
    ./users/arthank.nix

    # modules
    ./modules/pipewire.nix
    ./modules/bluetooth.nix
    ./modules/cups.nix
    ./modules/gaming.nix
    ./modules/appimage.nix
    ./modules/alsa.nix
    ./modules/hotspot.nix
    ./modules/virt.nix

    # I won't need this, not now anyway
    # ./modules/android-studio.nix

    # hardware
    ./hardware/machines/ASIMOV.nix
    ./hardware/nvidia.nix

    # graphics
    ./graphics/awesomewm.nix

    # services
    ./services/flatpak.nix
    ./services/nginx.nix
    ./services/transmission.nix
    ./services/ratbagd.nix
  ];

  networking.hostName = "ASIMOV";

  services.transmission.home = "/bigboy/Torrents";
}
