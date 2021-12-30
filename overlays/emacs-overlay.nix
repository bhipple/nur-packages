let
  rev = "f88cb3461d09a55ded8b7d4a26e5b394e0623f14";  # updated 2021-12-30
  sha256 = "049218khyjzz6dw0n59kzjs8nn2kpq4nn6qwcwm8darc9z0idxp9";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
