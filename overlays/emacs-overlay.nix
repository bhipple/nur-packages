let
  rev = "cb54bfe99cdc0eeefbba60418690c4f42b790105";  # updated 2021-10-31
  sha256 = "0k5rfpxq38ijfsxap9cr95svslqnzhy0gzav58wcaqdl5m75m43p";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
