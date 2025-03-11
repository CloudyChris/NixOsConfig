{pkgs, ...}: {
  environment.systemPackages = with pkgs; [qemu];

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
}
