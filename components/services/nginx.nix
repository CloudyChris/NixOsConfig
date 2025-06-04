{
  services.nginx.enable = true;
  services.nginx.virtualHosts."localhost" = {
    root = "/srv/http";
  };
}
