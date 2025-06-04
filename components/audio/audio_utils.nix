{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    playerctl
    easyeffects
    noisetorch
    ffmpeg-full
    sox
  ];
}
