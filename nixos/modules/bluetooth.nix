{pkgs, ...}: {
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    bluez-alsa
    bluez-tools
  ];
}
