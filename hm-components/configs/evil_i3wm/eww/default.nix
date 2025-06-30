{ lib, config, pkgs, ...}:

{

  config = {

    home.activation.ewwConfigScript = lib.hm.dag.entryAfter ["writeBoundary"] ''

    '';
  };
}
