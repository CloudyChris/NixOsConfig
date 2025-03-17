{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bash.nix
    ./zsh.nix
    ./fish.nix
    ./xorg.nix
    ./git.nix
    ./awesome.nix
    ./alacritty.nix
    ./kitty.nix
    ./doom_emacs.nix
    ./gnome.nix
    ./mime.nix
    ./utils.nix
    ./icons.nix
    ./fonts.nix
    ./audio.nix
    ./lmms.nix
    ./documents.nix
    ./ocr.nix
    ./games.nix
  ];

  programs.home-manager.enable = true;

  home.sessionPath = ["$HOME/.local/bin"];

  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # ~/.nix-profile/share/applications/mimeinfo.cache has a much more complete list
        # no need for an exhaustive list here, just some basics
        "text/html" = "firefox.desktop";
        "x-scheme-handler/http" = "firefox.desktop";
        "x-scheme-handler/https" = "firefox.desktop";
        "x-scheme-handler/about" = "firefox.desktop";
        "x-scheme-handler/unknown" = "firefox.desktop";
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop" "com.github.junrrein.PDFSlicer.desktop"];
        "application/http" = "firefox.desktop";
        "application/https" = "firefox.desktop";
        "application/octet-stream" = "emacs.desktop";
        "image/*" = "org.gnome.eog.desktop";
        "image/jpg" = "org.gnome.eog.desktop";
        "image/jpeg" = "org.gnome.eog.desktop";
        "image/png" = "org.gnome.eog.desktop";
        "image/svg+xml-compressed" = ["org.gnome.eog.desktop" "org.inkscape.Inkscape.desktop" "gimp.desktop"];
        "audio/*" = "vlc.desktop";
        "video/*" = "vlc.desktop";
      };
    };
  };

  # Add programs
  home.packages = with pkgs; [
    # web browser
    firefox

    # apps
    unstable.vesktop
    kdePackages.dolphin

    # vlc
    vlc
    libmicrodns

    # other audio utils
    audacity

    # recording
    obs-studio

    # other media players
    mpv
    cmus

    # gaming
    lutris
    piper

    # dev tools
    gnumake
    libclang
    ccls
    libgcc
    gdb
    gdbm
    cgdb
    scons
    cmakeWithGui
    cmake-format
    vulkan-tools

    # game dev
    unstable.godot_4
    blender

    # cad
    openscad

    #################### apps
    # graphics
    gimp-with-plugins
    gimpPlugins.gap
    gimpPlugins.fourier
    gimpPlugins.texturize
    inkscape
  ];
}
