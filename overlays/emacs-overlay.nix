let
  rev = "9e85d89e1938256adc3e1886e5c03319c0d94630"; # updated 2023-12-09
  sha256 = "0ffzjij8ksy734gxh93maikj7cw669k5hzqh5xqnm9slyi97b31b";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
