{pkgs, ...}:
{
  console = {
    earlySetup = true;
    font = "${pkgs.kbd}/share/consolefonts/Lat2-Terminus16.psfu.gz";
    packages = with pkgs; [
      terminus_font
      kbd
    ];
    useXkbConfig = true;
  };
}
