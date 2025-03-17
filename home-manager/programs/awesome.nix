{pkgs, lib, config, ...}: {
  home.activation.awesomewm_config = lib.hm.dag.entryAfter ["writeBoundary"] ''
  if [[ -d "${config.home.homeDirectory}/.config/awesome" ]]; then
    echo "[ INFO ] ${config.home.homeDirectory}/.config/awesome dir exists"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] mkdir ${config.home.homeDirectory}/.config/awesome"
    else
      mkdir ${config.home.homeDirectory}/.config/awesome
    fi
  fi
  if [[ "$(ls -A ${config.home.homeDirectory}/.config/awesome)" ]]; then
    echo "[ INFO ] ${config.home.homeDirectory}/.config/awesome is not empty, AwesomeWM config is probably there"
    echo "[ INFO ] If AwesomeWM config doesn't load simply delete the directory and re-run your home-manager switch command"
  else
    if [[ -v DRY_RUN ]]; then
      echo "[ DRY ] Cloning awesome_wm_config to ${config.home.homeDirectory}/.config/awesome "
    else
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/CloudyChris/awesome_wm_config ${config.home.homeDirectory}/.config/awesome
    fi
  fi
  '';
}
