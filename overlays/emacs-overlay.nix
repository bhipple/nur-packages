let
  rev = "c62078053c23f1e9fd508aee5062b984016ec119";  # updated 2021-04-24
  sha256 = "0lmjsmr1fcgflk83mqs28f81nrwfwjxf6m0nl3p718809l8m599z";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
