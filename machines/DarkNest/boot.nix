{ lib, config, pkgs, ... }:
{
  boot = {
    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd = {
      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
      ];
      kernelModules = [];
      verbose = false;
      systemd = {
        enable = true;
        storePaths = [config.console.font];
      };
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=auto"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
      "modprobe.blacklist=iTCO_wdt" # Turn off Intel hardware watchdog
      #"modprobe.blacklist=sp5100_tco" # Turn off AMD hardware watchdog
    ];

    loader = {
      grub = {
        enable = true;
        theme = "${pkgs.skull-grub-theme}";
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        backgroundColor = "#191d24";
        gfxmodeEfi = "2560x1440";
      };
      timeout = 5;
      efi.canTouchEfiVariables = true;
    };
  };
}
