{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
      fsType = "btrfs";
      options = ["subvol=@"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/10C1-2555";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
      fsType = "btrfs";
      options = ["subvol=@home"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
      fsType = "btrfs";
      options = ["subvol=@nix"];
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/19357ee1-ca37-4b83-97a8-b5ea0ecd5aa4";
      fsType = "btrfs";
      options = ["subvol=@log"];
    };

    "/bigboy" = {
      device = "/dev/disk/by-uuid/3ed598b3-03c9-4825-9104-d1681a2db4fe";
      fsType = "btrfs";
    };
  };

  swapDevices = [
    {device = "/dev/disk/by-uuid/d258ee37-e15a-4b98-b391-a67a3da1d54c";}
  ];
}
