{pkgs, ...}:
{
  imports = [

    ../../machines/BlackCradle

    ../../components/base.nix

    # HARDWARE
    ../../components/hardware/mesa_hardware_acceleration.nix
    ../../components/hardware/virt.nix

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

    # UTIL
    ../../components/util/appimage.nix
    ../../components/util/fonts.nix
    ../../components/util/gaming.nix
    ../../components/util/portals.nix
    ../../components/util/xdg.nix

    # DEVELOPMENT
    ../../components/development/c_cpp.nix
    ../../components/development/tooling.nix

    ##########################################
    ./programs.nix
    ./flatpak.nix
    ./transmission.nix
  ];

  users.users = {
    arthank = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];

      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
      ];
    };
  };

  time.timeZone = "Europe/Bucharest";

  i18n.defaultLocale = "en_GB.UTF-8";

  console = {
    earlySetup = true;
    font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
    packages = with pkgs; [
      terminus_font
      kbd
    ];
    useXkbConfig = true;
  };

  services = {
    libinput.mouse.middleEmulation = false;
    xserver = {
      xkb = {
        layout = "ro";
        model = "p105+inet";
        variant = "";
        options = "lv3:ralt_switch, compose:sclk, grp:menu_switch";
      };
    };
  };

  environment.sessionVariables.TERMINAL = "alacritty";

  networking.hostName = "BlackCradle";

  services.transmission.home = "/bigboy/Torrents";
}
