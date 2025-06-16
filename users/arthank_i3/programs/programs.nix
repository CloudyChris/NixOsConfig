{ pkgs, ...}:
{
  home.packages = with pkgs; [
    # utils
    btop
    colordiff
    neofetch
    eza
    rofi

    # file manager
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    yazi

    # web browsers
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
    gimp-with-plugins
    gimpPlugin.gap
    gimpPlugin.fourier
    gimpPlugin.texturize
    inkscape
    imagemagick
    qiv
    eog
    fontforge

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
