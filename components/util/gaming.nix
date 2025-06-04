{ pkgs, ... }:
{
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    protontricks.enable = true;
    gamescopeSession = {
      enable = true;
      env = {
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      };
      args = [
        "--adaptive-sync"
        "--hrd-enabled"
        "--rt"
        "-W 2560"
        "-H 1440"
        "-F nis"
        "-S integer"
      ];
    };
    extraPackages = with pkgs; [
      unstable.gamescope
      mangohud
      SDL2
      libjpeg
      openal
      libglvnd
      gtk3
      mono
      unstable.simpleDBus
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      vkd3d-proton
    ];
  };

  powerManagement = {
    cpuFreqGovernor = "ondemand";
  };

  services.cpupower-gui.enable = true;

  # We're going in so deep the dwarves of Khazad'dum are calling us crazy
  boot.kernel.sysctl = {
    # 20-shed.conf
    "kernel.sched_cfs_bandwidth_slice_us" = 3000;
    # 20-net-timeout.conf
    # This is required due to some games being unable to reuse their TCP ports
    # if they're killed and restarted quickly - the default timeout is too large.
    "net.ipv4.tcp_fin_timeout" = 5;
    # 30-vm.conf
    # USE MAX_INT - MAPCOUNT_ELF_CORE_MARGIN.
    # see comment in include/linux/mm.h in the kernel tree.
    "vm.max_map_count" = 2147483642;
  };

  environment.systemPackages = with pkgs; [
    # graphix utils
    dxvk
    vkd3d
    vulkan-volk
    vulkan-tools
    vkbasalt
    steam-run
    gpu-viewer

    # programs
    lutris
  ];
}
