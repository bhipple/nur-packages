let
  rev = "92bd82ae2d68ddad74c61f07be7fabece7784587";  # updated 2022-06-20
  sha256 = "0npi3jcrkw3wmfqzzlp9hcxqnfprql1b4928j7yk6v3blbwa087a";
  emacs-overlay = import (
    builtins.fetchTarball {
      url = "https://github.com/nix-community/emacs-overlay/archive/${rev}.tar.gz";
      inherit sha256;
    }
  );
in
emacs-overlay
