let
  rev = "64bda20d1a0d062e159bd0a8d398d0741af83375";
  sha256 = "1z5dyalv56fja0xcqqksccyybx0b4a9gh0wk8mk36l7kkdz3hmbp";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
