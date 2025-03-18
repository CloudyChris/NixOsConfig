{ stdenvNoCC
, fetchFromGitHub
, lib
}:
stdenvNoCC.mkDerivation rec {
  name = "nord-sddm";

  src = fetchFromGitHub {
    owner = "CloudyChris";
    repo = "nord-sddm";
    rev = "8b7f76239cd2200b55a2c3176ce6ae4b022e93ed";
    hash = "sha256-fUBQorqkQGt8+YcQXUIUBrZJO7BjPcWl1ZM6p+2eY00=";
  };

  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/nord
  '';

  meta = with lib; {
    description = "SDDM theme based on nord-sddm by nautilor";
    homepage = "https://github.com/CloudyChris/nord-sddm";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
