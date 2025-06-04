{pkgs, ...}: {

  imports = [
    ../../core/audio/alsa.nix
  ];

  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraModules = with pkgs; [
      pulseaudio-modules-bt
    ];
    support32Bit = true;
    zeroconf.discovery.enable = true;
    extraConfig = ''
      load-module module-equalizer-sink
      load-module module-dbus-protocol
    '';
  };
}
