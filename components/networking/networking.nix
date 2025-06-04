{pkgs, ...}: {
  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };

  # My traceroute
  programs.mtr.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
