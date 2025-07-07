{ pkgs, lib, config, ... }:
let
  cfg = config.programs.lmms-appimage;
in
{
  options.programs.lmms-appimage = {
    enable = lib.mkEnableOption "LMMS-Appimage";
    version = lib.mkOption {
      description = "LMMS version x.y.z format";
      type = lib.types.nullOr lib.types.str;
      default = null;
    };
  };

  config = lib.mkIf (cfg.enable && (cfg.version != "")) {
    home.activation.lmmsInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
        if [[ -d "${config.home.homeDirectory}/.appimages/" ]]; then
          echo "[ INFO ] .appimages dir exists"
        else
          echo "[ INFO ] .appimages dir does not exist, and will be created"
          $DRY_RUN_CMD mkdir ${config.home.homeDirectory}/.appimages
        fi
        if [[ -f "${config.home.homeDirectory}/.appimages/lmms-${cfg.version}.AppImage" ]]; then
          echo "[ INFO ] a file with the name lmms-${cfg.version}.AppImage exists, nothing to be done"
        else
          echo "[ INFO ] Downloading the LMMS appimage"
          $DRY_RUN_CMD ${pkgs.wget}/bin/wget -O ${config.home.homeDirectory}/.appimages/lmms-${cfg.version}.AppImage http://github.com/LMMS/lmms/releases/download/v${cfg.version}/lmms-${cfg.version}-linux-x86_64.AppImage
          $DRY_RUN_CMD chmod +x ${config.home.homeDirectory}/.appimages/lmms-${cfg.version}.AppImage
        fi
    '';

    home.file."${config.home.homeDirectory}/.local/share/applications/lmms.desktop" = {
      text = ''
        [Desktop Entry]
        Name=LMMS
        GenericName=Music production suite
        GenericName[ca]=Programari de producció musical
        GenericName[de]=Software zur Musik-Produktion
        GenericName[fr]=Suite de production musicale
        Comment=Music sequencer and synthesizer
        Comment[ca]=Producció fàcil de música per a tothom!
        Comment[fr]=Séquenceur et synthétiseur de musique
        Icon=lmms
        Exec=${config.home.homeDirectory}/.appimages/lmms-${cfg.version}.AppImage %f
        Terminal=false
        Type=Application
        Categories=Qt;AudioVideo;Audio;Midi;
        MimeType=application/x-lmms-project;
      '';
      executable = true;
    };
  };
}
