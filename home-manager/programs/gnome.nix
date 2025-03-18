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
    mate.caja-with-extensions
    mate.python-caja
    folder-color-switcher

    # keyring
    gnome-keyring
    libgnome-keyring

    # image viewer
    eog

    # sound recorder
    gnome-sound-recorder
  ];
}
