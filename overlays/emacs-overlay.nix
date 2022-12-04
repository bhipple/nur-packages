let
  rev = "b0500fcaf519c6def2d1d98689941cac5d921e45";  # updated 2022-12-04
  sha256 = "1338m5hyswin8ggp9q6axsds0s9ig8mp5hv9zm9c99i8mzb3qgxn";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
