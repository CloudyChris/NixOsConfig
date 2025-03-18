# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
{pkgs, ...}: {
  # example = pkgs.callPackage ./example { };

  # pkgs
  sddm-themes = pkgs.callPackage ./sddm-themes {};

  # lua
  extraLuaPackages = pkgs.callPackage ./lua {};
}
