{ stdenvNoCC
, fetchFromGitHub
, lib
}:

stdenvNoCC.mkDerivation rec {
  name = "nordic-cursor-theme";

  src = fetchFromGitHub {
    owner = "CloudyChris";
    repo = "nordic-cursors";
    rev = "447bb1468fbc957a30f961f45cdd1ed2ffaaafe8";
    sha256 = "sha256-q1LEUEd/AgHwXejFNGAQKJSuPJ2bpPdgPVesClmxESQ=";
  };

  installPhase = ''
    mkdir -p $out/share/icons
    mkdir -p $out/share/icons/nordic-cursors/
    cp -r $src/* $out/share/icons/nordic-cursors/
  '';

  meta = with lib; {
    description = "Cursor theme forked from alvatip's radioactive-nord";
    homepage = "https://github.com/CloudyChris/nordic-cursors";
    license = licenses.gpl3;
    platforms = platforms.all;
  };
}
