let
  rev = "34bb46ef62a3069ac6cf8dca07cbfa1137822d20"; # updated 2023-04-07
  sha256 = "1jmy5wq0ni6kly5k7h6pf7kfgnbznbbrx2in2m19lxy7q2lnmfik";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
