let
  rev = "9f2a5cf6737999431c1d433fd4ed15191d2fa38b"; # updated 2023-02-26
  sha256 = "1hbhq2p4f2fwm6j1csjw6jbmv54rh0c77bx1gw6b0fxl2pr5f59b";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
