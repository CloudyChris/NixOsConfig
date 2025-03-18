# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: {
  # example = pkgs.callPackage ./example { };

  # pkgs
  nord-sddm = pkgs.callPackage ./nord-sddm {};
  nordic-cursor-theme = pkgs.callPackage ./nordic-cursor-theme {};

  # lua
  extraLuaPackages = pkgs.callPackage ./lua {};
}
