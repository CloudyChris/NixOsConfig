{
  users.users = {
    arthank = {
      initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];

      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
        "video"
      ];
    };
  };
}
