let
  rev = "c009b388c8c2514b24baf6231c5612192c25745c";  # updated 2022-11-06
  sha256 = "007nnjwdyxxa0kq12ixskxy1l312c03fwzylgiczbsnpyb2hky8i";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
