{
  pkgs,
  lib,
  config,
  ...
}: { # TODO
  home.activation.lmmsInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
      if [[ -d "${config.home.homeDirectory}/.appimages/" ]]; then
        echo "[ INFO ] .appimages dir exists"
      else
        if [[ -v DRY_RUN ]]; then
          echo "[ DRY ] mkdir ${config.home.homeDirectory}/.appimages"
        else
          mkdir ${config.home.homeDirectory}/.appimages
        fi
      fi
      if [[ -f "${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage" ]]; then
        echo "[ INFO ] LMMS already downloaded"
      else
        if [[ -v DRY_RUN ]]; then
          echo "[ DRY ] ${pkgs.curl}/bin/curl -o ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage http://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage"
          echo "[ DRY ] chmod +x ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage"
        else
          ${pkgs.wget}/bin/wget -O ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage http://github.com/LMMS/lmms/releases/download/v1.2.2/lmms-1.2.2-linux-x86_64.AppImage
          chmod +x ${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage
        fi
      fi
      if [[ -f "${config.home.homeDirectory}/.local/share/applications/lmms.desktop" ]]; then
        echo "[ INFO ] LMMS desktop file already moved to share/applications"
      else
        if [[ -v DRY_RUN ]]; then
          echo "[ DRY ] cat > ${config.home.homeDirectory}/.local/share/applications/lmms.desktop <<EOL"
        else
          touch ${config.home.homeDirectory}/.local/share/applications/lmms.desktop
          cat >${config.home.homeDirectory}/.local/share/applications/lmms.desktop <<EOL
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
Exec=${config.home.homeDirectory}/.appimages/lmms-1.2.2.AppImage %f
Terminal=false
Type=Application
Categories=Qt;AudioVideo;Audio;Midi;
MimeType=application/x-lmms-project;
EOL
          chmod +x ${config.home.homeDirectory}/.local/share/applications/lmms.desktop
        fi
      fi
  '';
}
