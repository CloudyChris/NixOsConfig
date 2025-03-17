{pkgs, ...}: {
  home.packages = with pkgs; [
    # dep
    dconf

    # io
    glib

    # gsettings
    gsettings-desktop-schemas

    # gnome-notify
    zenity

    # networking
    networkmanagerapplet
    gnome-nettool

    # bluetooth
    blueberry

    # keyring
    gnome-keyring
    libgnome-keyring

    # image viewer
    eog

    # sound recorder
    gnome-sound-recorder
  ];
}
