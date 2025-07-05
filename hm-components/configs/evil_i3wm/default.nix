{
  imports = [
    ./rofi
    ./eww
    ./i3
    ./scripts
    ./autorandr.nix
  ];

  services.clipmenu = {
    enable = true;
    launcher = "rofi";
  };
}
