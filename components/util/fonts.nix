{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nerdfonts
    fontconfig
    freetype
  ];
}
