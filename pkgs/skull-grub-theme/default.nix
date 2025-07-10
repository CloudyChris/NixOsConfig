{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  nix-update-script,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "skull-grub-theme";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "CloudyChris";
    repo = "skull-grub-theme";
    rev = "efec4d3e2b4557d2709900fb202fceac03c50e66";
    hash = "sha256-8zpQbA2Cp1KL3m6lJ39F0EObguF6hUwTrfnQEzn3Lsw=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/

    cp -r skull-grub-theme/* $out/

    runHook postInstall
  '';

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Modified grub theme, original is github:vinceliuice/Elegant-grub2-themes";
    homepage = "https://github.com/CloudyChris/skull-grub-theme";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [ CloudyChris ];
    platforms = lib.platforms.linux;
  };
})
