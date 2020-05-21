let
  rev = "7107b459905f3fad1d27519fc7babed6e7e39491";
  sha256 = "12zmfycl8nv55qmdrgfn1k26iwiiq6rh5q8427dg6v3qfk58gqnb";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
