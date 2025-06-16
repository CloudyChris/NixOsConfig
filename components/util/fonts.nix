{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    fontconfig
    freetype

    nerd-fonts.jetbrains-mono
    nerd-fonts.roboto-mono
    nerd-fonts.noto
    nerd-fonts.hack
    nerd-fonts.agave
    nerd-fonts.overpass
  ];
}
