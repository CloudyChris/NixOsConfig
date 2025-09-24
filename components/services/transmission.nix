{
  config,
  pkgs,
  ...
}: {
  services.transmission = {
    enable = true;
    webHome = pkgs.flood-for-transmission;
    downloadDirPermissions = "666";
    settings = {
      umask = 0;
      download-dir = "${config.services.transmission.home}/Downloads";
      incomplete-dir-enabled = true;
      incomplete-dir = "${config.services.transmission.home}/.incomplete";
      watch-dir-enabled = true;
      watch-dir = "${config.services.transmission.home}/.watchdir";
      trash-original-torrent-files = true;
    };
  };

  systemd.services.transmission.environment.TRANSMISSION_WEB_HOME = "${pkgs.flood-for-transmission}";
}
