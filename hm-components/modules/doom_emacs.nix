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

    home.activation.doomInstallScript = lib.hm.dag.entryAfter ["installPackages"] ''
    export PATH="${lib.makeBinPath (with pkgs; [git emacs-gtk ripgrep])}:$PATH"
    if [[ -d "${config.home.homeDirectory}/.config/emacs" ]]; then
      echo "[ INFO ] ${config.home.homeDirectory}/.config/emacs directory exists, checking if it's correctly populated"
      cd ${config.home.homeDirectory}/.config/emacs
      if [[ $(git diff) ]]; then
        echo "[ INFO ] there are differences with upstream, removing directory and its contents"
        $DRY_RUN_CMD yes | rm -r ${config.home.homeDirectory}/.config/emacs
        export SHOULD_CLONE_EMACS="yes"
      fi
      cd
    fi
    if [[ -d "${config.home.homeDirectory}/.config/doom" ]]; then
      echo "[ INFO ] ${config.home.homeDirectory}/.config/doom/ directory exists, checking if it's correctly populated"
      cd ${config.home.homeDirectory}/.config/doom
      if [[ $(git diff) ]]; then
        echo "[ INFO ] there are differences with upstream, removing directory and its contents"
        $DRY_RUN_CMD yes | rm -r ${config.home.homeDirectory}/.config/doom
        export SHOULD_CLONE_DOOM="yes"
      fi
      cd
    fi
    if [[ -v SHOULD_CLONE_EMACS ]]; then
      echo "[ INFO ] Cloning doom-emacs to ${config.home.homeDirectory}/.config/emacs"
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 ${cfg.doomRepo} ${config.home.homeDirectory}/.config/emacs
    fi
    if [[ -v SHOULD_CLONE_DOOM ]]; then
      echo "[ INFO ] cloning config into ${config.home.homeDirectory}/.config/doom"
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 ${cfg.configRepo} ${config.home.homeDirectory}/.config/doom
    fi

    if [[ -v SHOULD_CLONE_EMACS ]] || [[ -v SHOULD_CLONE_DOOM ]]; then
      echo "[ INFO ] Installing doom"
      $DRY_RUN_CMD yes | ${config.home.homeDirectory}/.config/emacs/bin/doom install
      $DRY_RUN_CMD ${config.home.homeDirectory}/.config/emacs/bin/doom sync
    fi
    '';
  };
}
