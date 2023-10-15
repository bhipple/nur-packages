let
  rev = "5a93a5dad00a9028b8e54a40208f878c4aaf5a1c"; # updated 2023-10-15
  sha256 = "0z8gz41klsmdz2zk7fsm7z20wvh87m4r1wgsn3qdbs9jikyabxxv";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
