{pkgs, ...}: {
  services = {
    xserver = {
      windowManager.awesome = {
        enable = true;
        package = pkgs.awesome.overrideAttrs {
          version = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
          src = pkgs.fetchFromGitHub {
            owner = "awesomeWM";
            repo = "awesome";
            rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
            hash = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
          };
          patches = [];
          postPatch = ''
            patchShebangs tests/examples/_postprocess.lua
          '';
        };
        luaModules = with pkgs.luaPackages; [
          luarocks-nix
          luadbi-mysql
        ];
      };
    };
    displayManager = {
      defaultSession = "none+awesome";
    };
    picom = {
      enable = true;
      backend = "glx";
      vSync = true;
    };
  };

  environment.systemPackages = with pkgs; [
    arandr
  ];

  environment.extraInit = ''
    xset s off -dpms
  '';
}
