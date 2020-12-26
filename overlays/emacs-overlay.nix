let
  rev = "105f0cb92622ca79c77ef32dd4973d980340c36a";  # updated 2020-12-26
  sha256 = "0vdy1x4ys6vgn7hs7i49lkwmbif2q71mkgzmmbqhkbzdrpficdfk";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
