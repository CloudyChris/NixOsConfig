{pkgs, ...}: {
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    hsphfpd.enable = true;
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    bluez-alsa
    bluez-tools
    bluetui
  ];
}
