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
        #"nvidia"
        #"nvidia_drm"
        #"nvidia_uvm"
        #"nvidia_modeset"
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
      "vt.global_cursor_default=GRUB_CMDLINE_LINUX_DEFAULT"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=auto"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "nowatchdog"
      "noapic"
      "nolapic"
      "acpi=off"
      "modprobe.blacklist=iTCO_wdt" # Turn off Intel hardware watchdog
      #"modprobe.blacklist=sp5100_tco" # Turn off AMD hardware watchdog
    ];

    loader = {
      grub = {
        enable = true;
        theme = "${pkgs.libsForQt5.breeze-grub}/grub/themes/breeze";
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        fsIdentifier = "label";
        backgroundColor = "#000000";
        splashImage = "${pkgs.adi1090x-plymouth-themes.out}/share/plymouth/themes/${config.boot.plymouth.theme}/progress-0.png";
        splashMode = "stretch";
        timeoutStyle = "hidden";
        gfxmodeEfi = "2560x1440";
      };
      timeout = 5;
      efi.canTouchEfiVariables = true;
    };
  };
}
