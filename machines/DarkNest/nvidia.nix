{
  pkgs,
  config,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Power Management (we can do without)
    powerManagement = {
      enable = false;
      finegrained = false;
    };

    open = true;

    nvidiaSettings = true;

    videoAcceleration = true;
    gsp.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  boot.extraModulePackages = with config.boot.kernelPackages; [ nvidia_x11 ];

  hardware.graphics.extraPackages = with pkgs; [
    nvidia-vaapi-driver
  ];

  environment.sessionVariables.VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
}
