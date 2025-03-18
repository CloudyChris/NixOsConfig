{
  stdenv,
  fetchFromGitHub,
}: {
  nord = stdenv.mkDerivation {
    name = "sddm-nord";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/nord
    '';
    src = fetchFromGitHub {
      owner = "CloudyChris";
      repo = "nord-sddm";
      rev = "8b7f76239cd2200b55a2c3176ce6ae4b022e93ed";
      hash = "sha256-fUBQorqkQGt8+YcQXUIUBrZJO7BjPcWl1ZM6p+2eY00=";
    };
  };
}
