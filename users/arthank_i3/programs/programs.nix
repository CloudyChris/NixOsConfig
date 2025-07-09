{ pkgs, ...}:
{
  home.packages = with pkgs; [
    # utils
    bat
    btop
    colordiff
    neofetch
    eza
    rofi
    neovim
    nitrogen

    # file manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    yazi

    # web browsers
    firefox
    librewolf
    nyxt

    # social
    unstable.vesktop

    # recording
    obs-studio
    gnome-sound-recorder

    # audio manipulation
    audacity

    # music
    vlc
    libmicrodns
    mpv
    cmus

    # graphics
    gimp3-with-plugins
    inkscape
    imagemagick
    qiv
    eog
    fontforge
    themix-gui

    # documents
    libreoffice

    # pdf
    zathura
    pdfslicer

    # productivity
    obsidian

    # latech
    texliveFull
    texmaker
  ];
}
