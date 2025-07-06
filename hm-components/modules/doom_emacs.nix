{ pkgs, lib, config, ... }:

let
  cfg = config.programs.doomemacs;
in
{
  #####################################################
  # This module supposes the user follows
  # XDG directory structure and uses ~/.config
  # An option for non-XDG will be added in the future
  #####################################################

  options.programs.doomemacs = {
    enable = lib.mkEnableOption "DoomEmacs";
    doomRepo = lib.mkOption {
      description = "Doom Emacs git repository url";
      type = lib.types.str;
      default = "";
    };
    configRepo = lib.mkOption {
      description = "Doom config git repository url";
      type = lib.types.str;
      default = "";
    };
  };

  config = lib.mkIf ((cfg.enable) && ((cfg.doomRepo != "") && (cfg.configRepo != ""))) {
    home.packages = with pkgs; [
      # deps
      git
      emacs-gtk
      ripgrep

      ######### optional
      coreutils
      fd
      clang
      libtool
      libvterm
      # :tools debugger
      lldb
      nodejs_22
      # :tools everywhere
      xclip
      xdotool
      xorg.xprop
      xorg.xwininfo
      # :lang cc
      glslang
      # :tools editorconfig
      editorconfig-core-c
      # :lang nix
      nixfmt-rfc-style
      # :lang python
      isort
      pipenv
      python311Packages.pytest
      python311Packages.setuptools
      # :lang sh
      shellcheck
      # :lang markdown
      discount
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/.config/emacs/bin"
    ];

    home.activation.doomInstallScript = lib.hm.dag.entryAfter ["writeBoundary"] ''
    if [[ -d "${config.home.homeDirectory}/.config/emacs" ]]; then
      echo "[ INFO ] ${config.home.homeDirectory}/.config/emacs directory exists, and will be emptied"
      yes | rm -r ${config.home.homeDirectory}/.config/emacs/
    fi
    if [[ -d "${config.home.homeDirectory}/.config/doom" ]]; then
      echo "[ INFO ] ${config.home.homeDirectory}/.config/doom/ directory exists, and will be emptied"
      yes | rm -r ${config.home.homeDirectory}/.config/doom/
    fi
    echo "[ INFO ] Cloning doom-emacs to ${config.home.homeDirectory}/.config/emacs"
    ${pkgs.git}/bin/git clone --depth 1 ${cfg.doomRepo} ${config.home.homeDirectory}/.config/emacs
    echo "[ INFO ] cloning config into ${config.home.homeDirectory}/.config/doom"
    ${pkgs.git}/bin/git clone --depth 1 ${cfg.configRepo} ${config.home.homeDirectory}/.config/doom

    echo "[ INFO ] Installing doom"
    yes | ${config.home.homeDirectory}/.config/emacs/bin/doom install
    ${config.home.homeDirectory}/.config/emacs/bin/doom sync
    '';
  };
}
