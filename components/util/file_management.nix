{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gvfs
  ];
}
