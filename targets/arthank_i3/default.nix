{pkgs, ...}:
{
  imports = [

    # MACHINE
    ../../machines/DarkNest

    # BASE
    ../../components/base.nix

    # HARDWARE
    ../../components/hardware/mesa.nix
    ../../components/hardware/virt.nix

    # KEYBOARD
    ../../components/kb_layouts/ro_programmer.nix

    # DISPLAY MANAGER
    ../../components/display_managers/lightdm.nix

    # AUDIO
    ../../components/audio/audio_utils.nix
    ../../components/audio/pipewire.nix

    # NETWORKING
    ../../components/networking/networking.nix
    ../../components/networking/bluetooth.nix
    ../../components/networking/hotspot.nix

    # WM
    ../../components/window_managers/i3wm.nix

    # SERVICES
    ../../components/services/cups.nix
    ../../components/services/flatpak.nix
    ../../components/services/nginx.nix
    ../../components/services/openssh.nix
    ../../components/services/ratbagd.nix
    ../../components/services/transmission.nix

    # UTIL
    ../../components/util/appimage.nix
    ../../components/util/console_early.nix
    ../../components/util/file_management.nix
    ../../components/util/fonts.nix
    ../../components/util/gaming.nix
    ../../components/util/portals.nix
    ../../components/util/xdg.nix

    # GRAPHICAL FRAMEWORKS
    ../../components/graphical_frameworks/gtk.nix

    # DEVELOPMENT
    ../../components/development/c_cpp.nix
    ../../components/development/tooling.nix

    ##########################################
    ./programs.nix
    ./flatpak.nix
  ];

  users.users = {
    arthank = {
      enable = true;
      initialPassword = "thisismyinitialpassword";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];

      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
        "kvm"
        "gamemode"
        "render"
        "rtkit"
      ];
    };
  };

  time.timeZone = "Europe/Bucharest";

  i18n.defaultLocale = "en_GB.UTF-8";

  services.transmission.home = "/bigboy/Torrents";
}
