let
  rev = "81465f07ee68381dc370f9da1a882d581c335338"; # updated 2023-08-25
  sha256 = "19a9q7b9qinqklhna3cnrlhx4ml42c4ybwcmyhb8q1h4rvil6zln";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
