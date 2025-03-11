{pkgs, ...}: {
  home.packages = with pkgs; [
    pwvucontrol
    easyeffects
    noisetorch
    ffmpeg-full
    sox
  ];
}
