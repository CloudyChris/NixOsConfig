# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  npins,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # My modules
    ./users.nix

    # Hardware configuration (nixos-generate-config)
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

    ];

    # Configure your nixpkgs instance
    config = {
      allowUnfree = true;
      pulseaudio = true;
    };
  };

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
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

  services = {
    xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
      };
      windowManager.awesome = {
        enable = true;
	package = pkgs.awesome.overrideAttrs (oa: {
	  version = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
	  src = pkgs.fetchFromGitHub {
            owner = "awesomeWM";
	    repo = "awesome";
	    rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
	    hash = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
	  };
	  patches = [];
	  postPatch = ''
	    patchShebangs tests/examples/_postprocess.lua
	  '';
	});
	luaModules = with pkgs.luaPackages; [
          luarocks
	  luadbi-mysql
	];
      };
    };
    picom = {
      enable = true;
      # settings = {};
    };
  };

  # Enabling sound
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    zeroconf.discovery.enable = true;
  };

  # Enable internet
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  networking.hostName = "ASIMOV";

  boot.loader = {
    systemd-boot.enable = true;  
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

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
    gnumake
    cmake
    binutils
    scons
    python3
    termite
    xclip
    neovim
    bat
    colordiff
    curl
    wget
    papirus-nord
    upower
    bluez
    bluez-alsa
    bluez-tools
    xfce.xfce4-power-manager
    playerctl
    flameshot
    kitty
    alacritty
    pwvucontrol
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";
}
