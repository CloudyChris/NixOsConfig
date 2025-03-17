{ pkgs, ...}: {
  hardware.alsa.enablePersistence = true;
  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
}
