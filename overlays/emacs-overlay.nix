let
  rev = "c1ecbd6ee4b45991444b511a22f88af2b920aee1"; # updated 2023-11-03
  sha256 = "1lzba4gg0i7vg61344i9ywi2l42krvmn6dbgy0h0r5g9c4zbvzn9";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
