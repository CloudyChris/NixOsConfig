{ stdenvNoCC
, fetchFromGitHub
, lib
}:

stdenvNoCC.mkDerivation rec {
  pname = "nordic-cursor-theme";
  version = "0.6.0";

  src = fetchFromGitHub {
    owner = "CloudyChris";
    repo = "nordic-cursors";
    rev = "main";
    sha256 = "";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    cp -r nordic-cursors $out/share/icons
  '';

  meta = with lib; {
    description = "Cursor theme using a darker nord-based color palette and based on nordzy-cursor-theme";
    homepage = "https://github.com/CloudyChris/nordic-cursors";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
