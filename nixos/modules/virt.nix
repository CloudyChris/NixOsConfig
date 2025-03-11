{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
  ];

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
}
