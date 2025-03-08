# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  # You can import other NixOS modules here
  imports = [
    # My modules
    ../graphics/xresources-nord.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: {inherit flake;})) ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs'
    (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # Required for SDDM
  qt.style = "breeze";

  security = {
    polkit = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
  };

  services = {
    libinput.mouse.middleEmulation = false;
    xserver = {
      enable = true;
      xkb = {
        layout = "ro";
        model = "p105+inet";
        variant = "";
        options = "lv3:ralt_switch, compose:sclk, grp:menu_switch";
      };
    };
    displayManager = {
      sddm = {
        enable = true;
        theme = "nord";
      };
    };
  };

  # portals for flatpaks and sandboxed apps
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };
  };

  # Enable internet
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  # Enable hardware acceleration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
    font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
    packages = with pkgs; [
      terminus_font
      kbd
    ];
    useXkbConfig = true;
  };

  # My traceroute
  programs.mtr.enable = true;

  # GnuPG
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.command-not-found = {
    enable = false;
  };

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  environment.systemPackages = with pkgs; [
    # build tools & dev
    gnumake
    cmake
    binutils
    libgcc
    libclang
    scons
    (python3.withPackages (ps:
      with ps; [
        pip
        requests
        xlib
      ]))
    lua54Packages.lua
    lua54Packages.luarocks-nix
    stylua

    # shells
    fish

    #shell utils
    bat
    colordiff
    curl
    wget

    # icons
    papirus-nord

    # cursors
    nordzy-cursor-theme

    # utils
    pciutils
    toybox

    # lua custom packages
    extraLuaPackages.dbus_proxy
    extraLuaPackages.enum
    extraLuaPackages.pulseaudio_dbus
    extraLuaPackages.upower_dbus

    # power management
    upower
    xfce.xfce4-power-manager

    # audio / control
    playerctl

    # xorg
    xclip
    xorg.xrdb
    xorg.xfs
    xorg.xfd
    xorg.xwd
    xorg.xpr
    xorg.xsm
    xorg.xev
    xorg.xwud
    xorg.xset
    xorg.xmag
    xorg.luit
    xorg.xprop
    xorg.xmore
    xorg.xload
    #xorg.xkill
    #xorg.xinit
    #xorg.xhost
    xorg.xrandr
    xorg.imake
    xorg.xvinfo
    xorg.xinput
    xorg.xgamma
    xorg.xcmsdb
    xorg.xkbevd
    xorg.xmodmap
    xorg.xkbcomp
    xorg.xfsinfo
    xorg.viewres
    xorg.smproxy
    xorg.xstdcmap
    xorg.xsetroot
    xorg.xrefresh
    xorg.xmessage
    xorg.xkbprint

    # settings
    xsettingsd

    # sddm
    sddm-themes.nord
    libsForQt5.full
    libsForQt5.plasma-framework
    libsForQt5.breeze-qt5
    libsForQt5.breeze-icons
  ];

  environment.sessionVariables.TERMINAL = "alacritty";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}
