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

    # file explorer
    nautilus
    nautilus-python
    sushi
    nautilus-open-any-terminal

    # keyring
    gnome-keyring
    libgnome-keyring

    # image viewer
    eog

    # sound recorder
    gnome-sound-recorder
  ];
}
