{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnumake
    cmake
    cmakeWithGui
    cmake-format
    binutils
    scons
  ];
}
