{pkgs, ...}:
{
  hardware.new-lg4ff.enable = true;
  services.udev.packages = with pkgs; [oversteer];
}
