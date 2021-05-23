{ stdenv
, bzip2
, dbus
, fetchurl
, fontconfig
, freetype
, glib
, lib
, libGL
, libffi
, libxkbcommon_7
, makeWrapper
, pulseaudio
, qt5
, sqlite
, udev
, xorg
, xz
, zlib
}:
let

  # N.B. You have to subscribe on Patreon to get the download link.
  # The beta-src.nix file contains something that looks like this:
  /*
    version = "<redacted>";
    src = fetchurl {
      url = "https://talonvoice.com/update/<redacted>/talon-linux-${version}.tar.xz";
      sha256 = "0000000000000000000000000000000000000000000000000000";
    };
  */
  beta = import ./beta-src.nix { inherit fetchurl; };

in stdenv.mkDerivation rec {
  pname = "talon";
  inherit (beta) src version;

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    bzip2
    dbus
    fontconfig
    freetype
    glib
    libGL
    libffi
    libffi.dev
    libxkbcommon_7
    pulseaudio
    qt5.wrapQtAppsHook
    sqlite
    stdenv.cc.cc
    stdenv.cc.libc
    udev
    xorg.libX11
    xorg.libXrender
    xz
    zlib
  ];

  phases = [ "unpackPhase" "installPhase" ];

  installPhase =
    let
      libPath = lib.makeLibraryPath buildInputs;
    in
    ''
      runHook preInstall

      # Copy Talon to the Nix store
      mkdir -p "$out/share/talon"
      cp --recursive --target-directory=$out/share/talon *

      # We don't use this script, so remove it to ensure that it's not run by
      # accident.
      rm $out/share/talon/run.sh

      # Tell talon where to find glibc
      patchelf \
        --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        $out/share/talon/talon

      # Replicate 'run.sh' and add library path
      wrapProgram "$out/share/talon/talon" \
        --unset QT_AUTO_SCREEN_SCALE_FACTOR \
        --unset QT_SCALE_FACTOR \
        --set   LC_NUMERIC C \
        --set   QT_PLUGIN_PATH "$out/share/talon/lib/plugins" \
        --set   LD_LIBRARY_PATH "$out/share/talon/lib:$out/share/talon/resources/python/lib:$out/share/talon/resources/pypy/lib:${libPath}"

      # The libbz2 derivation in Nix doesn't provide the right .so filename, so
      # we fake it by adding a link in the lib/ directory
      (
        cd "$out/share/talon/lib"
        ln -s ${bzip2.out}/lib/libbz2.so.1 libbz2.so.1.0
      )

      mkdir -p "$out/bin"
      ln -s "$out/share/talon/talon" "$out/bin/talon"

      # Add a wrapped talon repl too
      sed 's|^exec .*|exec -a "$0" python3 "'$out'/share/talon/resources/repl.py"|' "$out/bin/talon" > "$out/bin/repl"
      chmod +x "$out/bin/repl"

      runHook postInstall
    '';
}
