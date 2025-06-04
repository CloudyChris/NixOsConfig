{
  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # ~/.nix-profile/share/applications/mimeinfo.cache has a much more complete list
        # no need for an exhaustive list here, just some basics
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        "application/pdf" = ["org.pwmt.zathura-pdf-mupdf.desktop" "com.github.junrrein.PDFSlicer.desktop"];
        "application/http" = "librewolf.desktop";
        "application/https" = "librewolf.desktop";
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
}
