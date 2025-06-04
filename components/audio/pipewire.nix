{ pkgs, config, ... }:
{

  imports = [
    ../../core/audio/alsa.nix
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber = {
      enable = config.services.pipewire.enable;
      extraConfig = {
        bluetoothEnhancements = {
          "support.dbus" = true;
          "support.reserve-device" = true;
          "support.portal-premissionstore" = true;
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [ "a2dp_sink" "a2dp_source" "bap_sink" "bap_source" "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
          };
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    pwvucontrol
  ];
}
