{ config, ... }:
{
  services.printing = {
    enable = false;
    browsed.enable = config.services.priting.enable;
    drivers = [ ];
  };
}
